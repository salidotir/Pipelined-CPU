`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:45:17 11/25/2019 
// Design Name: 
// Module Name:    memory_to_write_back_pipe_register 
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
module memory_to_write_back_pipe_register(
	input clk, reset,
	input [1:0] control_wb_in, 
	input [31:0] Read_data_in,
	input [31:0] Alu_result_in,
	input [4:0] Write_reg_in,
	
	output reg [1:0] mem_control_wb,
	output reg [31:0] Read_data,
	output reg [31:0] mem_Alu_result,
	output reg [4:0] mem_Write_reg
    );
	 
	 always@(posedge clk)
	 begin
		if(reset == 1)
		begin
			mem_control_wb <= 0;
			Read_data <= 0;
			mem_Alu_result <= 0;
			mem_Write_reg <= 0;
		end
		
		else
		begin
			mem_control_wb <= control_wb_in;
			Read_data <= Read_data_in;
			mem_Alu_result <= Alu_result_in;
			mem_Write_reg <= Write_reg_in;
		end
	 end


endmodule
