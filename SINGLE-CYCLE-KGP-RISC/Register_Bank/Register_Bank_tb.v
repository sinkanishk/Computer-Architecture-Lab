`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:18:01 11/06/2019
// Design Name:   RegisterBank
// Module Name:   D:/New folder/KGP_RISC/KGP_RISC/Register_bank_Tb.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RegisterBank
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Register_bank_Tb;

	// Inputs
	reg clk;
	reg rst;
	reg regWriteEnable;
	reg [31:0] regWriteData;
	reg [4:0] regAddr_1;
	reg [4:0] regAddr_2;
	reg [4:0] regWriteAddr;

	// Outputs
	wire [31:0] regReadData_1;
	wire [31:0] regReadData_2;

	// Instantiate the Unit Under Test (UUT)
	RegisterBank uut (
		.clk(clk), 
		.rst(rst), 
		.regWriteEnable(regWriteEnable), 
		.regWriteData(regWriteData), 
		.regAddr_1(regAddr_1), 
		.regReadData_1(regReadData_1), 
		.regAddr_2(regAddr_2), 
		.regReadData_2(regReadData_2), 
		.regWriteAddr(regWriteAddr)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		regWriteEnable = 0;
		regWriteData = 0;
		regAddr_1 = 0;
		regAddr_2 = 0;
		regWriteAddr = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		clk=1;
		rst=1;
		#10;
		
		clk=0;
		rst=0;
		#10;
		

		clk=1;
		regWriteEnable=0;
		regWriteData=5;
		regAddr_1=2;
	   regAddr_2=3;
	   regWriteAddr=4;
		#10;

	   	clk=0;
		#10;
		
		clk=1;
		regWriteEnable=0;
		regWriteData=5;
		regAddr_1=2;
	   	regAddr_2=3;
	   	regWriteAddr=4;
		
		clk=0;
		#10;
		
		clk=1;
		regWriteEnable=1;
		regWriteData=5;
		regAddr_1=2;
	   regAddr_2=3;
	   regWriteAddr=2;
		#10;
		

		
		forever #10 clk=~clk;
		
		
		
		
        
		// Add stimulus here

	end
      
endmodule

