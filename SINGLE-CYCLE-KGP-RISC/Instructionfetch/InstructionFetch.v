`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////

// A module to read the input instructions using the BRAM
module InstructionFetch(input wire [31:0] pc,output reg [31:0] instruction,input wire clk,input wire rst);
	reg [2:0] fetch_possible;
	wire [4:0] rom_address;
	assign rom_address = pc[6:2];
	reg [2:0] ifid;
	wire [31:0] inst;

	always@(negedge rst)
	begin
			fetch_possible<=3'b111;
			ifid<=3'b101;		
	end
	
	blk_mem_gen_v7_3 instruction_memory(.clka(clk),.rsta(rst),.ena(1'b1),.wea(1'b0),.addra(rom_address),.dina(32'd0),.douta(inst));
	

	always@(posedge clk or posedge rst)
	begin
		ifid<=0;
		instruction <= inst;
		fetch_possible<=0;
		if(rst)
		begin
			fetch_possible<=3'b111;
			instruction<=32'b11111111111111111111111111111111;
			ifid<=3'b101;		
		end
		ifid<=3'b010;
		fetch_possible=3'b100;
	end

	always@(negedge clk)
	begin
			fetch_possible<=3'b111;
			ifid<=3'b101;		
	end


endmodule
