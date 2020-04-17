`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:38:31 12/09/2019 
// Design Name: 
// Module Name:    cpu 
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
module cpu(
	input clk, reset
    );

	// Fetch stage
	// inputs
	wire PCSrc;
	wire [31:0] addr_branch;
	wire [31:0] addr_in;
	wire [31:0] instruction_in;
	
	// outputs
	wire [31:0] addr_out;
	wire [31:0] instruction_out;
	wire hit;
	
	// Instantiate the module
	fetch fetch_instance (
		 .clk(clk), 
		 .reset(reset), 
		 .PCSrc(PCSrc), 
		 .addr_branch(addr_branch), 
		 .hit_out(hit), 
		 .addr_out(addr_in), 
		 .instruction_out(instruction_in)
		 );

	// Instantiate the module
	fetch_to_decode_pipe_register fetch_pipe_instance (
		 .clk(clk), 
		 .reset(reset), 
		 .hit(hit),
		 .addr_in(addr_in), 
		 .instruction_in(instruction_in), 
		 .addr_out(addr_out), 
		 .instruction_out(instruction_out)
		 );
		 
		 
	// Decode stage
	// inuts	
	wire [31:0] write_data;
	wire [4:0] write_reg;
	wire RegWrite_in;
	
	// outputs
	wire RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0;
	wire [31:0] npc, readdat1, readdat2, signext_out;
	wire [4:0] instr_2016, instr_1511;
	
	wire RegDstOut, ALUSrcOut, MemtoRegOut, RegWriteOut, MemReadOut, MemWriteOut, BranchOut, ALUOp1Out, ALUOp0Out;
	wire [31:0] npcout, rdata1out, rdata2out, s_extendout;
	wire [4:0] instrout_2016, instrout_1511;
	
	// Instantiate the module
	decode decode_instance (
		 .clk(clk), 
		 .reset(reset), 
		 .pc(addr_out), 
		 .RegWrite_in(RegWrite_in), 
		 .write_data(write_data), 
		 .instruction(instruction_out), 
		 .write_reg(write_reg), 
		 .RegDst(RegDst), 
		 .ALUSrc(ALUSrc), 
		 .MemtoReg(MemtoReg), 
		 .RegWrite(RegWrite), 
		 .MemRead(MemRead), 
		 .MemWrite(MemWrite), 
		 .Branch(Branch), 
		 .ALUOp1(ALUOp1), 
		 .ALUOp0(ALUOp0), 
		 .npc(npc), 
		 .readdat1(readdat1), 
		 .readdat2(readdat2), 
		 .signext_out(signext_out), 
		 .instr_2016(instr_2016), 
		 .instr_1511(instr_1511)
		 );

	// Instantiate the module
	decode_to_execute_pipe_register decode_pipe_instance (
		 .clk(clk), 
		 .reset(reset), 
		 .RegDstIn(RegDst), 
		 .ALUSrcIn(ALUSrc), 
		 .MemtoRegIn(MemtoReg), 
		 .RegWriteIn(RegWrite), 
		 .MemReadIn(MemRead), 
		 .MemWriteIn(MemWrite), 
		 .BranchIn(Branch), 
		 .ALUOp1In(ALUOp1), 
		 .ALUOp0In(ALUOp0), 
		 .RegDstOut(RegDstOut), 
		 .ALUSrcOut(ALUSrcOut), 
		 .MemtoRegOut(MemtoRegOut), 
		 .RegWriteOut(RegWriteOut), 
		 .MemReadOut(MemReadOut), 
		 .MemWriteOut(MemWriteOut), 
		 .BranchOut(BranchOut), 
		 .ALUOp1Out(ALUOp1Out), 
		 .ALUOp0Out(ALUOp0Out), 
		 .npc(npc), 
		 .readdat1(readdat1), 
		 .readdat2(readdat2), 
		 .signext_out(signext_out), 
		 .instr_2016(instr_2016), 
		 .instr_1511(instr_1511), 
		 .npcout(npcout), 
		 .rdata1out(rdata1out), 
		 .rdata2out(rdata2out), 
		 .s_extendout(s_extendout), 
		 .instrout_2016(instrout_2016), 
		 .instrout_1511(instrout_1511)
		 );

	// Execute stage
	// inputs
	wire [1:0] ctlwb_out;
	wire [2:0] ctlm_out;
	wire [31:0] readdat2out;
	wire [31:0] adder_out;
	wire aluzero;
	wire [31:0] aluout;
	wire [4:0] muxout;
	
	// outputs
	wire [1:0] wb_ctlout;
	wire [2:0] m_ctlout;
	wire [31:0] write_data_in;
	wire [31:0] add_result;
	wire zero;
	wire [31:0] aluresult;
	wire [4:0] five_bit_muxout;

	// Instantiate the module
	execute execute_instance (
		 .clk(clk), 
		 .reset(reset), 
		 .RegDstOut(RegDstOut), 
		 .ALUSrcOut(ALUSrcOut), 
		 .MemtoRegOut(MemtoRegOut), 
		 .RegWriteOut(RegWriteOut), 
		 .MemReadOut(MemReadOut), 
		 .MemWriteOut(MemWriteOut), 
		 .BranchOut(BranchOut), 
		 .ALUOp1Out(ALUOp1Out), 
		 .ALUOp0Out(ALUOp0Out), 
		 .npcout(npcout), 
		 .rdata1out(rdata1out), 
		 .rdata2out(rdata2out), 
		 .s_extendout(s_extendout), 
		 .instrout_2016(instrout_2016), 
		 .instrout_1511(instrout_1511), 
		 .ctlwb_out(ctlwb_out), 
		 .ctlm_out(ctlm_out), 
		 .readdat2(readdat2out), 
		 .adder_out(adder_out), 
		 .aluzero(aluzero), 
		 .aluout(aluout), 
		 .muxout(muxout)
		 );

	// Instantiate the module
	execute_to_memory_pipe_register execute_pipe_instance (
		 .clk(clk), 
		 .reset(reset), 
		 .ctlwb_out(ctlwb_out), 
		 .ctlm_out(ctlm_out), 
		 .adder_out(adder_out), 
		 .aluzero(aluzero), 
		 .aluout(aluout), 
		 .readdat2(readdat2out), 
		 .muxout(muxout), 
		 .wb_ctlout(wb_ctlout), 
		 .m_ctlout(m_ctlout), 
		 .add_result(add_result), 
		 .zero(zero), 
		 .aluresult(aluresult), 
		 .rdata2out(write_data_in), 
		 .five_bit_muxout(five_bit_muxout)
		 );
		 
	// Memory stage
	// inputs
	wire [1:0] control_wb_in; 
	wire [31:0] Read_data_in;
	wire [31:0] Alu_result_in;
	wire [4:0] write_reg_in;
	
	// outputs
	wire [1:0] mem_control_wb;
	wire [31:0] Read_data;
	wire [31:0] mem_Alu_result;
	wire [4:0] mem_Write_reg;
		 
	// Instantiate the module
	memory_module memory_instance (
		 .clk(clk), 
		 .reset(reset), 
		 .wb_ctlout(wb_ctlout), 
		 .m_ctlout(m_ctlout), 
		 .add_result(add_result), 
		 .zero(zero), 
		 .aluresult(aluresult), 
		 .rdata2out(write_data_in), 
		 .five_bit_muxout(five_bit_muxout), 
		 .PCSrc(PCSrc), 
		 .control_wb_in(control_wb_in), 
		 .Read_data_in(Read_data_in), 
		 .Alu_result_in(Alu_result_in), 
		 .Write_reg_in(write_reg_in),
		 .Add_result_in(addr_branch)
		 );

	// Instantiate the module
	memory_to_write_back_pipe_register memory_pipe_instance (
		 .clk(clk), 
		 .reset(reset), 
		 .control_wb_in(control_wb_in), 
		 .Read_data_in(Read_data_in), 
		 .Alu_result_in(Alu_result_in), 
		 .Write_reg_in(write_reg_in), 
		 .mem_control_wb(mem_control_wb), 
		 .Read_data(Read_data), 
		 .mem_Alu_result(mem_Alu_result), 
		 .mem_Write_reg(mem_Write_reg)
		 );

	// Instantiate the module
	write_back write_back_instance (
		 .Read_data(Read_data), 
		 .mem_Alu_result(mem_Alu_result), 
		 .mem_Write_reg(mem_Write_reg), 
		 .mem_control_wb(mem_control_wb), 
		 .write_data(write_data), 
		 .write_reg(write_reg), 
		 .RegWrite_in(RegWrite_in)
		 );

endmodule
