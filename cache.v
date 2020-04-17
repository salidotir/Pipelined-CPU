`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:30:51 11/05/2019 
// Design Name: 
// Module Name:    cache 
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
module cache(address, data_line, clk, reset, hit, instruction);
	
	// data_line comes from memory and has 4 instructions
	// address is the program counter(pc)

	input [31:0] address;
	input [127:0] data_line;
	input clk, reset;
	output reg hit;
	output reg [31:0] instruction;

	reg [152:0] cache [63:0];
	reg [2:0] delay_counter = 0;
	
	integer i;
	initial begin
		delay_counter <= 0;
		for (i = 0; i < 64; i = i + 1)
		begin
			cache[i] = 0;
		end
	end
	
	reg [5:0] set;
	reg [23:0] tag;
	reg [1:0] offset;
	
	// get the set, tag and offset from address(pc)
	always @(*)
	begin
		offset <= address[1:0];
		set <= address[7:2];
		tag <= address[31:8];
	end
/*
	always @(set)		// with changing set, hit must be 1 to avoid loosing instructions
		hit <= 0;
*/
	always@(posedge clk)
	begin	
		if(reset == 1)
		begin
			hit <= 0;
			instruction <= 0;
		end
		
		#0.5;				// inorder that offset changes and cache can detect it.
		if(cache[set][152] == 1'b1 && cache[set][151:128] == tag)
		begin
			hit <= 1'b1;
			case (offset)
					2'd3:
						instruction <= cache[set][31:0];
					2'd2:
						instruction <= cache[set][63:32];
					2'd1:
						instruction <= cache[set][95:64];
					2'd0:
						instruction <= cache[set][127:96];
			endcase
		end
		
		if (cache[set][152] == 1'b0 || cache[set][151:128] != tag)
		begin
			hit <= 1'b0;

			if (delay_counter != 7)
				delay_counter <= delay_counter + 1;
			
			else if (delay_counter == 7)
			begin
				cache[set][152] <= 1'b1;
				cache[set][151:128] <= tag;
				cache[set][127:0] <= data_line;
				delay_counter <= 0;
			end
		end		
	end

endmodule
