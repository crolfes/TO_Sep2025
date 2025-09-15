module cbus_to_io_controller_bridge (
    input  wire        clk,
    input  wire        resetn,
    
    // memory bus interface
    input  wire        io_valid,
    input  wire [31:0] io_addr,
    input  wire [3:0]  io_wstrb,
    input  wire [31:0] io_wdata,
    output reg  [31:0] io_rdata,
    output reg         io_ready,

    // ios
    input              gpio_in1,
    input              gpio_in2,
    output reg         gpio_out1,
    output reg         gpio_out2,
    output reg         gpio_io1_oe,
    output reg         gpio_io2_oe,
    output reg         pwm_out
);

    // memory map
    localparam PWM_ENABLE_ADDR       = 32'h3000_0000; // [0] = enable
    localparam PWM_PERIOD_ADDR       = 32'h3000_0004; // TOP value
    localparam PWM_DUTY_CYCLE_ADDR   = 32'h3000_0008; // compare value
    localparam IO_1_ADDR             = 32'h3000_000C; // I/O
    localparam IO_2_ADDR             = 32'h3000_0010; // I/O
    localparam IO_1_OE_ADDR          = 32'h3000_0014; // I/O 1 Disable
    localparam IO_2_OE_ADDR          = 32'h3000_0018; // I/O 2 Disable
    localparam DEVICE_ID_ADDR        = 32'h3000_001C; // Device Address Reg

    reg        pwm_enable;
    reg [31:0] pwm_period;
    reg [31:0] pwm_duty;

    reg [31:0] device_address_reg;

    reg [31:0] counter;

    // two-stage synchronizers for async GPIO inputs
    reg gpio_in1_sync1, gpio_in1_sync2;
    reg gpio_in2_sync1, gpio_in2_sync2;

    always @(posedge clk) begin
        if (!resetn) begin
            gpio_in1_sync1 <= 1'b0;
            gpio_in1_sync2 <= 1'b0;
            gpio_in2_sync1 <= 1'b0;
            gpio_in2_sync2 <= 1'b0;
        end else begin
            gpio_in1_sync1 <= gpio_in1;
            gpio_in1_sync2 <= gpio_in1_sync1;
            gpio_in2_sync1 <= gpio_in2;
            gpio_in2_sync2 <= gpio_in2_sync1;
        end
    end
    
    wire gpio_in1_sync;
    wire gpio_in2_sync;

    assign gpio_in1_sync = gpio_in1_sync2;
    assign gpio_in2_sync = gpio_in2_sync2;

    // simple bus interface
    always @(posedge clk) begin
        if(!resetn) begin
            io_ready <= 1'b0;
            io_rdata <= 32'd0;

            pwm_enable <= 1'b1;
            pwm_period <= 32'd0;
            pwm_duty <= 32'd0;

            gpio_out1 <= 1'b0;
            gpio_out2 <= 1'b0;
            gpio_io1_oe <= 1'b0;
            gpio_io2_oe <= 1'b0;

            device_address_reg <= 32'd0;
        end else begin
            if (io_valid) begin
                io_ready <= 1;
                if (|io_wstrb) begin
                    case (io_addr)
                        PWM_ENABLE_ADDR     :   pwm_enable <= io_wdata[0];
                        PWM_PERIOD_ADDR     :   pwm_period <= io_wdata;
                        PWM_DUTY_CYCLE_ADDR :   pwm_duty   <= io_wdata;
                        IO_1_ADDR           :   begin gpio_out1  <= io_wdata[0]; gpio_io1_oe <= 1'b1; end
                        IO_2_ADDR           :   begin gpio_out2  <= io_wdata[0]; gpio_io2_oe <= 1'b1; end
                        IO_1_OE_ADDR        :   begin gpio_io1_oe <= io_wdata[0]; end
                        IO_2_OE_ADDR        :   begin gpio_io2_oe <= io_wdata[0]; end
                        DEVICE_ID_ADDR      :   begin device_address_reg <= io_wdata; end
                        default             :   begin pwm_enable <= pwm_enable; pwm_period <= pwm_period; pwm_duty <= pwm_duty; gpio_out1 <= gpio_out1; gpio_out2 <= gpio_out2; device_address_reg <= device_address_reg; end
                    endcase
                end else begin
                    case (io_addr)
                        PWM_ENABLE_ADDR     :   io_rdata <= {31'd0, pwm_enable};
                        PWM_PERIOD_ADDR     :   io_rdata <= pwm_period;
                        PWM_DUTY_CYCLE_ADDR :   io_rdata <= pwm_duty;
                        IO_1_ADDR           :   begin io_rdata <= {31'd0, gpio_in1_sync}; gpio_io1_oe <= 1'b0; end
                        IO_2_ADDR           :   begin io_rdata <= {31'd0, gpio_in2_sync}; gpio_io2_oe <= 1'b0; end
                        DEVICE_ID_ADDR      :   begin io_rdata <= device_address_reg; end
                        default             :   io_rdata <= io_rdata;
                    endcase
                end
            end else begin
                io_ready <= 0;
                io_rdata <= io_rdata;
                pwm_enable <= pwm_enable; 
                pwm_period <= pwm_period; 
                pwm_duty <= pwm_duty; 
                gpio_out1 <= gpio_out1; 
                gpio_out2 <= gpio_out2;
                gpio_io1_oe <= 1'b0;
                gpio_io2_oe <= 1'b0;
            end
        end
    end

    // PWM counter
    always @(posedge clk) begin
        if (!resetn) begin
            counter <= 0;
            pwm_out <= 0;
        end else begin
            if (pwm_enable) begin
                if (counter >= pwm_period) counter <= 0;
                else counter <= counter + 1;
                pwm_out <= (counter <= pwm_duty);
            end else begin
                counter <= 0;
                pwm_out <= 0;
            end
        end
    end
endmodule