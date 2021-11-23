`timescale 1ns/1ns
module Mux_E(
	input [5:0]instruc1,
	input [5:0]instruc2,
	input selec,
	output reg [4:0] sal2
);
always @* 
begin
	case(selec)
		1'b1: sal2 = instruc1;
		1'b0: sal2 = instruc2;
	endcase
end
endmodule
