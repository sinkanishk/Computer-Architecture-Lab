`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:53:52 10/28/2019
// Design Name:   ALU
// Module Name:   D:/ALU/ALU_TB.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_TB;

	// Inputs
	reg [31:0] inp1;
	reg [31:0] inp2;
	reg [1:0] opcode;
	reg [3:0] fcode;

	// Outputs
	wire [31:0] out;
	wire [31:0] high;
	wire carryFlag;
	wire zFlag;
	wire signFlag;
	wire overflowFlag;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.inp1(inp1), 
		.inp2(inp2), 
		.opcode(opcode), 
		.fcode(fcode), 
		.out(out), 
		.high(high), 
		.carryFlag(carryFlag), 
		.zFlag(zFlag), 
		.signFlag(signFlag), 
		.overflowFlag(overflowFlag)
	);

	initial begin
		// Initialize Inputs
		inp1 = 0;
		inp2 = 0;
		opcode = 0;
		fcode = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		inp1=-5;       //// ADDITION
		inp2=32'd4;
		opcode=2'b00;
		fcode=4'b0000;
		#10;
		
		inp1=-5;   			//// SIGNED_MULTIPLICATION 
		inp2=32'd4;
		opcode=2'b00;
		fcode=4'b0001;
		#10;
		
		inp1=-5;			  //// UNSIGNED_MULTIPLICATION
		inp2=32'd4;
		opcode=2'b00;
		fcode=4'b0010;
		#10;
		
		inp1=32'd5;		  //// 2'S COMPLEMENT
		inp2=32'd4;
		opcode=2'b00;
		fcode=4'b0011;
		#10;
		
		inp1=32'd5;		 //// AND
		inp2=32'd4;
		opcode=2'b00;
		fcode=4'b0100;
		#10;
		
		inp1=32'd5;     //// XOR
		inp2=32'd4;
		opcode=2'b00;
		fcode=4'b0101;
		#10;
		
		inp1=32'd5;		//// SHLL
		inp2=32'd4;
		opcode=2'b00;
		fcode=4'b0110;
		#10;
		
		inp1=32'd5;		////SHRL
		inp2=32'd4;
		opcode=2'b00;
		fcode=4'b0111;
		#10;
		
		inp1=32'd5;		////SHLLV
		inp2=32'd4;
		opcode=2'b00;
		fcode=4'b1000;
		#10;
		
		inp1=32'd5;		////SHLRV
		inp2=32'd4;
		opcode=2'b00;
		fcode=4'b1001;
		#10;
		
		inp1=32'd5;		////SHRA
		inp2=32'd4;
		opcode=2'b00;
		fcode=4'b1010;
		#10;
		
		inp1=32'd5;		//// SHRAV
		inp2=32'd4;
		opcode=2'b00;
		fcode=4'b1011;
		#10;
		
		
		// Add stimulus here

	end
      
endmodule

