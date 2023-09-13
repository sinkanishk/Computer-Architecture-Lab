`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:54:19 10/28/2019 
// Design Name: 
// Module Name:    CLA 
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
module carry_look_ahead(
    input [3:0] A,B,
    input Cin,
	 output [3:0] S,
	 output Cout
    );
    wire [3:0] G,P,C;
 
    assign G = A & B; //Generate
    assign P = A ^ B; //Propagate
    assign C[0] = Cin;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);
    assign Cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) |(P[3] & P[2] & P[1] & P[0] & C[0]);
    assign S = P ^ C;
    
endmodule


