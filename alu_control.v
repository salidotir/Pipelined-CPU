`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:46:28 11/11/2019 
// Design Name: 
// Module Name:    alu_control 
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
module alu_control(
	input ALUOp1,
	input ALUOp0,
	input [5:0] funct,
	
	output reg [2:0] control
    );
	 
	 wire [1:0] ALUOp = {ALUOp1, ALUOp0};
	 
	 always@(*)
	 begin
		
		case(ALUOp)
			2'b00:
				control <= 3'b010;
				
			2'b01:
				control <= 3'b110;
			
			2'b10:
				case(funct)
					6'b100000:		// add
						control <= 3'b010;
					
					6'b100010:		// sub
						control <= 3'b110;
						
					6'b100100:		// and
						control <= 3'b000;
					
					6'b100101:		// or
						control <= 3'b001;
					
					6'b101010:		// set on less than
						control <= 3'b111;
				endcase
			
//			2'b11:			// don't care
		endcase
		
	 end

endmodule
