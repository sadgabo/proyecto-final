`timescale 1ns/1ns
module mux32(
	input [31:0] o1,
	input [31:0] o2,
	input sell,
	output reg [31:0] sal
);
always@*
	begin 
	if (sell)
	sal=o1;
	else 
	sal=o2;
	end
endmodule
