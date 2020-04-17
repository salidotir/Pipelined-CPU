`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:13:38 11/05/2019 
// Design Name: 
// Module Name:    address_generator 
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
module address_generator(adr_branch, hit, Add_in, PCSrc, Ins_address, Add_out);

	input PCSrc, hit;
	input [31:0] adr_branch, Add_in;
	output [31:0] Ins_address, Add_out;
	
	wire [31:0] temp_add_out;
	
	reg [31:0] add = 1;
	always @(hit)
	begin
		//#0.5
		if(hit == 0)
			add <= 0;
		else
			add <= 1;
	end

	adder adder_instance (
		 .inp1(Add_in), 
		 .inp2(add), 
		 .out(temp_add_out)
		 );

	mux2_1 mux2_1_instance (
		 .sel(PCSrc), 
		 .a(temp_add_out), 
		 .b(adr_branch), 
		 .out(Ins_address)
		 );
		 
	assign Add_out = temp_add_out;
endmodule
