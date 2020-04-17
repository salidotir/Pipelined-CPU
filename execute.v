`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:11:19 11/11/2019 
// Design Name: 
// Module Name:    execute 
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
module execute(
	input clk, reset,

	input RegDstOut, ALUSrcOut, MemtoRegOut, RegWriteOut, MemReadOut, MemWriteOut, BranchOut, ALUOp1Out, ALUOp0Out,
	input [31:0] npcout, rdata1out, rdata2out, s_extendout,
	input [4:0] instrout_2016, instrout_1511,
	
	output [1:0] ctlwb_out,
	output [2:0] ctlm_out,
	output [31:0] readdat2,
	output [31:0] adder_out,
	output aluzero,
	output [31:0] aluout,
	output [4:0] muxout
    );
	 
	 
	wire [31:0] shift_out;
	// Instantiate shift_left_2
	shift_left_2 shift_left_2_instance (
		 .in(s_extendout), 
		 .out(shift_out)
		 );
		 
	// Instantiate Adder
	adder adder_instance_exe (
		 .inp1(npcout), 
		 .inp2(shift_out), 
		 .out(adder_out)
		 );
		 
	
	wire [31:0] mux2_1_out_32_bit;
	// Instantiate mux2_1
	mux2_1 mux2_1_instance (
		 .sel(ALUSrcOut), 
		 .a(rdata2out), 
		 .b(s_extendout), 
		 .out(mux2_1_out_32_bit)
		 );

	wire [2:0] control;
	// Instantiate alu
	alu alu_instance (
		 .A(rdata1out), 
		 .B(mux2_1_out_32_bit), 
		 .control(control), 
		 .zero(aluzero), 
		 .result(aluout)
		 );
	
	// Instantiate alu_control
	alu_control alu_control_instance (
		 .ALUOp1(ALUOp1Out), 
		 .ALUOp0(ALUOp0Out), 
		 .funct(s_extendout[5:0]), 
		 .control(control)
		 );

		 
	// Instantiate mux_2_1_5_bit
	mux_2_1_5_bit mux_2_1_5_bit_instance (
		 .sel(RegDstOut), 
		 .a(instrout_2016), 
		 .b(instrout_1511), 
		 .out(muxout)
		 );
		 
	assign ctlwb_out = {RegWriteOut, MemtoRegOut};
	assign ctlm_out = {BranchOut, MemReadOut, MemWriteOut};		// branch, mem_read, mem_write
	assign readdat2 = rdata2out;
		 
endmodule
