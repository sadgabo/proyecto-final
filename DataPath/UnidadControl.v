`timescale 1ns/1ns

module UnidadControl(
    input [5:0]OpCode,
    output reg RegDst,
	output reg Branch,
	output reg MemRead,
	output reg MemReg,
	output reg MemWrite,
	output reg AluSrc,
	output reg RegWrite,
	output reg [2:0]AluOp
);

always @* begin
    case(OpCode)
	6'b000000:
	begin
		RegDst=1'b1;
		Branch=1'b0;
		MemRead=1'b0;
		MemReg=1'b0;
		MemWrite=1'b0;
		AluSrc=1'b0;
		RegWrite=1'b1;
		AluOp=3'b111;
	end
    endcase    
end
endmodule   