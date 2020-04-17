`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:40:01 11/05/2019
// Design Name:   fetch
// Module Name:   C:/Users/surface/Desktop/sara/PipeLine/fetch_test.v
// Project Name:  PipeLine
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fetch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fetch_test;

	// Inputs
	reg clk;
	reg reset;
	reg PCSrc;
	reg [31:0] addr_branch;

	// Outputs
	wire hit_out;
	wire [31:0] addr_out;
	wire [31:0] instruction_out;

	// Instantiate the Unit Under Test (UUT)
	fetch uut (
		.clk(clk), 
		.reset(reset), 
		.PCSrc(PCSrc), 
		.addr_branch(addr_branch), 
		.hit_out(hit_out), 
		.addr_out(addr_out), 
		.instruction_out(instruction_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		PCSrc = 0;
		addr_branch = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always
	begin
		#5;
		clk = ~clk;
	end
      
endmodule

