`timescale 1ns/1ns

module Bufer_ID_EX(
    input [31:0]Adder,
    input [31:0]InDatoLec1,
    input [31:0]InDatoLec2,
    input [31:0]InSignExtend,
    input [4:0]InInstruc1,
    input [4:0]InInstruct2,
    input clk,
    output reg [31:0]AdderOut,
    output reg [31:0]DatoLecOut1,
    output reg [31:0]DatoLecOut2,
    output reg [31:0]SignExtendOut,
    output reg [4:0]InstrctOut1,
    output reg [4:0]InstructOut2
);
initial begin
    AdderOut=0;
    DatoLecOut1=0;
    DatoLecOut2=0;
    SignExtendOut=0;
    InstrctOut1=0;
    InstructOut2=0;
end
always @(posedge clk)
begin
    AdderOut = Adder;
    DatoLecOut1 = InDatoLec1;
    DatoLecOut2 = InDatoLec2;
    SignExtendOut = InSignExtend;
    InstrctOut1 = InInstruc1;
    InstructOut2 = InInstruct2; 
end

endmodule
