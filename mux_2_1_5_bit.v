`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:07:33 11/11/2019 
// Design Name: 
// Module Name:    mux_2_1_5_bit 
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
module mux_2_1_5_bit(sel, a, b, out);

	input sel;
	input [4:0]  a, b;
	output reg [4:0] out;
	
	always @(sel, a, b)
	begin
		if(sel == 0)
			out <= a;			// non-blocking assignment
		else
			out <= b;
	end

endmodule
