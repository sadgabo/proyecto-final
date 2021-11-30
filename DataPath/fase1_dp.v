`timescale 1ns/1ns

module fase1_dp(
    input clk
);

//PC
wire [31:0]c_InstOut;
//ADD4
wire [31:0]c_Sum;
//Instruction Memory
wire [31:0]c_Instruc;
//MuxA
wire [4:0]c_CA;
//Unidad de Control
wire c_RegDst;
wire c_Branch;
wire c_MemRead;
wire c_MemReg;
wire c_MemWrite;
wire c_AluSrc;
wire c_RegWrite;
wire [2:0]c_AluOp;
//Bando de Registros
wire [31:0]c_ReadData1;
wire [31:0]c_ReadData2;
//SignExtend
wire [31:0]c_SignExtendOut;
//MuxB
wire [31:0]c_CB;
//ShiftLeft
wire [31:0]c_ShiftLeftOut;
//AluControl
wire [2:0]c_AluOut;
//Alu
wire [31:0]c_Result;
wire c_ZeroFlag;
//ADD
wire [31:0]c_Adder;
//Compuerta and
wire c_And;
//MuxC
wire [31:0]c_CC;
//Memoria 
wire [31:0]c_ReadData;
//MuxD
wire [31:0]c_CD;

PC pc(
    .clk(clk),
    .InstIn(c_CC),
    .InstOut(c_InstOut)
);

ADD4 Adder4(
    .E(c_InstOut),
    .Sum(c_Sum)
);

MemInstruct meminst(
    .adr(c_InstOut),
    .instruc(c_Instruc)
);

MuxA mux1(
    .A(c_Instruc[20:16]),
    .B(c_Instruc[15:11]),
    .sel(c_RegDst),
    .C(c_CA)
);

UnidadControl UC(
    .OpCode(c_Instruc[31:26]),
    .RegDst(c_RegDst),
    .Branch(c_Branch),
    .MemRead(c_MemRead),
    .MemReg(c_MemReg),
    .MemWrite(c_MemWrite),
    .AluSrc(c_AluSrc),
    .RegWrite(c_RegWrite),
    .AluOp(c_AluOp)
);

BancoRegistro Banco(
    .ReadReg1(c_Instruc[25:21]),
    .ReadReg2(c_Instruc[20:16]),
    .WriteData(c_CD),
    .WriteRegister(c_CA),
    .enesc(c_RegWrite),
    .ReadData1(c_ReadData1),
    .ReadData2(c_ReadData2)
);

SignExtend SE(
    .InSingExtend(c_Instruc[15:0]),
    .SignExtendOut(c_SignExtendOut)
);

MuxB mux2(
    .A(c_ReadData2),
    .B(c_SignExtendOut),
    .sel(c_AluSrc),
    .C(c_CB)
);

ShiftLeft SL(
    .ShifLeftIn(c_SignExtendOut),
    .ShiftLeftOut(c_ShiftLeftOut)
);

AluControl AluCon(
    .UC(c_AluOp),
    .Instruction(c_Instruc[5:0]),
    .AluOut(c_AluOut)
);

Alu alu(
    .OP1(c_ReadData1),
    .OP2(c_CB),
    .Sel(c_AluOut),
    .Result(c_Result),
    .ZeroFlag(c_ZeroFlag)
);

ADD Adder(
    .A(c_Sum),
    .B(c_ShiftLeftOut),
    .Adder(c_Adder)
);

assign c_And = c_Branch & c_ZeroFlag;

MuxC mux3(
    .A(c_Sum),
    .B(c_Adder),
    .sel(c_And),
    .C(c_CC)
);

Memory memoria(
    .Address(c_Result),
    .WriteData(c_ReadData2),
    .MemWrite(c_MemWrite),
    .MemRead(c_MemRead),
    .ReadData(c_ReadData)
);

MuxD mux4(
    .A(c_ReadData),
    .B(c_Result),
    .sel(c_MemReg),
    .C(c_CD)
);

endmodule
