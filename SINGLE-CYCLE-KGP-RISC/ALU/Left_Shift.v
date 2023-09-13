`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:02:37 08/26/2019 
// Design Name: 
// Module Name:    Left_Shift 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Left_Shift(
    input [31:0] a,
    input [31:0] b,
    output reg [63:0] product
    );
  
  

	 reg [31:0] multiplier;
	 reg [31:0] multiplicand;
	 reg [63:0] temp;
	 integer i;
	 
	
	 always @(*)
	 begin
		      i=0;
				product =64'b0;
				multiplier=a;
				multiplicand =b;
				temp = {32'b0,multiplicand};
		repeat(32)
		begin  
				if(multiplier[i]==1)
				begin
					product=product+((temp)<<i);
				end
				i=i+1;
		end
	 end
endmodule
