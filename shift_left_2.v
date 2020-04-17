`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:12:27 11/11/2019 
// Design Name: 
// Module Name:    shift_left_2 
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
module shift_left_2(in, out);

	input [31:0] in;
	output [31:0] out;
	
	assign out = in << 2;

endmodule
