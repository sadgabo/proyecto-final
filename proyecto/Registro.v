`timescale 1ns/1ns
module Registro(
	input [4:0] dirlec1,
	input [4:0] dirlec2,
	input [31:0] datoesc,
	input [4:0] diresc,
	input enesc,
	output reg [31:0] datolec1,
	output reg [31:0] datolec2
);
reg [31:0] brr [0:31];
always @*
begin 
	datolec1 = brr[dirlec1];
	datolec2 = brr[dirlec2];
	if(enesc==1)
	begin
		brr[diresc] = datoesc;
	end
end
initial 
begin 
	$readmemb("TestF1_Breg.mem",brr);
end

endmodule
