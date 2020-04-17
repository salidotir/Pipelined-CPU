`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:22:22 11/05/2019 
// Design Name: 
// Module Name:    pc_module 
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
module pc_module(pc_in, pc_out, clk, reset);

	input [31:0] pc_in;
	output [31:0] pc_out;
	input clk, reset;
	
	reg [31:0] pc;
	
	reg first_time = 0;
	
	always @(posedge clk)
	begin
		
		if(reset == 1)
			pc <= 0;
			
		if(first_time == 0)
		begin
			pc <= 0;
			first_time <= 1;
		end

		else
			pc <= pc_in;	
	end
	
	assign pc_out = pc;	
	
endmodule
