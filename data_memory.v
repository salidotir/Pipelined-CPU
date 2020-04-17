`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:16:44 11/25/2019 
// Design Name: 
// Module Name:    data_memory 
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
module data_memory(
	input clk, reset,
	
	input MemWrite, MemRead,
	input [31:0] address, write_data,
	
	output reg [31:0] read_data
    );
	 
	 reg [31:0] data_memory [31:0];
	 
	 integer i;
	 initial begin
		for(i = 0; i < 31; i = i+1)
			data_memory[i] = i;
	 end
	 	 
	 always@(*)
	 begin
		if(MemWrite == 1)
			data_memory[address] <= write_data;	
		if(MemRead == 1)
			read_data <= data_memory[address];
	end

endmodule
