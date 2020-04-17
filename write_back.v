`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:58:16 12/13/2019 
// Design Name: 
// Module Name:    write_back 
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
module write_back(
	input [31:0] Read_data,
	input [31:0] mem_Alu_result,
	input [4:0] mem_Write_reg,
	input [1:0] mem_control_wb,
	
	output [31:0] write_data,
	output [4:0] write_reg,
	output RegWrite_in
    );

	wire RegWrite = mem_control_wb[1];
	wire MemtoReg = mem_control_wb[0];

	// Instantiate mux2_1 32_bit
	mux2_1 write_back_mux_instance (
		 .sel(MemtoReg), 
		 .a(mem_Alu_result), 
		 .b(Read_data), 
		 .out(write_data)
		 );
		 
	assign write_reg = mem_Write_reg;
	assign RegWrite_in = RegWrite;

endmodule
