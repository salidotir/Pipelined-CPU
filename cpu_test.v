`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:11:30 12/13/2019
// Design Name:   cpu
// Module Name:   C:/Users/surface/Desktop/sara/University/Term 5(98-99)/Architecture lab/PipeLine/PipeLine/cpu_test.v
// Project Name:  PipeLine
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cpu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cpu_test;

	// Inputs
	reg clk;
	reg reset;

	// Instantiate the Unit Under Test (UUT)
	cpu uut (
		.clk(clk), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#5;
		clk=1;
		#5;
		clk=0;
		reset=0;
        
		// Add stimulus here

	end
	
	always
	begin
		#50;
		clk = ~clk;
	end
      
endmodule

