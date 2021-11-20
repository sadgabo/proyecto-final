`timescale 1ns/1ns
module Alucontrol(
	input [2:0]uc,
	input [5:0]ins,
	output reg [2:0]so
);
always@*
	case(uc)
		3'b111: begin
			case (ins)
			6'b100000: so = 3'b001;
			6'b100100: so = 3'b111;
			6'b100101: so = 3'b000;
			6'b100010: so = 3'b100;
			6'b101010: so = 3'b101;
			endcase
		end
	endcase
endmodule
