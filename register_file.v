`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:03:21 11/05/2019 
// Design Name: 
// Module Name:    register_file 
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
module register_file(read_reg1, read_reg2, write_reg, write_data, reg_write, clk, read_data1, read_data2);
	
	input reg_write, clk;
	input [4:0] read_reg1, read_reg2, write_reg;
	input [31:0] write_data;
	
	output reg [31:0] read_data1, read_data2;
	
	integer i;
	reg [31:0] register_file [31:0];
	initial
	begin
		for (i=0; i < 32; i=i+1)
		begin
			register_file[i] = i;
		end
	end

	always @(posedge clk)
	begin
		if(reg_write == 1)
			register_file[write_reg] <= write_data;
	end
	
	always @(*)
	begin
		read_data1 <= register_file[read_reg1];
		read_data2 <= register_file[read_reg2];
	end
	
endmodule
