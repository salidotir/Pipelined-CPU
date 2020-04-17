`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:05:20 11/25/2019 
// Design Name: 
// Module Name:    execute_to_memory_pipe_register 
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
module execute_to_memory_pipe_register(
	input clk, reset,

	input [1:0] ctlwb_out,
	input [2:0] ctlm_out,
	input [31:0] adder_out,
	input aluzero,
	input [31:0] aluout,
	input [31:0] readdat2,
	input [4:0] muxout,
	
	output reg [1:0] wb_ctlout,
	output reg[2:0] m_ctlout,
	output reg [31:0] add_result,
	output reg zero,
	output reg [31:0] aluresult,
	output reg [31:0] rdata2out,
	output reg [4:0] five_bit_muxout
    );

	always@(posedge clk)
	begin
		if(reset == 1)
		begin
			wb_ctlout <= 0;
			m_ctlout <= 0;
			add_result <= 0;
			zero <= 0;
			aluresult <= 0;
			rdata2out <= 0;
			five_bit_muxout <= 0;
		end
		
		else
		begin
			wb_ctlout <= ctlwb_out;
			m_ctlout <= ctlm_out;
			add_result <= adder_out;
			zero <= aluzero;
			aluresult <= aluout;
			rdata2out <= readdat2;
			five_bit_muxout <= muxout;
		end
	end

endmodule
