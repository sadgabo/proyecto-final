`timescale 1ns/1ns
module Sum(
	input [31:0]E,
	output[31:0]Sum
);
assign Sum = E + 4;
endmodule
