`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:58:55 08/14/2019 
// Design Name: 
// Module Name:    hybrid_adder 
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
module hybrid_adder(
    input [31:0] a,
    input [31:0] b,
    input cin,
    output [31:0] sum,
    output cout
    );
	 
	 wire C1,C2,C3,C4,C5,C6,C7;
	 carry_look_ahead c0( a[3:0], b[3:0],cin, sum[3:0], C1); 
	 carry_look_ahead c1( a[7:4], b[7:4],C1, sum[7:4], C2);
	 carry_look_ahead c2( a[11:8], b[11:8],C2, sum[11:8], C3);
	 carry_look_ahead c3( a[15:12], b[15:12],C3, sum[15:12], C4);
	 carry_look_ahead c4( a[19:16], b[19:16],C4, sum[19:16], C5); 
	 carry_look_ahead c5( a[23:20], b[23:20],C5, sum[23:20], C6);
	 carry_look_ahead c6( a[27:24], b[27:24],C6, sum[27:24], C7);
	 carry_look_ahead c7( a[31:28], b[31:28],C7, sum[31:28], cout);
	 
endmodule







