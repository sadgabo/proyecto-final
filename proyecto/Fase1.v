`timescale 1ns/1ns
module Fase1(
    input 	inclk
);


// Banco de registro 
wire [31:0]c_datolec1;
wire [31:0]c_datolec2;

//ALU
wire [31:0]c_result;
wire c_zflag;


//ALU CONTROL
wire [2:0]c_so;

//UNIDAD DE CONTROL
wire [2:0]c_alop;
wire c_alusrc;
wire c_memwrite;
wire c_memreads;
wire c_branch;
wire c_select;
wire c_enesc;
wire c_regdst;

//MEMORIA
wire [31:0]c_dataout;

//MEMORIA DE INSTRUCCIONES 
wire [31:0]c_instruc;

//SUMADOR 
wire [31:0]c_sum;

//MUX 1 
wire [31:0]c_mux1;

//MUX 2 
wire [4:0]c_mux2;

//MUX 3
wire [31:0]c_mux3;

//MUX 4 
wire [31:0]c_mux4;

//PC
wire [31:0]c_inou;

//COMPUERTA AND
wire c_and;

//Shift left 2 
wire [31:0]c_ShiftOut;

//ADD
wire [31:0]c_AddOut;

//Sign-extend
wire [31:0]c_SignOut;

//BUfer IF/ID
wire [31:0]c_AdderOut1;
wire [31:0]c_instmemOut;

//Bufer ID/EX
wire [31:0]c_AdderOut2;
wire [31:0]c_DatoLecOut1;
wire [31:0]c_DatoLecout2;
wire [31:0]c_SignExtendOut;
wire [4:0]c_InstrctOut1;
wire [4:0]c_InstructOut2;

//BUFER EX/MEM
wire [31:0]c_AddResOut3;
wire c_ZeroFlagOut;
wire [31:0]c_AluResOut1;
wire [31:0]c_DatoLec2;
wire c_MuxDOut;

//BUFER MEM/WB
wire  [31:0]c_DataOut_Out;
wire  [31:0]c_AluResOut2;
wire  [4:0]c_MuxD_Out;

//MUX_E
wire [4:0]c_sal2;

//Mux_F
wire [31:0]c_C1;

Mux_F muxf(
    .A1(c_sum),
    .B1(c_AddResOut3),
    .sel1(c_and),
    .C1(c_C1)
);

mpc PC(
    .clk(inclk),
    .inin(c_C1),
    .inou(c_inou)
);


Sum sumador(
    .E(c_inou),
    .Sum(c_sum)
);
memins MemInst(
    .adr(c_inou),
    .instruccion(c_instruc)
);

//Bufer IF/ID
Bufer_IF_ID  bufer1(
    .Adder(c_sum),
    .instmem(c_instruc),
    .clk(inclk),
    .AdderOut(c_AdderOut1),
    .instmemOut(c_instmemOut)
);

Unidad UC(
    .op(c_instruc[31:26]),
    .regdst(c_regdst),
    .branch(c_branch),
    .memread(c_memreads),
    .memreg(c_select),
    .memwrite(c_memwrite),
    .alusrc(c_alusrc),
    .regwrite(c_enesc),
    .alop(c_alop)
);

Registro Banco(
    .enesc(c_enesc),
    .dirlec1(c_instruc[25:21]),
    .dirlec2(c_instruc[20:16]),
    .datoesc(c_mux1),
    .diresc(c_MuxD_Out),
    .datolec1(c_datolec1),
    .datolec2(c_datolec2)
);

mux5 ins7(
    .o3(c_instruc[20:16]),
    .o4(c_instruc[15:11]),
    .selec(c_regdst),
    .sal2(c_mux2)
);

SignExtend SignEx(
    .SignIn(c_instruc[15:0]),
    .SignOut(c_SignOut)
);

//Bufer ID/EX
Bufer_ID_EX bufer2(
    .Adder(c_AdderOut1),
    .InDatoLec1(c_datolec1),
    .InDatoLec2(c_datolec2),
    .InSignExtend(c_SignOut),
    .InInstruc1(c_instruc[20:16]),
    .InInstruct2(c_instruc[15:11]),
    .clk(inclk),
    .AdderOut(c_AdderOut2),
    .DatoLecOut1(c_DatoLecOut1),
    .DatoLecOut2(c_DatoLecout2),
    .SignExtendOut(c_SignExtendOut),
    .InstrctOut1(c_InstrctOut1),
    .InstructOut2(c_InstructOut2)
);

ShiftLeft Shift(
    .ShiftIn(c_SignOut),
    .ShiftOut(c_ShiftOut)
);

Alucontrol Aluc(
    .ins(c_instruc[5:0]),
    .uc(c_alop),
    .so(c_so)
);

ALU1 alu(
    .sel(c_so),
    .op1(c_datolec1),
    .op2(c_mux4),
    .Result(c_result),
    .zflag(c_zflag)
);

ADD Adder(
    .A(c_sum),
    .B(c_ShiftOut),
    .AddOut(c_AddOut)
);

muxD ins8(
    .pc_adder(c_sum),
    .shift_adder(32'd0),
	.sel(c_and),
	.pc_out(c_mux3)
);

MUX323 ins9(
    .o5(c_datolec2),
    .select3(c_alusrc),
    .sal3(c_mux4)
);

Mux_E muxE(
    .instruc1(c_InstrctOut1),
    .instruc2(c_InstructOut2),
    .selec(c_regdst),
    .sal2(c_sal2)
);

//Bufer EX/MEM
Bufer_EX_MEM bufer3(
    .InAddRes(c_AddOut),
    .InZeroFlag(c_zflag),
    .InAluRes(c_result),
    .InDatoLec2(c_datolec2),
    .InMuxD(c_sal2),
    .clk(inclk),
    .AddResOut(c_AddResOut3),
    .ZeroFlagOut(c_ZeroFlagOut),
    .AluResOut1(c_AluResOut1),
    .DatoLec2(c_DatoLec2),
    .MuxDOut(c_MuxD_Out) 
);

assign c_and = c_zflag & c_branch;

Mem memoria(
    .dir(c_result),
    .memwrites(c_memwrite),
    .memreads(c_memreads),
    .datain(c_datolec2),
    .dataout(c_dataout)
);

//Bufer MEM/WB

Bufer_MEM_WB bufer4(
    .InDataOut(c_dataout),
    .InAluRes(c_result),
    .InMuxD(c_MuxDOut),
    .clk(inclk),
    .DataOut_Out(c_DataOut_Out),
    .AluResOut2(c_AluResOut2),
    .MuxD_Out(c_MuxDOut)
);

mux32 ins6(
    .o1(c_dataout),
    .o2(c_result),
    .sell(c_select),
    .sal(c_mux1)
);

endmodule