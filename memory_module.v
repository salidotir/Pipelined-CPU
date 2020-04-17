`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:17:38 12/09/2019 
// Design Name: 
// Module Name:    memory_module 
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
module memory_module(
	input clk, reset,
	input [1:0] wb_ctlout,
	input [2:0] m_ctlout,
	input [31:0] add_result,
	input zero,
	input [31:0] aluresult,
	input [31:0] rdata2out,
	input [4:0] five_bit_muxout,

	output PCSrc,
	output [31:0] Add_result_in,
	
	output [1:0] control_wb_in, 
	output [31:0] Read_data_in,
	output [31:0] Alu_result_in,
	output [4:0] Write_reg_in
    );
	 
	 wire Branch = m_ctlout[2];
	 wire MemRead = m_ctlout[1];
 	 wire MemWrite = m_ctlout[0];
	 
	// Instantiate data_memory
	data_memory data_memory_instance (
		 .clk(clk), 
		 .reset(reset), 
		 .MemWrite(MemWrite), 
		 .MemRead(MemRead), 
		 .address(aluresult), 
		 .write_data(rdata2out), 
		 .read_data(Read_data_in)
		 );

	// Instantiate and_module
	and_module and_module_instance (
		 .a(Branch), 
		 .b(zero), 
		 .out(PCSrc)
		 );
		 
	assign Add_result_in = add_result;
		 
	assign Alu_result_in = aluresult;
	assign Write_reg_in = five_bit_muxout;
	assign control_wb_in = wb_ctlout;
	
endmodule
