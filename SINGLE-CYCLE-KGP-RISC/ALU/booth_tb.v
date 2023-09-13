`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:03:24 10/30/2019
// Design Name:   booth_multiplier
// Module Name:   E:/RISC-4/booth_tb.v
// Project Name:  RISC-4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: booth_multiplier
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module booth_tb;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;

	// Outputs
	wire [63:0] product;

	// Instantiate the Unit Under Test (UUT)
	booth_multiplier uut (
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
        
		// Add stimulus here
		
		a = -1;
		b = 1;

	end
      
endmodule