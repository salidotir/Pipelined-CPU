`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:09:46 11/05/2019 
// Design Name: 
// Module Name:    decode_to_execute_pipe_register 
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
module decode_to_execute_pipe_register(
	input clk, reset,
	input RegDstIn, ALUSrcIn, MemtoRegIn, RegWriteIn, MemReadIn, MemWriteIn, BranchIn, ALUOp1In, ALUOp0In,
	output reg RegDstOut, ALUSrcOut, MemtoRegOut, RegWriteOut, MemReadOut, MemWriteOut, BranchOut, ALUOp1Out, ALUOp0Out,
	
	input [31:0] npc, readdat1, readdat2, signext_out,
	input [4:0] instr_2016, instr_1511,
	
	output reg [31:0] npcout, rdata1out, rdata2out, s_extendout,
	output reg [4:0] instrout_2016, instrout_1511);
	
	always @(posedge clk)
	begin
		if(reset == 1)
		begin
			RegDstOut <= 0;
			ALUSrcOut <= 0;
			MemtoRegOut <= 0;
			RegWriteOut <= 0;
			MemReadOut <= 0;
			MemWriteOut <= 0;
			BranchOut <= 0;
			ALUOp1Out <= 0;
			ALUOp0Out <= 0;
			npcout <= 0;
			rdata1out <= 0;
			rdata2out <= 0;
			s_extendout <= 0;
			instrout_2016 <= 0;
			instrout_1511 <= 0;
		end
		
		else
		begin
			RegDstOut <= RegDstIn;
			ALUSrcOut <= ALUSrcIn;
			MemtoRegOut <= MemtoRegIn;
			RegWriteOut <= RegWriteIn;
			MemReadOut <= MemReadIn;
			MemWriteOut <= MemWriteIn;
			BranchOut <= BranchIn;
			ALUOp1Out <= ALUOp1In;
			ALUOp0Out <= ALUOp0In;
			npcout <= npc;
			rdata1out <= readdat1;
			rdata2out <= readdat2;
			s_extendout <= signext_out;
			instrout_2016 <= instr_2016;
			instrout_1511 <= instr_1511;
		end
	
	end

endmodule
