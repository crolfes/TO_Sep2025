`include "picorv32.v"
`include "spimemio.v"
`include "sram_wrapper_512x32.v"
`include "cbus_to_spi_bridge.v"
`include "cbus_to_io_controller_bridge.v"
`include "cbus_to_uart_bridge.v"
`ifndef SYNTHESIS
    `include "sg13g2_stdcell.v"
`endif

module ac_controller_soc(
    input clk,
    input resetn,
    input [31:0] irq,
    output [31:0] eoi,
    output trap,

    // spi flash interface
    output spi_flash_clk,
    output spi_flash_cs_n,
    output spi_flash_io0_oe,
	output spi_flash_io1_oe,
	output spi_flash_io2_oe,
	output spi_flash_io3_oe,
	output spi_flash_io0_do,
	output spi_flash_io1_do,
	output spi_flash_io2_do,
	output spi_flash_io3_do,
	input  spi_flash_io0_di,
	input  spi_flash_io1_di,
	input  spi_flash_io2_di,
	input  spi_flash_io3_di,

    // spi sensor interface
    output spi_sensor_clk,
    output spi_sensor_cs_n,
    output spi_sensor_mosi,
    input  spi_sensor_miso,

    // io controller interface
    input              gpio_in1,
    input              gpio_in2,
    output reg         gpio_out1,
    output reg         gpio_out2,
    output reg         gpio_io1_oe,
    output reg         gpio_io2_oe,
    output reg         pwm_out,

    // uart interface
    output ser_tx,
    input ser_rx
);

    /*

    Memory map for the common bus
    TODO: May need to change later

    +--------------+--------------+--------------+---------------------+
    | Peripheral   | Start Addr   | End Addr     | Description         |
    +--------------+--------------+--------------+---------------------+
    | SPI Flash    | 0x00000000   | 0x00FFFFFF   | External SPI Flash  |
    | SRAM         | 0x10000000   | 0x1000FFFF   | On-chip SRAM        |
    | Sensor       | 0x20000000   | 0x20000100   | Sensor registers    |
    | I/O Control  | 0x30000000   | 0x300000FF   | GPIO, etc.          |
    | UART         | 0x40000000   | 0x400000FF   | UART, etc.          |
    +--------------+--------------+--------------+---------------------+

    */

    localparam SPI_FLASH_START_ADDR = 32'h00000000;
    localparam SPI_FLASH_END_ADDR = 32'h00FFFFFF;
    localparam SRAM_START_ADDR = 32'h10000000;
    localparam SRAM_END_ADDR = 32'h1000FFFF;
    localparam SPI_SENSOR_START_ADDR = 32'h20000000;
    localparam SPI_SENSOR_END_ADDR = 32'h20000100;
    localparam IO_START_ADDR = 32'h30000000;
    localparam IO_END_ADDR = 32'h300000FF;
    localparam UART_START_ADDR = 32'h40000000;
    localparam UART_END_ADDR = 32'h400000FF;

    wire spi_flash_gated_clk;
    wire sram_gated_clk;
    wire spi_sensor_gated_clk;
    wire io_gated_clk;
    wire uart_gated_clk;

    assign spi_flash_gated_clk = clk;
    assign sram_gated_clk = clk;
    assign spi_sensor_gated_clk = clk;
    assign io_gated_clk = clk;
    assign uart_gated_clk = clk;

    // bus signals for common bus
    wire cbus_valid;
    wire cbus_ready;
    wire [3:0] cbus_wstrb;
    wire [31:0] cbus_addr;
    wire [31:0] cbus_wdata;
    wire [31:0] cbus_rdata;

    // bus signals for cpu
    wire cpu_valid;
    wire cpu_ready;
    wire [3:0] cpu_wstrb;
    wire [31:0] cpu_addr;
    wire [31:0] cpu_wdata;
    wire [31:0] cpu_rdata;

    // bus signals for sram
    wire sram_valid;
    wire sram_ready;
    wire [3:0] sram_wstrb;
    wire [31:0] sram_addr;
    wire [31:0] sram_wdata;
    wire [31:0] sram_rdata;

    // bus signals for spi_flash
    wire spi_flash_valid;
    wire spi_flash_ready;
    wire [3:0] spi_flash_wstrb;
    wire [31:0] spi_flash_addr;
    wire [31:0] spi_flash_wdata;
    wire [31:0] spi_flash_rdata;

    // bus signals for spi_flash cfg
    wire spi_flash_cfg_sel;
    wire [3:0] spi_flash_cfg_wstrb;
    wire [31:0] spi_flash_cfg_rdata;

    // bus signals for sensor
    wire spi_sensor_valid;
    wire spi_sensor_ready;
    wire [3:0] spi_sensor_wstrb;
    wire [31:0] spi_sensor_addr;
    wire [31:0] spi_sensor_wdata;
    wire [31:0] spi_sensor_rdata;

    // bus signals for i/o
    wire io_valid;
    wire io_ready;
    wire [3:0] io_wstrb;
    wire [31:0] io_addr;
    wire [31:0] io_wdata;
    wire [31:0] io_rdata;

    // bus signals for UART
    wire uart_valid;
    wire uart_ready;
    wire [3:0] uart_wstrb;
    wire [31:0] uart_addr;
    wire [31:0] uart_wdata;
    wire [31:0] uart_rdata;

    // assiging common bus signals
    assign cbus_valid = cpu_valid;
    assign cbus_wstrb = cpu_wstrb;
    assign cbus_addr  = cpu_addr;
    assign cbus_wdata = cpu_wdata;
    assign cbus_rdata = (sram_valid) ? sram_rdata :
                        (spi_flash_valid) ? spi_flash_rdata : 
                        (spi_flash_cfg_sel) ? spi_flash_cfg_rdata :
                        (spi_sensor_valid) ? spi_sensor_rdata :
                        (io_valid) ? io_rdata :
                        (uart_valid) ? uart_rdata :
                        32'd0;
    assign cbus_ready = (sram_valid) ? sram_ready :
                        (spi_flash_valid) ? spi_flash_ready : 
                        (spi_flash_cfg_sel) ? spi_flash_cfg_sel :
                        (spi_sensor_valid) ? spi_sensor_ready :
                        (io_valid) ? io_ready :
                        (uart_valid) ? uart_ready :
                        1'b0;

    // assigning cpu bus signals
    assign cpu_ready  = cbus_ready;
    assign cpu_rdata  = cbus_rdata;

    // assigning sram bus signals
    assign sram_valid = (cbus_addr >= SRAM_START_ADDR && cbus_addr <= SRAM_END_ADDR) ? cbus_valid : 1'b0;
    assign sram_wstrb = (cbus_addr >= SRAM_START_ADDR && cbus_addr <= SRAM_END_ADDR) ? cbus_wstrb : 4'b0000;
    assign sram_addr  = (cbus_addr >= SRAM_START_ADDR && cbus_addr <= SRAM_END_ADDR) ? cbus_addr  : 32'd0;
    assign sram_wdata = (cbus_addr >= SRAM_START_ADDR && cbus_addr <= SRAM_END_ADDR) ? cbus_wdata : 32'd0;

    // assigning spi_flash bus signals
    assign spi_flash_valid = (cbus_addr >= SPI_FLASH_START_ADDR && cbus_addr <= SPI_FLASH_END_ADDR) ? cbus_valid : 1'b0;
    assign spi_flash_wstrb = (cbus_addr >= SPI_FLASH_START_ADDR && cbus_addr <= SPI_FLASH_END_ADDR) ? cbus_wstrb : 4'b0000;
    assign spi_flash_addr  = (cbus_addr >= SPI_FLASH_START_ADDR && cbus_addr <= SPI_FLASH_END_ADDR) ? cbus_addr  : 32'd0;
    assign spi_flash_wdata = (cbus_addr >= SPI_FLASH_START_ADDR && cbus_addr <= SPI_FLASH_END_ADDR) ? cbus_wdata : 32'd0;

    // assigning spi_flash cfg signals
    assign spi_flash_cfg_sel = spi_flash_valid && (spi_flash_addr == SPI_FLASH_START_ADDR);
    assign spi_flash_cfg_wstrb = (spi_flash_cfg_sel) ? spi_flash_wstrb : 4'b0000;

    // assigning sensor bus signals
    assign spi_sensor_valid = (cbus_addr >= SPI_SENSOR_START_ADDR && cbus_addr <= SPI_SENSOR_END_ADDR) ? cbus_valid : 1'b0;
    assign spi_sensor_wstrb = (cbus_addr >= SPI_SENSOR_START_ADDR && cbus_addr <= SPI_SENSOR_END_ADDR) ? cbus_wstrb : 4'b0000;
    assign spi_sensor_addr  = (cbus_addr >= SPI_SENSOR_START_ADDR && cbus_addr <= SPI_SENSOR_END_ADDR) ? cbus_addr  : 32'd0;
    assign spi_sensor_wdata = (cbus_addr >= SPI_SENSOR_START_ADDR && cbus_addr <= SPI_SENSOR_END_ADDR) ? cbus_wdata : 32'd0;

    // assigning i/o bus signals
    assign io_valid = (cbus_addr >= IO_START_ADDR && cbus_addr <= IO_END_ADDR) ? cbus_valid : 1'b0;
    assign io_wstrb = (cbus_addr >= IO_START_ADDR && cbus_addr <= IO_END_ADDR) ? cbus_wstrb : 4'b0000;
    assign io_addr  = (cbus_addr >= IO_START_ADDR && cbus_addr <= IO_END_ADDR) ? cbus_addr  : 32'd0;
    assign io_wdata = (cbus_addr >= IO_START_ADDR && cbus_addr <= IO_END_ADDR) ? cbus_wdata : 32'd0;

    // assigning uart bus signals
    assign uart_valid = (cbus_addr >= UART_START_ADDR && cbus_addr <= UART_END_ADDR) ? cbus_valid : 1'b0;
    assign uart_wstrb = (cbus_addr >= UART_START_ADDR && cbus_addr <= UART_END_ADDR) ? cbus_wstrb : 4'b0000;
    assign uart_addr  = (cbus_addr >= UART_START_ADDR && cbus_addr <= UART_END_ADDR) ? cbus_addr  : 32'h00000000;
    assign uart_wdata = (cbus_addr >= UART_START_ADDR && cbus_addr <= UART_END_ADDR) ? cbus_wdata : 32'h00000000;

    // picorv32 instantiation
    picorv32 #(
        .ENABLE_COUNTERS      (1),
        .ENABLE_COUNTERS64    (1),
        .ENABLE_REGS_16_31    (1),
        .ENABLE_REGS_DUALPORT (1),
        .LATCHED_MEM_RDATA    (0),
        .TWO_STAGE_SHIFT      (1),
        .BARREL_SHIFTER       (0),
        .TWO_CYCLE_COMPARE    (0),
        .TWO_CYCLE_ALU        (0),
        .COMPRESSED_ISA       (0),
        .CATCH_MISALIGN       (1),
        .CATCH_ILLINSN        (1),
        .ENABLE_PCPI          (0),
        .ENABLE_MUL           (0),
        .ENABLE_FAST_MUL      (0),
        .ENABLE_DIV           (0),
        .ENABLE_IRQ           (0),
        .ENABLE_IRQ_QREGS     (1),
        .ENABLE_IRQ_TIMER     (1),
        .ENABLE_TRACE         (0),
        .REGS_INIT_ZERO       (0),
        .MASKED_IRQ           (32'h00000000),
        .LATCHED_IRQ          (32'hffffffff),
        .PROGADDR_RESET       (32'h00000000),
        .PROGADDR_IRQ         (32'h00000010),
        .STACKADDR            (32'hffffffff)
    ) u_picorv32 (
        .clk           (clk), // input
        .resetn        (resetn), // input
        .trap          (trap), // output

        .mem_valid     (cpu_valid), // output reg
        .mem_instr     (), // output reg
        .mem_ready     (cpu_ready), // input

        .mem_addr      (cpu_addr), // output reg [31:0]
        .mem_wdata     (cpu_wdata), // output reg [31:0]
        .mem_wstrb     (cpu_wstrb), // output reg [3:0]
        .mem_rdata     (cpu_rdata), // input [31:0]

        // Look-Ahead Interface
        .mem_la_read   (), // output
        .mem_la_write  (), // output
        .mem_la_addr   (), // output [31:0]
        .mem_la_wdata  (), // output reg [31:0]
        .mem_la_wstrb  (), // output reg [3:0]

        // Pico Co-Processor Interface (PCPI)
        .pcpi_valid    (), // output reg
        .pcpi_insn     (), // output reg [31:0]
        .pcpi_rs1      (), // output [31:0]
        .pcpi_rs2      (), // output [31:0]
        .pcpi_wr       (), // input
        .pcpi_rd       (), // input [31:0]
        .pcpi_wait     (), // input
        .pcpi_ready    (), // input

        // IRQ Interface
        .irq           (irq), // input [31:0]
        .eoi           (eoi), // output reg [31:0]

    `ifdef RISCV_FORMAL
        .rvfi_valid    (), // output reg
        .rvfi_order    (), // output reg [63:0]
        .rvfi_insn     (), // output reg [31:0]
        .rvfi_trap     (), // output reg
        .rvfi_halt     (), // output reg
        .rvfi_intr     (), // output reg
        .rvfi_mode     (), // output reg [1:0]
        .rvfi_ixl      (), // output reg [1:0]
        .rvfi_rs1_addr (), // output reg [4:0]
        .rvfi_rs2_addr (), // output reg [4:0]
        .rvfi_rs1_rdata(), // output reg [31:0]
        .rvfi_rs2_rdata(), // output reg [31:0]
        .rvfi_rd_addr  (), // output reg [4:0]
        .rvfi_rd_wdata (), // output reg [31:0]
        .rvfi_pc_rdata (), // output reg [31:0]
        .rvfi_pc_wdata (), // output reg [31:0]
        .rvfi_mem_addr (), // output reg [31:0]
        .rvfi_mem_rmask(), // output reg [3:0]
        .rvfi_mem_wmask(), // output reg [3:0]
        .rvfi_mem_rdata(), // output reg [31:0]
        .rvfi_mem_wdata(), // output reg [31:0]
        .rvfi_csr_mcycle_rmask(), // output reg [63:0]
        .rvfi_csr_mcycle_wmask(), // output reg [63:0]
        .rvfi_csr_mcycle_rdata(), // output reg [63:0]
        .rvfi_csr_mcycle_wdata(), // output reg [63:0]
        .rvfi_csr_minstret_rmask(), // output reg [63:0]
        .rvfi_csr_minstret_wmask(), // output reg [63:0]
        .rvfi_csr_minstret_rdata(), // output reg [63:0]
        .rvfi_csr_minstret_wdata(), // output reg [63:0]
    `endif

        // Trace Interface
        .trace_valid   (), // output reg
        .trace_data    ()  // output reg [35:0]
    );

    // sram instantiation
    sram_wrapper_512x32 #(
        .MEM_DELAY(1'b0)
    ) sram_wrapper_inst (
        .clk(sram_gated_clk),
        .resetn(resetn),
        .mem_valid(sram_valid),
        .mem_ready(sram_ready),
        .mem_wstrb(sram_wstrb),
        .mem_addr(sram_addr),
        .mem_wdata(sram_wdata),
        .mem_rdata(sram_rdata)
    );

    // spi flash bridge instantiation
    spimemio u_spi_flash_mem (
        .clk          (spi_flash_gated_clk), // input
        .resetn       (resetn), // input
        .valid        (spi_flash_valid), // input
        .ready        (spi_flash_ready), // output
        .addr         (spi_flash_addr), // input [23:0]
        .rdata        (spi_flash_rdata), // output reg [31:0]
        .flash_csb    (spi_flash_cs_n), // output
        .flash_clk    (spi_flash_clk), // output
        .flash_io0_oe (spi_flash_io0_oe), // output
        .flash_io1_oe (spi_flash_io1_oe), // output
        .flash_io2_oe (spi_flash_io2_oe), // output
        .flash_io3_oe (spi_flash_io3_oe), // output
        .flash_io0_do (spi_flash_io0_do), // output
        .flash_io1_do (spi_flash_io1_do), // output
        .flash_io2_do (spi_flash_io2_do), // output
        .flash_io3_do (spi_flash_io3_do), // output
        .flash_io0_di (spi_flash_io0_di), // input
        .flash_io1_di (spi_flash_io1_di), // input
        .flash_io2_di (spi_flash_io2_di), // input
        .flash_io3_di (spi_flash_io3_di), // input
        .cfgreg_we    (spi_flash_cfg_wstrb), // input [3:0]
        .cfgreg_di    (spi_flash_wdata), // input [31:0]
        .cfgreg_do    (spi_flash_cfg_rdata)  // output [31:0]
    );

    //spi sensor bridge instantiation
    cbus_to_spi_bridge u_cbus_to_spi_bridge (
        .clk(spi_sensor_gated_clk),
        .resetn(resetn),
        .spi_sensor_valid(spi_sensor_valid),
        .spi_sensor_wstrb(spi_sensor_wstrb),
        .spi_sensor_addr({spi_sensor_addr[31:4], 2'b00, spi_sensor_addr[3:2]}),
        .spi_sensor_wdata(spi_sensor_wdata),
        .spi_sensor_ready(spi_sensor_ready),
        .spi_sensor_rdata(spi_sensor_rdata),
        .spi_sensor_clk(spi_sensor_clk),
        .spi_sensor_cs_n(spi_sensor_cs_n),
        .spi_sensor_mosi(spi_sensor_mosi),
        .spi_sensor_miso(spi_sensor_miso)
    );

    // io controller bridge instantiation
    cbus_to_io_controller_bridge u_cbus_to_io_controller_bridge (
        .clk            (io_gated_clk ),
        .resetn         (resetn       ),
        .io_valid       (io_valid     ),
        .io_addr        (io_addr      ),
        .io_wstrb       (io_wstrb     ),
        .io_wdata       (io_wdata     ),
        .io_rdata       (io_rdata     ),
        .io_ready       (io_ready     ),
        .gpio_in1       (gpio_in1     ),
        .gpio_in2       (gpio_in2     ),
        .gpio_out1      (gpio_out1    ),
        .gpio_out2      (gpio_out2    ),
        .gpio_io1_oe    (gpio_io1_oe  ),
        .gpio_io2_oe    (gpio_io2_oe  ),
        .pwm_out        (pwm_out      )
    );

    // uart module instantiation
    cbus_to_uart_bridge u_cbus_to_uart_bridge (
		.clk         (uart_gated_clk),
		.resetn      (resetn      ),
		.ser_tx      (ser_tx      ),
		.ser_rx      (ser_rx      ),
        .uart_valid  (uart_valid  ),
        .uart_ready  (uart_ready  ),
		.uart_wstrb  (uart_wstrb  ),
        .uart_addr   (uart_addr   ),
        .uart_wdata  (uart_wdata  ),
        .uart_rdata  (uart_rdata  )
	);
endmodule
