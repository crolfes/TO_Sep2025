module cbus_to_spi_bridge (
    input         clk,
    input         resetn,
    
    // bus interface
    input         spi_sensor_valid,
    input  [3:0]  spi_sensor_wstrb,
    input  [31:0] spi_sensor_addr,
    input  [31:0] spi_sensor_wdata,
    output        spi_sensor_ready,
    output [31:0] spi_sensor_rdata,

    // spi sensor interface (mode 0)
    output        spi_sensor_clk,
    output        spi_sensor_cs_n,
    output        spi_sensor_mosi,
    input         spi_sensor_miso
);
    /*
    +-----------------------+-------------------------------+-----------------------------------+
    | Register              | Address                       | Description                       |
    +-----------------------+-------------------------------+-----------------------------------+
    | write_read_byte_count | 32'h20000100                  | SPI transfer byte count           |
    +-----------------------+-------------------------------+-----------------------------------+
    */

    localparam WRITE_READ_BYTE_COUNT_ADDR = 32'h20000100;

    // internal register to program
    reg [1:0] write_read_byte_count;

    always @(posedge clk) begin
        if (!resetn) begin
            write_read_byte_count <= 2'b00;
        end else begin
            if (spi_sensor_valid && (spi_sensor_addr == WRITE_READ_BYTE_COUNT_ADDR) && (|spi_sensor_wstrb)) begin
                write_read_byte_count <= spi_sensor_wdata[1:0];
            end else begin
                write_read_byte_count <= write_read_byte_count;
            end
        end
    end

    // finding the proper transfer length
    reg [5:0] write_read_bit_count;

    always @(posedge clk) begin
        if(!resetn) begin
            write_read_bit_count <= 6'd16;
        end else begin
            case (write_read_byte_count)
                2'b00: write_read_bit_count <= 6'd16;  // 1 byte
                2'b01: write_read_bit_count <= 6'd24;  // 2 bytes
                2'b10: write_read_bit_count <= 6'd32;  // 3 bytes
                2'b11: write_read_bit_count <= 6'd48;  // 4 bytes
                default: write_read_bit_count <= 6'd16;
            endcase
        end
    end

    reg [5:0] current_bit_count;
    always @(posedge clk) begin
        if(!resetn) begin
            current_bit_count <= 6'd0;
        end else begin
            if(spi_clk_reg) begin
                current_bit_count <= current_bit_count + 6'd1;
            end else if(current_bit_count == write_read_bit_count) begin
                current_bit_count <= 6'd0;
            end else begin
                current_bit_count <= current_bit_count;
            end
        end
    end

    reg spi_clk_reg;
    assign spi_sensor_clk = spi_clk_reg;

    always @(posedge clk) begin
        if (!resetn) begin
            spi_clk_reg <= 1'b0;
        end else begin
            if (~spi_cs_n_reg && (current_bit_count < write_read_bit_count)) begin
                spi_clk_reg <= ~spi_clk_reg; // toggle clock
            end else begin
                spi_clk_reg <= 1'b0; // idle low
            end
        end
    end

    reg spi_cs_n_reg;
    assign spi_sensor_cs_n = spi_cs_n_reg;
    
    always @(posedge clk) begin
        if (!resetn) begin
            spi_cs_n_reg <= 1'b1; // inactive
        end else begin
            if (current_bit_count == write_read_bit_count) begin
                spi_cs_n_reg <= 1'b1; // inactive
            end else if (spi_sensor_valid && ~spi_sensor_ready && (spi_sensor_addr <= 32'h200000FF)) begin
                spi_cs_n_reg <= 1'b0; // active
            end else begin
                spi_cs_n_reg <= spi_cs_n_reg; // hold state
            end
        end
    end

    reg spi_sensor_ready_reg;
    assign spi_sensor_ready = spi_sensor_ready_reg;

    always @(posedge clk) begin
        if (!resetn) begin
            spi_sensor_ready_reg <= 1'b0;
        end else begin
            if(spi_sensor_valid && ~spi_sensor_ready && (spi_sensor_addr > 32'h200000FF)) begin
                spi_sensor_ready_reg <= 1'b1;
            end else if (spi_sensor_valid && ~spi_sensor_ready && (current_bit_count == write_read_bit_count)) begin
                spi_sensor_ready_reg <= 1'b1;
            end else begin
                spi_sensor_ready_reg <= 1'b0;
            end
        end
    end

    // transfer data
    reg [39:0] data_to_send;
    assign spi_sensor_mosi = ((|spi_sensor_wstrb) || (~(|spi_sensor_wstrb) && (current_bit_count < 6'd8))) ? data_to_send[39] : 1'b0;

    always @(posedge clk) begin
        if(!resetn) begin
            data_to_send <= 40'd0;
        end else begin
            if(spi_sensor_valid & spi_cs_n_reg) begin
                data_to_send <= {spi_sensor_addr[7:0], spi_sensor_wdata[7:0], spi_sensor_wdata[15:8], spi_sensor_wdata[23:16], spi_sensor_wdata[31:24]};
            end else if (spi_sensor_valid & ~spi_cs_n_reg & spi_clk_reg) begin
                data_to_send <= {data_to_send[38:0], data_to_send[39]};
            end else begin
                data_to_send <= data_to_send;
            end
        end
    end

    
    reg [31:0] data_to_capture;
    assign spi_sensor_rdata = data_to_capture;

    always @(posedge clk) begin
        if(!resetn) begin
            data_to_capture <= 32'd0;
        end else begin
            if(spi_sensor_valid && ~(|spi_sensor_wstrb) && current_bit_count >= 6'd8 && ~spi_clk_reg) begin
                data_to_capture <= {data_to_capture[30:0], spi_sensor_miso};
            end else if(spi_sensor_valid && ~(|spi_sensor_wstrb) && (spi_sensor_addr == 32'h20000100)) begin
                data_to_capture <= write_read_byte_count;
            end else if(~spi_sensor_valid) begin
                data_to_capture <= 32'd0;
            end else begin
                data_to_capture <= data_to_capture;
            end
        end
    end

endmodule
