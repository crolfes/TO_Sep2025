// Complete UART Bridge RTL
module cbus_to_uart_bridge(
    input clk,
    input resetn,
    input uart_valid,
    output reg uart_ready,
    input [3:0] uart_wstrb,  // Made 4-bit for byte strobes
    input [31:0] uart_addr,
    input [31:0] uart_wdata,
    output reg [31:0] uart_rdata,
    input ser_rx,
    output reg ser_tx
);
    localparam XFER_DATA_WRITE_ADDR = 32'h40000000;
    localparam XFER_DATA_READ_ADDR = 32'h40000004;
    localparam XFER_BIT_COUNT_ADDR = 32'h40000008;
    localparam XFER_CLK_DIV_COUNT_ADDR = 32'h4000000C;


    reg [2:0] xfer_bit_count;
    reg [31:0] xfer_clk_div_count;

    always @(posedge clk) begin
        if(!resetn) begin
            xfer_bit_count <= 3'd0;
            xfer_clk_div_count <= 32'd0;
            uart_rdata <= 32'd0;
            uart_ready <= 1'b0;
        end else begin
            if(uart_valid && ~uart_ready && |uart_wstrb && (uart_addr==XFER_BIT_COUNT_ADDR)) begin
                xfer_bit_count <= uart_wdata[2:0];
                xfer_clk_div_count <= xfer_clk_div_count;
                uart_rdata <= uart_rdata;
                uart_ready <= 1'b1;
            end else if(uart_valid && ~uart_ready && |uart_wstrb && (uart_addr==XFER_CLK_DIV_COUNT_ADDR)) begin
                xfer_bit_count <= xfer_bit_count;
                xfer_clk_div_count <= uart_wdata;
                uart_rdata <= uart_rdata;
                uart_ready <= 1'b1;
            end else if(uart_valid && ~uart_ready && |uart_wstrb && (uart_addr == XFER_DATA_WRITE_ADDR) && xfer_done) begin
                xfer_bit_count <= xfer_bit_count;
                xfer_clk_div_count <= xfer_clk_div_count;
                uart_rdata <= uart_rdata;
                uart_ready <= 1'b1;
            end else if(uart_valid && ~uart_ready && ~|uart_wstrb && (uart_addr == XFER_DATA_READ_ADDR) && xfer_done) begin
                xfer_bit_count <= xfer_bit_count;
                xfer_clk_div_count <= xfer_clk_div_count;
                if(xfer_timeout) uart_rdata <= 32'h000001FF;
                else uart_rdata <= received_data;
                uart_ready <= 1'b1;
            end else begin
                xfer_bit_count <= xfer_bit_count;
                xfer_clk_div_count <= xfer_clk_div_count;
                uart_rdata <= uart_rdata;
                uart_ready <= 1'b0;
            end
        end
    end

    reg start_bit;
    reg stop_bit;
    reg xfering;
    reg [2:0] actual_bit_count;
    reg [31:0] actual_clk_div_count;
    reg xfer_done;
    
    always @(posedge clk) begin
        if(!resetn) begin
            ser_tx <= 1'b1;
            start_bit <= 1'b0;
            stop_bit <= 1'b0;
            xfering <= 1'b0;
            actual_bit_count <= 3'b000;
            actual_clk_div_count <= 32'd0;
            xfer_done = 1'b0;
        end else begin
            if(uart_valid && ~uart_ready && xfer_timeout && ~xfer_done) begin
                ser_tx <= 1'b1;
                start_bit <= 1'b0;
                stop_bit <= 1'b0;
                xfering <= 1'b1;
                actual_bit_count <= 3'b000;
                actual_clk_div_count <= 32'd0;
                xfer_done = 1'b1;
            end else if(uart_valid && ~uart_ready && (uart_addr == XFER_DATA_WRITE_ADDR) && |uart_wstrb && ~xfering) begin // write start condition start
                ser_tx <= 1'b0;
                start_bit <= 1'b1;
                stop_bit <= 1'b0;
                xfering <= 1'b1;
                actual_bit_count <= 3'b000;
                actual_clk_div_count <= 32'd0;
                xfer_done = 1'b0;
            end else if(uart_valid && ~uart_ready && (uart_addr == XFER_DATA_READ_ADDR) && ~|uart_wstrb && ~ser_rx_sync && ~xfering) begin // read start condition start
                ser_tx <= 1'b1;
                start_bit <= 1'b1;
                stop_bit <= 1'b0;
                xfering <= 1'b1;
                actual_bit_count <= 3'b000;
                actual_clk_div_count <= 32'd0;
                xfer_done = 1'b0;
            end else if(xfering && start_bit && ~stop_bit && (actual_clk_div_count < xfer_clk_div_count)) begin // start condition on going
                ser_tx <= 1'b0 | (~|uart_wstrb);
                start_bit <= 1'b1;
                stop_bit <= 1'b0;
                xfering <= 1'b1;
                actual_bit_count <= 3'b000;
                actual_clk_div_count <= actual_clk_div_count + 32'd1;
                xfer_done = 1'b0;
            end else if(xfering && start_bit && ~stop_bit && (actual_clk_div_count == xfer_clk_div_count)) begin // start condition stop
                ser_tx <= 1'b0 | (~|uart_wstrb);
                start_bit <= 1'b0;
                stop_bit <= 1'b0;
                xfering <= 1'b1;
                actual_bit_count <= 3'b000;
                actual_clk_div_count <= 32'd0;
                xfer_done = 1'b0;
            end else if(xfering && ~start_bit && ~stop_bit && (actual_bit_count == xfer_bit_count) && (actual_clk_div_count == xfer_clk_div_count)) begin // stop condition start
                ser_tx <= 1'b1 | (~|uart_wstrb);
                start_bit <= 1'b0;
                stop_bit <= 1'b1;
                xfering <= 1'b1;
                actual_bit_count <= 3'b000;
                actual_clk_div_count <= 32'd0;
                xfer_done = 1'b0;
            end else if(xfering && ~start_bit && ~stop_bit && (actual_bit_count <= xfer_bit_count) && (actual_clk_div_count < xfer_clk_div_count)) begin // data transfer
                ser_tx <= uart_wdata[actual_bit_count] | (~|uart_wstrb);
                start_bit <= 1'b0;
                stop_bit <= 1'b0;
                xfering <= 1'b1;
                actual_bit_count <= actual_bit_count;
                actual_clk_div_count <= actual_clk_div_count + 32'd1;
                xfer_done = 1'b0;
            end else if(xfering && ~start_bit && ~stop_bit && (actual_bit_count <= xfer_bit_count) && (actual_clk_div_count == xfer_clk_div_count)) begin // preparing for stop condition
                ser_tx <= uart_wdata[actual_bit_count] | (~|uart_wstrb);
                start_bit <= 1'b0;
                stop_bit <= 1'b0;
                xfering <= 1'b1;
                actual_bit_count <= actual_bit_count + 3'b001;
                actual_clk_div_count <= 32'd0;
                xfer_done = 1'b0;
            end else if(xfering && ~start_bit && stop_bit && (actual_clk_div_count < xfer_clk_div_count)) begin // stop condition on going
                ser_tx <= 1'b1 | (~|uart_wstrb);
                start_bit <= 1'b0;
                stop_bit <= 1'b1;
                xfering <= 1'b1;
                actual_bit_count <= 3'b000;
                actual_clk_div_count <= actual_clk_div_count + 32'd1;
                xfer_done = 1'b0;
            end else if(xfering && ~start_bit && stop_bit && (actual_clk_div_count == xfer_clk_div_count)) begin // stop condition on going
                ser_tx <= 1'b1 | (~|uart_wstrb);
                start_bit <= 1'b0;
                stop_bit <= 1'b0;
                xfering <= 1'b0;
                actual_bit_count <= 3'b000;
                actual_clk_div_count <= 32'd0;
                xfer_done = 1'b1;
            end else begin
                ser_tx <= ser_tx;
                start_bit <= start_bit;
                stop_bit <= stop_bit;
                xfering <= xfering;
                actual_bit_count <= actual_bit_count;
                actual_clk_div_count <= actual_clk_div_count;
                xfer_done = 1'b0;
            end
        end
    end

    // Two-stage synchronizer for asynchronous ser_rx
    reg ser_rx_sync1, ser_rx_sync2;

    always @(posedge clk) begin
        if (!resetn) begin
            ser_rx_sync1 <= 1'b1;   // UART idle line = '1'
            ser_rx_sync2 <= 1'b1;
        end else begin
            ser_rx_sync1 <= ser_rx;        // 1st flop
            ser_rx_sync2 <= ser_rx_sync1;  // 2nd flop
        end
    end

    // Synchronized RX signal
    wire ser_rx_sync = ser_rx_sync2;

    reg [31:0] received_data;

    always @(posedge clk) begin
        if(!resetn) begin
            received_data <= 32'd0;
        end else begin
            if(~start_bit && ~stop_bit && xfering && (actual_clk_div_count == xfer_clk_div_count[31:1])) begin
                received_data[actual_bit_count] <= ser_rx_sync & (~|uart_wstrb);
            end else begin
                received_data <= received_data;
            end
        end
    end

    reg [31:0] xfer_timeout_counter;
    reg xfer_timeout;

    always @(posedge clk) begin
        if(!resetn) begin
            xfer_timeout_counter <= 32'd0;
            xfer_timeout <= 1'b0;
        end else begin
            if(~|uart_wstrb && xfer_timeout_counter < 32'hFFFFFFFF && ~xfer_timeout) begin
                xfer_timeout_counter <= xfer_timeout_counter + 32'd1;
                xfer_timeout <= 1'b0;
            end else if(~|uart_wstrb && xfer_timeout_counter == 32'hFFFFFFFF && ~xfer_timeout) begin
                xfer_timeout_counter <= 32'd0;
                xfer_timeout <= 1'b1;
            end else if(~|uart_wstrb && xfer_timeout) begin
                xfer_timeout_counter <= 32'd0;
                xfer_timeout <= 1'b0;
            end else begin
                xfer_timeout_counter <= xfer_timeout_counter;
                xfer_timeout <= 1'b0;
            end
        end
    end
endmodule