`timescale 1ns/1ns
module mux5(
	input [4:0] o3,
	input [4:0] o4,
	input selec,
	output reg [4:0] sal2
);
always@*
	begin 
	if (selec)
	sal2=o3;
	else 
	sal2=o4;
	end
endmodule
