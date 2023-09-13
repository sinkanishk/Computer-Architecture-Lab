`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:00:22 10/30/2019
// Design Name:   Left_Shift
// Module Name:   D:/ALU/Left_Shift_TB.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Left_Shift
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Left_Shift_TB;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;

	// Outputs
	wire [63:0] product;

	// Instantiate the Unit Under Test (UUT)
	Left_Shift uut (
		.a(a), 
		.b(b), 
		.product(product)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		a=32'd5;
		b=32'd4;
		
		#100;
		a=-5;
		b=4;
		// Add stimulus here

	end
      
endmodule

