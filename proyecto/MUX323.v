`timescale 1ns/1ns
module MUX323(
	input [31:0] o5,
	input select3,
	output reg [31:0] sal3
);
always@*
	begin 
	if (select3)//llega un 0 
	sal3=o5;
	else 
	sal3=1;
	end
endmodule
