`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:10:37 11/05/2019 
// Design Name: 
// Module Name:    decode 
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
module decode(
	input clk, reset,
	input [31:0] pc,
	input [31:0] write_data,
	input [31:0] instruction,
	input [4:0] write_reg,
	input RegWrite_in,
	
	output RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0,
	output [31:0] npc, readdat1, readdat2, signext_out,
	output [4:0] instr_2016, instr_1511
   );
	 
	 reg [5:0] opcode;
	 initial opcode = instruction[31:26];
	 
	 reg [4:0] read_reg1, read_reg2;
	 initial read_reg1 = instruction[25:21];
 	 initial read_reg2 = instruction[20:16];
	 
	 reg [15:0] signext_in;
	 initial signext_in = instruction[15:0];
	 
	 always @(instruction)
	 begin
   	 opcode = instruction[31:26];
		 read_reg1 = instruction[25:21];
		 read_reg2 = instruction[20:16];
		 signext_in = instruction[15:0];
	 end
	 	 
	 // Instantiate control_unit
	control_unit control_unit_instance (
		 .clk(clk), 
		 .reset(reset), 
		 .opcode(opcode), 
		 .RegDst(RegDst), 
		 .ALUSrc(ALUSrc), 
		 .MemtoReg(MemtoReg), 
		 .RegWrite(RegWrite), 
		 .MemRead(MemRead), 
		 .MemWrite(MemWrite), 
		 .Branch(Branch), 
		 .ALUOp1(ALUOp1), 
		 .ALUOp0(ALUOp0)
		 );
		 
	// Instantiate register_file
	register_file register_file_instance (
		 .read_reg1(read_reg1), 
		 .read_reg2(read_reg2), 
		 .write_reg(write_reg), 
		 .write_data(write_data), 
		 .reg_write(RegWrite_in), 
		 .clk(clk), 
		 .read_data1(readdat1), 
		 .read_data2(readdat2)
		 );
		 
	// Instantiate sign_extend_16_to_32
	sign_extend_16_to_32 sign_extend_instance (
		 .in(signext_in), 
		 .out(signext_out)
		 );

	assign npc = pc;
	
	assign instr_2016 = instruction[20:16];
	assign instr_1511 = instruction[15:11];

endmodule
