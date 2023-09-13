`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:41:34 11/06/2019
// Design Name:   TopModule
// Module Name:   D:/Deepank/Top_Module_Tb.v
// Project Name:  Deepank
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TopModule
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Top_Module_Tb;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [31:0] instruction_bit;
	wire [31:0] alu_result_bit;
	wire jump_offset_bit;
	wire sign_flag;
	wire [31:0] pc;
	wire [31:0] high;
	wire pc_bit;
	wire mult_flag;
	wire [3:0] o1;
	wire [4:0] o2;
	wire Branch1;
	wire regWrite1;
	wire MemWrite1;
	wire MemRead1;

	// Instantiate the Unit Under Test (UUT)
	TopModule uut (
		.clk(clk), 
		.rst(rst), 
		.instruction_bit(instruction_bit), 
		.alu_result_bit(alu_result_bit), 
		.jump_offset_bit(jump_offset_bit), 
		.sign_flag(sign_flag), 
		.pc(pc), 
		.high(high), 
		.pc_bit(pc_bit), 
		.mult_flag(mult_flag), 
		.o1(o1), 
		.o2(o2), 
		.Branch1(Branch1), 
		.regWrite1(regWrite1), 
		.MemWrite1(MemWrite1), 
		.MemRead1(MemRead1)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		 rst=1;
		 #10;
		 rst=0;
		 #10;
		 
		 forever #10 clk=~clk;
		// Add stimulus here

	end
      
endmodule

