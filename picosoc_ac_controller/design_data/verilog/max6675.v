// =============================================================================
// MAX6675 memory-mapped interface for PicoSoC "iomem" bus
//   BASE+0x0 : CTRL/STATUS  [R: {..,ready,busy},  W: start (any write)]
//   BASE+0x4 : DATA         [R: {16'h0, word16}]
// =============================================================================
module max6675 #(
    parameter integer CLK_HZ   = 50_000_000,
    parameter integer SCK_HZ   = 1_000_000,     // keep <= 4.3 MHz
    parameter [31:0] BASE_ADDR = 32'h0300_0000
)(
    input  wire        clk,
    input  wire        resetn,

    // ---------------- PicoSoC iomem bus ----------------
    input  wire        iomem_valid,
    output reg         iomem_ready,
    input  wire [31:0] iomem_addr,
    input  wire [31:0] iomem_wdata,
    input  wire [3:0]  iomem_wstrb,
    output reg  [31:0] iomem_rdata,

    // ---------------- MAX6675 pins ---------------------
    output wire        cs_n,
    output wire        sck,
    input  wire        so
);
    // Address decode
    wire sel      = iomem_valid &&
                    (iomem_addr[31:3] == BASE_ADDR[31:3]); // word aligned
    wire sel_ctrl = sel && (iomem_addr[2:0] == 3'b000);
    wire sel_data = sel && (iomem_addr[2:0] == 3'b100);

    // Start on any write to CTRL
    wire start = sel_ctrl && |iomem_wstrb;

    // MAX6675 reader instance
    wire        busy, ready;
    wire [15:0] word16;

    max6675_reader #(
        .CLK_HZ(CLK_HZ),
        .SCK_HZ(SCK_HZ)
    ) u_reader (
        .clk   (clk),
        .rst   (!resetn),
        .start (start),
        .busy  (busy),
        .cs_n  (cs_n),
        .sck   (sck),
        .miso  (so),
        .data  (word16),
        .ready (ready)
    );

    // One‑cycle ready/return path for iomem
    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            iomem_ready <= 1'b0;
            iomem_rdata <= 32'h0;
        end else begin
            iomem_ready <= sel;   // single‑cycle peripheral
            if (sel_ctrl) iomem_rdata <= {30'b0, ready, busy};
            else if (sel_data) iomem_rdata <= {16'h0000, word16};
            else iomem_rdata <= 32'h0;
        end
    end
endmodule


// =============================================================================
// Tiny read-only shifter for MAX6675 (16 clocks, sample on falling edge)
// =============================================================================
module max6675_reader #(
    parameter integer CLK_HZ = 50_000_000,
    parameter integer SCK_HZ = 1_000_000
)(
    input  wire clk,
    input  wire rst,      // active high
    input  wire start,    // pulse to begin a read
    output reg  busy,
    output reg  cs_n,
    output reg  sck,
    input  wire miso,
    output reg  [15:0] data,
    output reg  ready
);
    localparam integer DIV = (CLK_HZ/(2*SCK_HZ)) < 1 ? 1 : (CLK_HZ/(2*SCK_HZ));
    reg [$clog2(DIV)-1:0] divcnt;
    reg [5:0] bitcnt;

    typedef enum reg [1:0] {IDLE, SHIFT, DONE} st_t;
    st_t st;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            st<=IDLE; cs_n<=1; sck<=0; busy<=0; ready<=0; data<=0;
            divcnt<=0; bitcnt<=0;
        end else begin
            ready<=0;
            case (st)
            IDLE: begin
                cs_n<=1; sck<=0; busy<=0;
                if (start) begin
                    busy<=1; cs_n<=0; bitcnt<=0; divcnt<=0; data<=0; st<=SHIFT;
                end
            end
            SHIFT: begin
                if (divcnt == DIV-1) begin
                    divcnt<=0; sck<=~sck;
                    if (sck) begin
                        // sample on falling edge
                        data   <= {data[14:0], miso};
                        bitcnt <= bitcnt + 1;
                        if (bitcnt == 6'd15) begin
                            sck<=0; cs_n<=1; st<=DONE;
                        end
                    end
                end else begin
                    divcnt <= divcnt + 1;
                end
            end
            DONE: begin
                busy<=0; ready<=1; st<=IDLE; // CS high starts next conversion
            end
            endcase
        end
    end
endmodule

