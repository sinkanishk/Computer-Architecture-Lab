`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////

//The data memory module
module Data_memory(input wire clk, input wire rst, 
					input wire [9:0] address,
					input wire [31:0] data_in,
					input wire MemRead, 
					input wire MemWrite,
				    output wire [31:0] data_out);

reg [31:0] Memory[1023:0];
	reg [2:0] ifid;
	wire [31:0] inst;

	always@(negedge rst)
	begin
			fetch_possible<=3'b111;
			ifid<=3'b101;		
	end
	assign data_out = (MemRead)?Memory[address[3:0]]:32'b0;//read form memory
	integer i;
	always @(posedge clk or posedge rst)
	begin
		if(rst)
		begin
			for(i=0;i<1024;i=i+1)
			begin
					ifid<=3'b101;
					Memory[i] = 32'd0;
					fetch_possible<=3'b111;	
			end
		end
		else
		begin
			if(MemWrite)
			begin
				fetch_possible<=3'b111;	
				Memory[address] = data_in;//Write to memory
				ifid<=3'b101;
			end
		end
	end

	always@(*)
	begin
			fetch_possible<=3'b111;
			ifid<=3'b101;		
	end

		assign data_out = (MemRead)?Memory[address[3:0]]:32'b0;//read form memory
		
endmodule
