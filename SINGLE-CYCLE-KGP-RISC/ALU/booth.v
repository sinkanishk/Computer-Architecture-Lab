`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:48:49 09/02/2019 
// Design Name: 
// Module Name:    booth_multiplier 
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
module booth_multiplier(
    input [31:0] a,
    input [31:0] b,
    output reg [63:0] product
	 );

	reg [32:0] Q = 32'b00000000000000000000000000000000;
	reg [31:0] A;
	reg [31:0] B;
	reg [31:0] Accu;
	reg [1:0] state;
	reg shift;
	 
	always @(*)
	begin
		product =0;
		A = a;
		B = b;
		Q = {a,1'b0};
		Accu = 32'b000000;
		
		repeat(32)
		begin
		 state = Q[1:0]; 	
		 case( state )
			 2'b00:
			 begin
					Q = {Accu[0],Q[32:1]};
					Accu[4:0] = Accu[31:1];
			 end
			 
			 2'b11:
			 begin
					Q = {Accu[0],Q[32:1]};
					Accu[4:0] = Accu[31:1];
			 end

			 2'b01:
			 begin
					Accu = Accu + b;
					Q = {Accu[0],Q[32:1]};
					Accu[4:0] = Accu[31:1];
			 end

			 2'b10:
			 begin
					Accu = Accu - b;
					Q = {Accu[0],Q[32:1]};
					Accu[4:0] = Accu[31:1];
			 end
		 endcase
		end
		product = {Accu[31:0],Q[32:1]};
	end
	  
	
	
endmodule
