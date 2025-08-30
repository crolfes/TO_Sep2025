// Created by: CKDUR
`timescale 1ns/1ns

module SPI #
    (
    parameter                           registers = 8,
    parameter                           inputs = 6,
    parameter                           sword = 8,

    /*
    IMPLEMENTATION SETTINGS
    syncing: 0,ByCounterAndDecoder  1,ByMirrorShiftRegister
    addressing: 0,ByTristate  1,ByAGiantMux
    */
    parameter                           syncing = 0,
    parameter                           addressing = 1
    )

    (
    // SPI INTERFACE
    input                               CEB,
    input                               CLK,
    input                               DATA,
    output                              DOUT_DAT,
    output                              DOUT_EN,
    // MISC
    input                               RST,
    // INTERFACE
    output reg [registers*sword-1:0]    R,
    input [inputs*sword-1:0]            RD
    );

    // HELPER
    function integer clogb2;
        input integer value;
        integer     i;
        begin
            clogb2 = 0;
            for(i = 0; 2**i < value; i = i + 1)
            clogb2 = i + 1;
        end
    endfunction
    
    localparam numbit_instr = 2;                    // Nop (00), Read(01), Write(10)
    localparam maxobj = (registers>inputs?registers:inputs);
    localparam numbit_address = clogb2(maxobj);
    localparam numbit_waddress = clogb2(registers);
    localparam numbit_raddress = clogb2(inputs);
    localparam numbit_handshake = numbit_instr+numbit_address+sword;
    localparam numbit_posthandshake = numbit_instr+numbit_address+sword+sword;
    localparam numbit_prehandshake = numbit_instr+numbit_address;
    reg    [numbit_handshake-1:0]    sft_reg;       // Because address + word width
    wire [numbit_waddress-1:0]    addr;             // Address For Writting
    wire [numbit_raddress-1:0]    raddr;            // Address For Reading
    wire [sword-1:0]            word;               // Word
    reg                         we;                 // Instruction Write
    reg                         re;                 // Instruction Read
    wire [registers-1:0]        dec_o;              // The enables for Output
    wire [inputs-1:0]        dec_i;                 // The enables for Input
    genvar                        i;
    wire                         endo;              // Enable handshake

    // Serial to paralell registers
    always @ (posedge CLK or negedge RST)
    begin
        if(RST == 1'b0)
        begin
            sft_reg <= {numbit_handshake{1'b0}};                // RESET
        end else if(CEB == 1'b0 && endo == 1'b1)
        begin
            sft_reg <= {sft_reg[numbit_handshake-2:0], DATA};   // SHIFT
        end else
        begin
            sft_reg <= sft_reg;                                 // NOTHING
        end
    end

    assign addr = sft_reg[numbit_waddress-1+sword:sword];       // Full handshake
    assign raddr = sft_reg[numbit_raddress-1:0];                // When the handshake is on addr
    assign word = sft_reg[sword-1:0];

    // SPI SYNC
    /*
    sync
    + + + + + + + + + + + + + + + + + + + + + + + + + + + +
    |post-1           |numbit_handshake-1                 |
     MOSI is DOUT     |   data_in   |        addr     | r w
    */
    wire [numbit_posthandshake - 1:0] sync;
    generate if(syncing) begin
        localparam numbit_counter = clogb2(numbit_posthandshake);
        reg [numbit_counter - 1:0] counter;
        always @ (posedge CLK or negedge RST)
        begin
            if(RST == 1'b0)
            begin
                counter <= {numbit_counter{1'b0}};      // RESET 
            end else 
            begin
                if(CEB == 1'b1)
                begin
                    counter <= {numbit_counter{1'b0}};  // RESET
                end else
                begin
                    counter <= counter+1;               // COUNTING
                end
            end
        end
        assign sync = (1 << counter);
    end else begin
        reg [numbit_posthandshake - 1:0] counter;
        always @ (posedge CLK or negedge RST)
        begin
            if (RST == 1'b0)
            begin
                counter <= {{(numbit_posthandshake-1){1'b0}},1'b1};     // RESET 
            end else 
            begin
                if (CEB == 1'b1)
                begin
                    counter <= {{(numbit_posthandshake-1){1'b0}},1'b1}; // RESET 
                end else
                begin
                    counter <= counter << 1;                            // SHIFTING
                end
            end
        end
        assign sync = counter;
    end
    endgenerate

    // we / re handshaking
    always @ (posedge CLK or negedge RST)
    begin
        if(RST == 1'b0)
        begin
            we <= 1'b0;                                                 // RESET
            re <= 1'b0;
        end else if(CEB == 1'b0)
        begin
            if(sync[0] == 1'b1) begin    
                we <= DATA;
            end
            if(sync[1] == 1'b1) begin
                re <= DATA;
            end
        end
    end
    
    wire enw, eno, encap;
    // Enable output thing
    assign eno = |sync[numbit_posthandshake-1:numbit_handshake] & re;
    // Enable write to register
    assign enw = sync[numbit_handshake] & we;
    // Enable handshake
    assign endo = |sync[numbit_handshake-1:0];
    // Enable capture
    assign encap = sync[numbit_address+2];

    // Addressing for reading
    wire [sword-1:0] bus_rd;
    wire [sword-1:0] RDA [0:inputs-1];
    //`define UNPACK_ARRAY(PK_WIDTH,PK_LEN,PK_DEST,PK_SRC)
    //`UNPACK_ARRAY(sword,inputs,RDA,RD)
    genvar unpk_idx; 
    generate 
        for (unpk_idx=0; unpk_idx<(inputs); unpk_idx=unpk_idx+1) begin 
            assign RDA[unpk_idx][((sword)-1):0] = RD[((sword)*unpk_idx+(sword-1)):((sword)*unpk_idx)]; 
        end 
    endgenerate
    
    generate
        if(addressing) begin
            // Giant MUX
            assign bus_rd = RDA[addr];
        end else begin
            // tri-state buff bus
            wire [inputs*sword-1:0] trib_rd;
            for (i = 0; i < inputs; i = i + 1) begin 
                assign trib_rd[(i+1)*sword - 1:i*sword] = dec_i[i]?RD[(i+1)*sword - 1:i*sword]:{sword{1'b0}};
            end
            for (i = 0; i < inputs; i = i + 1) begin 
                assign bus_rd = trib_rd[(i+1)*sword - 1:i*sword];
            end
        end
    endgenerate

    // Capturing the value to put to Dout
    reg [sword-1:0] bus_cap;
    always @ (posedge CLK or negedge RST)
    begin
        if(RST == 1'b0)
        begin
            bus_cap <= {sword{1'b0}};   // RESET
        end else if(encap == 1'b1)
        begin
            bus_cap <= bus_rd;          // CAPTURE
        end else if(eno == 1'b1)
        begin
            bus_cap <= bus_cap << 1;    // SHIFT
        end
    end

    // with reg for putting the Dout
    reg DOUTNOZ;
    always @ (posedge CLK or negedge RST)
    begin
        if(RST == 1'b0)
        begin
            DOUTNOZ <= 1'b0;
        end else if(eno == 1'b0)
        begin
            DOUTNOZ <= 1'b0;
        end else
        begin
            DOUTNOZ <= bus_cap[sword-1];
        end
    end
    
    // tri-state out
    reg enoz;
    always @ (posedge CLK or negedge RST)
    begin
        if(RST == 1'b0)
        begin
            enoz <= 1'b0;
        end else if(eno == 1'b0)
        begin
            enoz <= 1'b0;
        end else
        begin
            enoz <= 1'b1;
        end
    end
    
    assign DOUT_EN = enoz&!CEB;
    assign DOUT_DAT = DOUTNOZ;
    
    // enable decoder writes
    assign dec_o = enw?(1 << addr):{registers{1'b0}};
    // enable decoder inputs
    assign dec_i = encap?(1 << raddr):{registers{1'b0}};
    
    // "registers" word-bit reg
    generate
        for (i = 0; i < registers; i = i + 1)
        begin 
            always @ (posedge CLK or negedge RST) begin
                if ( RST == 1'b0 )
                begin
                    R[(i+1)*sword - 1:i*sword] <= {sword{1'b0}};                // RESET
                end else if(dec_o[i] == 1'b1)
                begin
                    R[(i+1)*sword - 1:i*sword] <= word;                         // WRITE
                end    else
                begin
                    R[(i+1)*sword - 1:i*sword] <= R[(i+1)*sword - 1:i*sword];   // NOTHING
                end
            end
        end
    endgenerate

endmodule

