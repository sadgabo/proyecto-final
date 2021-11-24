`timescale 1ns/1ns
module Mux_E(
	input [4:0]instruc1,
	input [4:0]instruc2,
	input selec,
	output reg [4:0]sal2
);
always @* 
begin
	case(selec)
		5'b1: sal2 = instruc1;
		5'b0: sal2 = instruc2;
	endcase
end
endmodule
