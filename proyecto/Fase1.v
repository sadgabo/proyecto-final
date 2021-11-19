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



assign c_and = c_zflag & c_branch;

mpc ins(
    .clk(inclk),
    .inin(c_mux3),
    .inou(c_inou)
);

Sum ins0(
    .E(c_inou),
    .Sum(c_sum)
);

memins ins01(
    .adr(c_inou),
    .instruccion(c_instruc)
);

Registro ins1(
    .enesc(c_enesc),
    .dirlec1(c_instruc[25:21]),
    .dirlec2(c_instruc[20:16]),
    .datoesc(c_mux1),
    .diresc(c_mux2),
    .datolec1(c_datolec1),
    .datolec2(c_datolec2)
);
Mem ins2(
    .dir(c_result),
    .memwrites(c_memwrite),
    .memreads(c_memreads),
    .datain(c_datolec2),
    .dataout(c_dataout)
);

Alucontrol ins4(
    .ins(c_instruc[5:0]),
    .uc(c_alop),
    .so(c_so)
);

Alu ins3(
    .sel(c_so),
    .op1(c_datolec1),
    .op2(c_mux4),
    .Result(c_result),
    .zflag(c_zflag)
);



Unidad ins5(
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

mux32 ins6(
    .o1(c_dataout),
    .o2(c_result),
    .sell(c_select),
    .sal(c_mux1)
);

mux5 ins7(
    .o3(c_instruc[20:16]),
    .o4(c_instruc[15:11]),
    .selec(c_regdst),
    .sal2(c_mux2)
);

MUX323 ins8(
    .o5(c_sum),
    .select3(c_and),
    .sal3(c_mux3)
);

MUX323 ins9(
    .o5(c_datolec2),
    .select3(c_alusrc),
    .sal3(c_mux4)
);

endmodule