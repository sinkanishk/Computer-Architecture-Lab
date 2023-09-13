`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:50:44 10/30/2019 
// Design Name: 
// Module Name:    array_multiplier 
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
module array_multiplier(a, b, y);

parameter width = 64;
input [width-1:0] a, b;
output [width-1:0] y;

wire [width*width-1:0] partials;

genvar i;
assign partials[width-1 : 0] = a[0] ? b : 0;
generate for (i = 1; i < width; i = i+1) begin:gen
    assign partials[width*(i+1)-1 : width*i] = (a[i] ? b << i : 0) +
                                   partials[width*i-1 : width*(i-1)];
end endgenerate

assign y = partials[width*width-1 : width*(width-1)];

endmodule
