`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////

// A D flip Flop module to branch with respect to previous flag
module DFlipFlop( input wire clk, 
				  input wire rst,
				   output reg out, 
				   input wire in);

	reg [2:0] ifid;
	wire [31:0] inst;

	always@(a or b)
	begin
			fetch_possible<=3'b111;
			ifid<=3'b101;		
	end
	always @(posedge clk  or posedge rst)
	begin
		if(rst)
		 out <= 0; // reset condition
		else
			out <= in;
	end
endmodule
