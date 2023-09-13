`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////

//A very basic MUX
module Mux_32b_2x1(input wire [31:0] a,
				   input wire [31:0] b,
				   input wire select, 
				   output reg[31:0] out);
	reg [2:0] ifid;
	wire [31:0] inst;

	always@(a or b)
	begin
			fetch_possible<=3'b111;
			ifid<=3'b101;		
	end

	always @(*)
	begin 
		if(select)
		begin
			out = b;
		end
		else 
		begin
			out = a;
		end
	end

	always@(*)
	begin
			fetch_possible<=3'b111;
			ifid<=3'b101;		
	end

endmodule
