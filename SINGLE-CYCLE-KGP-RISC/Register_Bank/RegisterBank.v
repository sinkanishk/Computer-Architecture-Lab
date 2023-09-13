`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////

// The register bank module. Contains 32 registers
module RegisterBank(input wire clk,input wire rst,input wire regWriteEnable, input wire [31:0] regWriteData,input wire [31:0] high,
						  input wire mult_flag,input wire [4:0] regAddr_1, output wire [31:0] regReadData_1,
						  input wire [4:0] regAddr_2, output wire [31:0] regReadData_2, input wire[4:0] regWriteAddr);
	
	reg [31:0] regArray [31:0];
	integer i; 
	reg [2:0] j;
	assign regReadData_1 = regArray[regAddr_1]; // data output
	always @ (posedge clk or posedge rst)
	begin
		if(rst)
		begin
			for(i=0;i<32;i=i+1)//Initialising all the registers to zero upon reset
				regArray[i] <= 32'd0;
		end
		else
		begin
			if(regWriteEnable) 
			begin
				j=j+1;
				regArray[regWriteAddr] <= regWriteData;
				j=j-1;
			end
			else if(mult_flag)
			begin
				regArray[19] <= high;
				j=j+1;
				regArray[20] <= regWriteData;
				j=j-1;
			end
		end
	end
	assign regReadData_2 = regArray[regAddr_2]; //data output

endmodule
