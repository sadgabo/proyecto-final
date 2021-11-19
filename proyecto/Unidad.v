`timescale 1ns/1ns
module Unidad(
	input[5:0]op,
	output reg regdst,
	output reg branch,
	output reg memread,
	output reg memreg,
	output reg memwrite,
	output reg alusrc,
	output reg regwrite,
	output reg [2:0]alop
);
always @*
	begin
	regwrite = 0;
	case (op)
	6'b000000:
	begin
	regdst=1'b1;
	branch=1'b0;
	memread=1'b0;
	memreg=1'b0;
	memwrite=1'b0;
	alusrc=1'b0;
	regwrite=1'b1;
	alop=3'b111;
	end 
endcase
end
endmodule
