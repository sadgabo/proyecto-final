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
	//LW
	6'b100011:
	begin
		RegDst=1'b0;
		Branch=1'b0;
		MemRead=1'b1;
		MemReg=1'b1;
		MemWrite=1'b0;
		AluSrc=1'b1;
		RegWrite=1'b1;
		AluOp=3'b111;
	end
	//SW
	6'b101011:
	begin 
		RegDst=1'bX;
		Branch=1'b0;
		MemRead=1'b0;
		MemReg=1'b0;
		MemWrite=1'b1;
		AluSrc=1'b1;
		RegWrite=1'b0;
		AluOp=3'b111;
	end
	//BEQ
	6'b000100:
	begin
		RegDst=1'bx;
		Branch=1'b1;
		MemRead=1'b0;
		MemReg=1'b0;
		MemWrite=1'b0;
		AluSrc=1'b0;
		RegWrite=1'b0;
		AluOp=3'bx;
	end
	//Addi
	6'b001000:
	begin
		RegDst=1'b0;
		Branch=1'b0;
		MemRead=1'b0;
		MemReg=1'b0;
		MemWrite=1'b0;
		AluSrc=1'b1;
		RegWrite=1'b1;
		AluOp=3'b000;	
	end
	//Andi
	6'b001100:
	begin
		RegDst=1'b0;
		Branch=1'b0;
		MemRead=1'b0;
		MemReg=1'b0;
		MemWrite=1'b0;
		AluSrc=1'b1;
		RegWrite=1'b1;
		AluOp=3'b101;	
		
	end
	//SLTI
	6'b001010:
	begin//modificar las señales 
		RegDst=1'b0;
		Branch=1'b0;
		MemRead=1'b0;
		MemReg=1'b0;
		MemWrite=1'b0;
		AluSrc=1'b1;
		RegWrite=1'b1;
		AluOp=3'b010;
	end
	//ORI
	6'b001101:
	begin
		RegDst=1'b0;
		Branch=1'b0;
		MemRead=1'b0;
		MemReg=1'b0;
		MemWrite=1'b0;
		AluSrc=1'b1;
		RegWrite=1'b1;
		AluOp=3'b110;
	end
    endcase    
end
endmodule   