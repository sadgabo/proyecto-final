`timescale 1ns/1ns
module mux32(
	input [31:0] o1,
	input [31:0] o2,
	input sell,
	output reg [31:0] sal
);
always @* begin
 	case(sell)
		1'b1: sal = o1;
		1'b0: sal = o2;
	endcase
end
endmodule
