`timescale 1ns/1ns
module MuxB(
	input [31:0] A,
	input [31:0] B,
	input sel,
	output reg [31:0] C
);
always @* begin
	case(sel)
		1'b0: C = A;
		1'b1: C = B;
	endcase
end
endmodule
