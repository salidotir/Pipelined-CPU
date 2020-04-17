`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:19:36 11/05/2019 
// Design Name: 
// Module Name:    mux2_1 
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
module mux2_1(sel , a, b, out);
	input sel;
	input [31:0]  a, b;
	output reg [31:0] out;
	
	always @(sel, a, b)
	begin
		if(sel == 0)
			out <= a;			// non-blocking assignment
		else
			out <= b;
	end
	
endmodule