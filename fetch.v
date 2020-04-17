`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:33:46 11/05/2019 
// Design Name: 
// Module Name:    fetch 
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
module fetch(clk, reset, PCSrc, addr_branch, hit_out, addr_out, instruction_out);
	
	input clk, reset, PCSrc;
	input [31:0] addr_branch;
	output hit_out;
	output [31:0] addr_out;
	output [31:0] instruction_out;
	
	reg [31:0] pc_in;
	initial pc_in = 0;
	wire [31:0] pc_out1;
	wire [31:0] pc_out;
	wire hit;
	wire [127:0] data_line;
	wire [31:0] address_gen_addr_out, instruction;

	// Instantiate Pc_module
	pc_module pc_module_instance (
		 .pc_in(pc_in), 
		 .pc_out(pc_out1), 
		 .clk(clk), 
		 .reset(reset)
		 );

	// Instantiate the module
	address_generator address_generator_instance (
		 .adr_branch(addr_branch), 
		 .hit(hit), 
		 .Add_in(pc_out1), 
		 .PCSrc(PCSrc), 
		 .Ins_address(pc_out), 
		 .Add_out(address_gen_addr_out)
		 );
		 
	always@(pc_out)
		pc_in <= pc_out;
	
	// Instantiate cache
	cache cache_instance (
		 .address(pc_out1), 
		 .data_line(data_line), 
		 .clk(clk), 
		 .reset(reset), 
		 .hit(hit), 
		 .instruction(instruction)
		 );
		 
	// Instantiate memory
	memory memory_instance (
		 .clk(clk), 
		 .address(pc_out1),
		 .data_line(data_line)
		 );
		 
	assign addr_out = address_gen_addr_out;
	assign instruction_out = instruction;	
	assign hit_out = hit;

endmodule
