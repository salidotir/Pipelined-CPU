`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:08:08 11/05/2019 
// Design Name: 
// Module Name:    fetch_to_decode_pipe_register 
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
module fetch_to_decode_pipe_register(clk, reset, hit, addr_in, instruction_in, addr_out, instruction_out);
	input clk, reset, hit;
	input [31:0] addr_in, instruction_in;
	output [31:0] addr_out, instruction_out;
	
	reg [31:0] tmp_addr, tmp_inst;
	
	always @(posedge clk)
	begin
		if(reset == 1)
		begin
			tmp_addr <= 0;
			tmp_inst <= 0;
		end
		
		else if(hit != 0)
		begin
			tmp_addr <= addr_in;
			tmp_inst <= instruction_in;
		end
			
		else
		begin
			tmp_inst <= 32;		// nop --> add $0 $0 $0
		end
	end

	
	assign addr_out = tmp_addr;
	assign instruction_out = tmp_inst;

endmodule
