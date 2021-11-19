`timescale 1ns/1ns
module mpc(
	input clk,
	input [31:0]inin,
	output reg[31:0]inou
);

always @(posedge clk)
inou=inin;
initial
begin
inou[31:0]=32'd0;
end
endmodule