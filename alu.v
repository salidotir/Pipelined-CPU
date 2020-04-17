`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:23:13 11/11/2019 
// Design Name: 
// Module Name:    alu 
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
module alu(
	input [31:0] A,
	input [31:0] B,
	input [2:0] control,
	
	output reg zero,
	output reg [31:0] result
	 );
	 
	always@(*)
	begin
	
		case(control)
			3'b000:	// and
				result <= A & B;
			
			3'b001:	// or
				result <= A & B;
			
			3'b010:	// add
				result <= A + B;
			
			3'b110:	// subtract
				result <= A - B;
			
			3'b111:	// set on less than
			begin
				if(A<B)
					result <= 1;
				else
					result <= 0;
			end	
		endcase 
		
	if(result == 0)
		zero <= 1;
	else
		zero <= 0;
		
	end

endmodule
