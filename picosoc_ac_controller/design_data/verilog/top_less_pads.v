`ifndef SYNTHESIS
    `include "sg13g2_io.v"
`endif
`include "ac_controller_soc.v"

module top_less_pads(
    input clk_pad,
    input resetn_pad,

    // spi flash interface
    output spi_flash_clk_pad,
    output spi_flash_cs_n_pad,
    inout spi_flash_io0_pad,
    inout spi_flash_io1_pad,
    inout spi_flash_io2_pad,
    inout spi_flash_io3_pad,

    // spi sensor interface
    output spi_sensor_clk_pad,
    output spi_sensor_cs_n_pad,
    output spi_sensor_mosi_pad,
    input  spi_sensor_miso_pad,

    // gpio and pwm interface
    inout gpio_1_pad,
    inout gpio_2_pad,
    output pwm_out_pad,

    // UART insterface
    output ser_tx_pad,
    input ser_rx_pad,

    output x1_pad,
    output x2_pad,
    output x3_pad
);

// general ports
    wire clk;
    wire resetn;

    sg13g2_IOPadIn sg13g2_IOPadIn_clk_pad_inst (
        .pad(clk_pad),
        .p2c(clk)
    );

    sg13g2_IOPadIn sg13g2_IOPadIn_resetn_pad_inst (
        .pad(resetn_pad),
        .p2c(resetn)
    );

    // spi flash i/o
    wire spi_flash_clk;
    wire spi_flash_cs_n;
    wire spi_flash_io0_oe;
	wire spi_flash_io1_oe;
	wire spi_flash_io2_oe;
	wire spi_flash_io3_oe;
	wire spi_flash_io0_do;
	wire spi_flash_io1_do;
	wire spi_flash_io2_do;
	wire spi_flash_io3_do;
	wire spi_flash_io0_di;
	wire spi_flash_io1_di;
	wire spi_flash_io2_di;
	wire spi_flash_io3_di;

    sg13g2_IOPadOut16mA sg13g2_IOPadOut16mA_spi_flash_clk_pad_inst (
        .pad(spi_flash_clk_pad),
        .c2p(spi_flash_clk)
    );

    sg13g2_IOPadOut16mA sg13g2_IOPadOut16mA_spi_flash_cs_n_pad_inst (
        .pad(spi_flash_cs_n_pad),
        .c2p(spi_flash_cs_n)
    );

    sg13g2_IOPadInOut16mA sg13g2_IOPadInOut16mA_spi_flash_io0_pad_inst (
        .pad(spi_flash_io0_pad),
        .c2p(spi_flash_io0_do),
        .p2c(spi_flash_io0_di),
        .c2p_en(spi_flash_io0_oe)
    );

    sg13g2_IOPadInOut16mA sg13g2_IOPadInOut16mA_spi_flash_io1_pad_inst (
        .pad(spi_flash_io1_pad),
        .c2p(spi_flash_io1_do),
        .p2c(spi_flash_io1_di),
        .c2p_en(spi_flash_io1_oe)
    );

    sg13g2_IOPadInOut16mA sg13g2_IOPadInOut16mA_spi_flash_io2_pad_inst (
        .pad(spi_flash_io2_pad),
        .c2p(spi_flash_io2_do),
        .p2c(spi_flash_io2_di),
        .c2p_en(spi_flash_io2_oe)
    );

    sg13g2_IOPadInOut16mA sg13g2_IOPadInOut16mA_spi_flash_io3_pad_inst (
        .pad(spi_flash_io3_pad),
        .c2p(spi_flash_io3_do),
        .p2c(spi_flash_io3_di),
        .c2p_en(spi_flash_io3_oe)
    );

    // spi sensor to i/o
    wire spi_sensor_clk;
    wire spi_sensor_cs_n;
    wire spi_sensor_mosi;
    wire spi_sensor_miso;

    sg13g2_IOPadOut16mA sg13g2_IOPadOut16mA_spi_sensor_clk_pad_inst (
        .pad(spi_sensor_clk_pad),
        .c2p(spi_sensor_clk)
    );
    sg13g2_IOPadOut16mA sg13g2_IOPadOut16mA_spi_sensor_cs_n_pad_inst (
        .pad(spi_sensor_cs_n_pad),
        .c2p(spi_sensor_cs_n)
    );
    sg13g2_IOPadOut16mA sg13g2_IOPadOut16mA_spi_sensor_mosi_pad_inst (
        .pad(spi_sensor_mosi_pad),
        .c2p(spi_sensor_mosi)
    );
    sg13g2_IOPadIn sg13g2_IOPadIn_spi_sensor_miso_pad_inst (
        .pad(spi_sensor_miso_pad),
        .p2c(spi_sensor_miso)
    );

    // gpios
    wire gpio_in1;
    wire gpio_in2;
    wire gpio_out1;
    wire gpio_out2;
    wire gpio_io1_oe;
    wire gpio_io2_oe;
    wire pwm_out;

    sg13g2_IOPadInOut16mA sg13g2_IOPadInOut16mA_gpio_1_pad_inst (
        .pad(gpio_1_pad),
        .c2p(gpio_out1),
        .p2c(gpio_in1),
        .c2p_en(gpio_io1_oe)
    );

    sg13g2_IOPadInOut16mA sg13g2_IOPadInOut16mA_gpio_2_pad_inst (
        .pad(gpio_2_pad),
        .c2p(gpio_out2),
        .p2c(gpio_in2),
        .c2p_en(gpio_io2_oe)
    );

    sg13g2_IOPadOut16mA sg13g2_IOPadOut16mA_pwm_out_pad_inst (
        .pad(pwm_out_pad),
        .c2p(pwm_out)
    );

    // uart interface
    wire ser_rx;
    wire ser_tx;
    
    sg13g2_IOPadOut16mA sg13g2_IOPadOut16mA_ser_tx_pad_inst (
        .pad(ser_tx_pad),
        .c2p(ser_tx)
    );
    sg13g2_IOPadIn sg13g2_IOPadIn_ser_rx_pad_inst (
        .pad(ser_rx_pad),
        .p2c(ser_rx)
    );

    wire x1;
    wire x2;
    wire x3;

    assign x1 = 0;
    assign x2 = 0;
    assign x3 = 1;

    sg13g2_IOPadOut16mA sg13g2_IOPadOut16mA_x1 (
        .pad(x1_pad),
        .c2p(x1)
    );
    sg13g2_IOPadOut16mA sg13g2_IOPadOut16mA_x2 (
        .pad(x2_pad),
        .c2p(x2)
    );
    sg13g2_IOPadOut16mA sg13g2_IOPadOut16mA_x3 (
        .pad(x3_pad),
        .c2p(x3)
    );

    ac_controller_soc u_ac_controller_soc_inst (
        .clk(clk),
        .resetn(resetn),
        .spi_flash_clk(spi_flash_clk),
        .spi_flash_cs_n(spi_flash_cs_n),
        .spi_flash_io0_do(spi_flash_io0_do),
        .spi_flash_io1_do(spi_flash_io1_do),
        .spi_flash_io2_do(spi_flash_io2_do),
        .spi_flash_io3_do(spi_flash_io3_do),
        .spi_flash_io0_di(spi_flash_io0_di),
        .spi_flash_io1_di(spi_flash_io1_di),
        .spi_flash_io2_di(spi_flash_io2_di),
        .spi_flash_io3_di(spi_flash_io3_di),
        .spi_flash_io0_oe(spi_flash_io0_oe),
        .spi_flash_io1_oe(spi_flash_io1_oe),
        .spi_flash_io2_oe(spi_flash_io2_oe),
        .spi_flash_io3_oe(spi_flash_io3_oe),
        .spi_sensor_clk(spi_sensor_clk),
        .spi_sensor_cs_n(spi_sensor_cs_n),
        .spi_sensor_mosi(spi_sensor_mosi),
        .spi_sensor_miso(spi_sensor_miso),
        .gpio_in1       (gpio_in1     ),
        .gpio_in2       (gpio_in2     ),
        .gpio_out1      (gpio_out1    ),
        .gpio_out2      (gpio_out2    ),
        .gpio_io1_oe    (gpio_io1_oe  ),
        .gpio_io2_oe    (gpio_io2_oe  ),
        .pwm_out        (pwm_out      ),
        .ser_tx (ser_tx),
        .ser_rx(ser_rx)
    );

endmodule