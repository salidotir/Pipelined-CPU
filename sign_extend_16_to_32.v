`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:05:34 11/05/2019 
// Design Name: 
// Module Name:    sign_extend_16_to_32 
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
module sign_extend_16_to_32(in, out);

	input [15:0] in;
	output [31:0] out;
	assign out = {{16{in[15]}},in[15:0]};

endmodule
