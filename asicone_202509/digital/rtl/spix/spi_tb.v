`timescale 1ns/1ns

module spi_tb();

// HELPER
	function integer clogb2;
		input integer value;
		integer 	i;
		begin
			clogb2 = 0;
			for(i = 0; 2**i < value; i = i + 1)
			clogb2 = i + 1;
		end
	endfunction
	
localparam  			registers = 8;
localparam  			inputs = 6;
localparam  			sword = 8;
/*
IMPLEMENTATION SETTINGS
impl: 0,Classic  1,Simulation
syncing: 0,ByCounterAndDecoder  1,ByMirrorShiftRegister
addressing: 0,ByTristate  1,ByAGiantMux
*/
localparam			impl = 0;
localparam			syncing = 0;
localparam			addressing = 0;

// Autogen localparams
localparam numbit_address = clogb2(registers);

reg	 	CEB;
reg 	CLK;
reg	 	DATA;
reg	 	RST;
wire 	DOUT;
reg		[numbit_address-1:0] reg_num;
reg		[sword-1:0] reg_data;
reg		[sword-1:0] reg_rdata;
wire [sword*registers - 1:0] reg_o;
wire [sword*inputs - 1:0] reg_i;
reg [sword-1:0] reg_iu [0:inputs-1];
reg read, write;
	
	integer 	fd1, tmp1, ifstop;
	integer PERIOD = 4 ;
	integer READINGS = 140 ;
	integer i, j, k, error;
	
	
	SPI/* #
	(
	.registers(registers),
	.inputs(inputs),
	.sword(sword),
	.impl(impl),
	.syncing(syncing),
	.addressing(addressing)
	) */
	inst_spi
	(
	.CLK		(CLK),
	.CEB		(CEB),
	.DATA	(DATA),
	.DOUT	(DOUT),
	.RST	(RST),
	.R	(reg_o),
	.RD	(reg_i)
	); 
	
	always
	begin #(PERIOD/2) CLK = ~CLK; end 
	reg tbCLK;
	
	initial begin
		tbCLK = 0;
		# (PERIOD*9)	forever # (PERIOD*9) tbCLK = ~tbCLK;
	end

	task rexpect;
		input [sword-1:0] av, e;
		input integer i;
		begin
		 if (av == e)
			$display ("TIME=%t." , $time, " READ. Actual value of R%0d=%b, expected is %b. MATCH!", i, av, e);
		 else
		  begin
			$display ("TIME=%t." , $time, " READ. Actual value of R%0d=%b, expected is %b. ERROR!", i, av, e);
			error = error + 1;
		  end
		end
	endtask
	
	task wexpect;
		input [sword-1:0] av, e;
		input integer i;
		begin
		 if (av == e)
			$display ("TIME=%t." , $time, " WRITE. Actual value of R%0d=%b, expected is %b. MATCH!", i, av, e);
		 else
		  begin
			$display ("TIME=%t." , $time, " WRITE. Actual value of R%0d=%b, expected is %b. ERROR!", i, av, e);
			error = error + 1;
		  end
		end
	endtask


	initial begin
		$sdf_annotate("spib.sdf",inst_spi);
		//$sdf_annotate("spine.sdf",inst_spi);
		//$sdf_annotate("spi.sdf",inst_spi);
		fd1 = $fopen ("data.txt","r");
		ifstop = 0;
		CLK 	= 1'b0;
		CEB  	= 1'b1;
		DATA 	= 1'b0;
		RST 	= 1'b0;
		read = 1'b1;
		write = 1'b1;
		for (k = 0; k < inputs; k = k + 1)
		begin
			reg_iu[k] = k;
		end
		reg_num 	= {numbit_address{1'b0}};
		reg_data	= {sword{1'b0}};
		#20		CEB = 1'b1;
		RST 	= 1'b1;
		i = 0;
		error = 0;
		$timeformat(-9,0,"ns",7);
		#(PERIOD*(2+numbit_address+2*sword)*READINGS) if (error == 0)
					$display("All match");
				else
					$display("Mismatches = %d", error);
		$finish;
	end
	
	wire [sword-1:0] reg_ou [0:registers-1];
	genvar unpk_idx; 
	generate 
		for (unpk_idx=0; unpk_idx<(registers); unpk_idx=unpk_idx+1) begin 
			assign reg_ou[unpk_idx][((sword)-1):0] = reg_o[((sword)*unpk_idx+(sword-1)):((sword)*unpk_idx)]; 
		end 
	endgenerate
	
	//genvar unpk_idx; 
	generate 
		for (unpk_idx=0; unpk_idx<(inputs); unpk_idx=unpk_idx+1) begin 
			assign reg_i[((sword)*unpk_idx+(sword-1)):((sword)*unpk_idx)] = reg_iu[unpk_idx][((sword)-1):0]; 
		end 
	endgenerate
		
	always begin
		#20;
		#(PERIOD*2)	CEB = 1'b0;
		tmp1 = $fscanf (fd1,"%b",reg_data);
		DATA = write;	// For writting
		#PERIOD;
		DATA = read;	// For Reading
		#PERIOD;
		for(j = 0; j < numbit_address; j = j + 1) begin
			DATA	 = reg_num[numbit_address-j-1];
			#PERIOD;
		end
		for(j = 0; j < sword; j = j + 1) begin
			DATA	 = reg_data[sword-j-1];
			#PERIOD;
		end
		for(j = 0; j < sword; j = j + 1) begin
			#PERIOD;
			reg_rdata[sword-j-1] = DOUT;
		end
		CEB = 1'b1;
		
		#PERIOD;
		if(write == 1'b1 && reg_num < registers) begin
			wexpect(reg_ou[reg_num], reg_data, reg_num);
		end
		if(write == 1'b1 && reg_num < inputs) begin	
			rexpect(reg_rdata, reg_iu[reg_num], reg_num);
		end
		reg_num = (reg_num == (registers>inputs?registers:inputs)) ? {numbit_address{1'b0}} : reg_num + 1;
	end
	

	
	/*always @ (posedge tbCLK)
		begin
			#10
			if (i == 0)
				rexpect(R0,reg_data,i);
			if (i == 1)
				rexpect(R1,reg_data,i);
			if (i == 2)
				rexpect(R2,reg_data,i);
			if (i == 3)
				rexpect(R3,reg_data,i);
			if (i == 4)
				rexpect(R4,reg_data,i);
			if (i == 5)
				rexpect(R5,reg_data,i);
			if (i == 6)
				rexpect(R6,reg_data,i);
			if (i == 7)
				rexpect(R7,reg_data,i);
			if (i == 8)
				rexpect(R8,reg_data,i);
			if (i == 9)
				rexpect(R9,reg_data,i);
			if (i == 10)
				rexpect(R10,reg_data,i);
			if (i == 11)
				rexpect(R11,reg_data,i);
			if (i == 12)
				rexpect(R12,reg_data,i);
			if (i == 13)
				rexpect(R13,reg_data,i);
			if (i == 14)
				rexpect(R14,reg_data,i);
			if (i == 15)
			begin
				rexpect(R15,reg_data,i);
				i = -1;
			end
			i = i + 1;
		end*/
endmodule
