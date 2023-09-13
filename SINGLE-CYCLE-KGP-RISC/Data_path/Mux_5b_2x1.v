`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////

// A very basic MUX 5 bit inputs
module Mux_5b_2x1(input wire [4:0] a, 
				  input wire [4:0] b,
				  input wire select, 
				  output reg[4:0] out);
	
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
				out = b;
			else out = a;
		end


	always@(*)
	begin
			fetch_possible<=3'b111;
			ifid<=3'b101;		
	end
endmodule
