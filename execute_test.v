`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:37:14 11/25/2019
// Design Name:   execute
// Module Name:   C:/Users/surface/Desktop/sara/University/Term 5(98-99)/Architecture lab/PipeLine/PipeLine/execute_test.v
// Project Name:  PipeLine
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: execute
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module execute_test;

	// Inputs
	reg clk;
	reg reset;
	reg RegDstOut;
	reg ALUSrcOut;
	reg MemtoRegOut;
	reg RegWriteOut;
	reg MemReadOut;
	reg MemWriteOut;
	reg BranchOut;
	reg ALUOp1Out;
	reg ALUOp0Out;
	reg [31:0] npcout;
	reg [31:0] rdata1out;
	reg [31:0] rdata2out;
	reg [31:0] s_extendout;
	reg [4:0] instrout_2016;
	reg [4:0] instrout_1511;

	// Outputs
	wire [1:0] ctlwb_out;
	wire [2:0] ctlm_out;
	wire [31:0] readdat2;
	wire [31:0] adder_out;
	wire aluzero;
	wire [31:0] aluout;
	wire [4:0] muxout;

	// Instantiate the Unit Under Test (UUT)
	execute uut (
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
		.readdat2(readdat2), 
		.adder_out(adder_out), 
		.aluzero(aluzero), 
		.aluout(aluout), 
		.muxout(muxout)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		RegDstOut = 0;
		ALUSrcOut = 0;
		MemtoRegOut = 0;
		RegWriteOut = 0;
		MemReadOut = 0;
		MemWriteOut = 0;
		BranchOut = 0;
		ALUOp1Out = 0;
		ALUOp0Out = 0;
		npcout = 0;
		rdata1out = 0;
		rdata2out = 0;
		s_extendout = 0;
		instrout_2016 = 0;
		instrout_1511 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
			ALUSrcOut = 0;
		ALUOp1Out = 1;
		ALUOp0Out = 0;
		s_extendout = 6'b100000;
		rdata1out = 7;
		rdata2out = 2;
		
		#100;
		
		ALUOp1Out = 1;
		ALUOp0Out = 0;
		s_extendout = 6'b100010;
		
		#100;
		ALUSrcOut = 1;
		rdata1out = 3;
		s_extendout = 12;

	end
      
endmodule

