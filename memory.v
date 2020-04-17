`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:25:03 11/05/2019 
// Design Name: 
// Module Name:    memory 
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
module memory(clk, address, data_line);

	input clk;
	input [31:0] address;
	output [128:0] data_line;
	
	reg [31:0] memory [1023:0];

	integer i;
	initial begin
//	for(i = 0; i <= 31; i = i+1)
//		memory[i] = i;
		
		
		// test 1
	/*
//		memory[0] = 8'h00222820;		//add $5 $1 $2 --> $5 = $1 + $2
		memory[0] = 32'b00000000001000100010100000100000;
		
//		memory[1] = 8'h8c430000;		//lw $3 0($2) --> $3 = memory[$2 + 0(shamt)]
		memory[1] = 32'b10001100010000110000000000000000;	
		
//		memory[2] = 						//sw $6 0($5) --> memory[$5 + 0] = $6; 
		memory[2] = 32'b10101100101001100000000000000000;
		
//		memory[3] = 8'h00641022;		//sub $2 $3 $4 --> $2 = $3 - $4
		memory[3] = 32'b00000000011001000001000000100010;
		
//		memory[4] = 8'h00651024;		//and $2 $3 $5 --> $2 = $3 & $5
		memory[4] = 32'b00000000011001010001000000100100;		

*/
		// test 2


//		beq $2 $2 3	--> jumps to (3 * 4) + current_pc = 16
//						--> current_pc = 3

		memory[3] = 32'b00010000010000100000000000000011;
		
//		memory[16] = 8'h00222820;		//add $5 $1 $2 --> $5 = $1 + $2
		memory[16] = 32'b00000000001000100010100000100000;






		// test 3
/*
//		beq $2 $2 1	--> jumps to (1 * 4) + current_pc = 5
//						--> current_pc = 1

		memory[0] = 32'b00010000010000100000000000000001;
		
//		memory[5] = 8'h00222820;		//add $5 $1 $2 --> $5 = $1 + $2
		memory[5] = 32'b00000000001000100010100000100000;
*/	

	end
	
	wire [31:0] inst_addr;
	assign inst_addr = {address[31:2], 2'b00};

	assign data_line = {memory[inst_addr], memory[inst_addr+1], memory[inst_addr+2], memory[inst_addr+3]};

endmodule
