`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// The program counter module to change the program counter
module PC_next(input wire clk,input wire [25:0] offset,input wire branch, output reg [31:0] pc,input wire rst);
	reg [31:0] pc_next;
	reg [31:0] pc_non_jump;
	reg [31:0] pc_jump;
	reg [2:0] pc_prev;
	reg [2:0] pc_current;
	always @(posedge clk or posedge rst)
	begin
		if(rst)
		begin
			pc_next=3'b0;
			pc = 32'd0; 		// reset condition
			pc_prev=3'b0;
		end
		else
			begin
			 	// set next value of pc
				pc_non_jump = pc + 32'd4; 								// calculate pc for non-branching instructions
				pc_jump = {6'b0,(offset<<2)}; 	// calculate pc for branching instructions
				pc_next = (branch)? pc_jump: pc_non_jump; 
				pc = pc_next;
			end
	end
			// Select next pc value
endmodule
