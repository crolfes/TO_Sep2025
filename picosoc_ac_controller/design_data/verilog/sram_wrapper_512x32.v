`ifndef SYNTHESIS
    
`endif

`include "RM_IHPSG13_1P_core_behavioral_bm_bist.v"
`include "RM_IHPSG13_1P_512x32_c2_bm_bist.v"

module sram_wrapper_512x32 #(
    parameter MEM_DELAY = 0
) (
    input clk,
	input resetn,

	input           mem_valid,
	output          mem_ready,
	input   [ 3:0]  mem_wstrb,
	input   [31:0]  mem_addr,
	input   [31:0]  mem_wdata,
	output  [31:0]  mem_rdata
);
    localparam MEM_WAIT_STATE = 1'b0;
    localparam MEM_READY_STATE = 1'b1;

    wire mem_en;
    wire mem_wen;
    wire mem_ren;
    wire [31:0] mem_bit_mask;
    
    reg mem_ready_reg;

    assign mem_en = mem_valid;
    assign mem_wen = mem_valid & (|mem_wstrb);
    assign mem_ren = mem_valid & ~(|mem_wstrb);
    assign mem_bit_mask = {mem_wstrb[3], mem_wstrb[3], mem_wstrb[3], mem_wstrb[3], mem_wstrb[3], mem_wstrb[3], mem_wstrb[3], mem_wstrb[3],
                           mem_wstrb[2], mem_wstrb[2], mem_wstrb[2], mem_wstrb[2], mem_wstrb[2], mem_wstrb[2], mem_wstrb[2], mem_wstrb[2],
                           mem_wstrb[1], mem_wstrb[1], mem_wstrb[1], mem_wstrb[1], mem_wstrb[1], mem_wstrb[1], mem_wstrb[1], mem_wstrb[1],
                           mem_wstrb[0], mem_wstrb[0], mem_wstrb[0], mem_wstrb[0], mem_wstrb[0], mem_wstrb[0], mem_wstrb[0], mem_wstrb[0]};
    assign mem_ready = mem_ready_reg;
    
    reg ready_state;
    reg next_ready_state;

    always @(posedge clk) begin
        if(!resetn) begin
            ready_state <= 1'b0;
            mem_ready_reg <= 1'b0;
        end else begin
            ready_state <= next_ready_state;

            if(next_ready_state) begin
                mem_ready_reg <= 1'b1;
            end else begin
                mem_ready_reg <= 1'b0;
            end
        end
    end

    always @(*) begin
        case(ready_state)
            MEM_WAIT_STATE: begin
                if(mem_valid) begin
                    next_ready_state = 1'b1;
                end else begin
                    next_ready_state = 1'b0;
                end
            end
            MEM_READY_STATE: begin
                next_ready_state = 1'b0;
            end
            default: begin
                next_ready_state = 1'b0;
            end
        endcase
    end

    RM_IHPSG13_1P_512x32_c2_bm_bist sram_inst_0_RM_IHPSG13_1P_512x32_c2_bm_bist (
        .A_CLK(clk),
        .A_MEN(mem_en),
        .A_WEN(mem_wen),
        .A_REN(mem_ren),
        .A_ADDR(mem_addr[8:0]),
        .A_DIN(mem_wdata),
        .A_DLY(MEM_DELAY),
        .A_DOUT(mem_rdata),
        .A_BM(mem_bit_mask),
        .A_BIST_CLK(1'b0),
        .A_BIST_EN(1'b0),
        .A_BIST_MEN(1'b0),
        .A_BIST_WEN(1'b0),
        .A_BIST_REN(1'b0),
        .A_BIST_ADDR(9'b000000000),
        .A_BIST_DIN(32'h00000000),
        .A_BIST_BM(32'h00000000)
    );
    
endmodule