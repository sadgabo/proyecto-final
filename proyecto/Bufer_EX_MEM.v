`timescale 1ns/1ns

module Bufer_EX_MEM(
    input [31:0]InAddRes,
    input InZeroFlag,
    input [31:0]InAluRes,
    input [31:0]InDatoLec2,
    input [4:0]InMuxD,
    input clk,
    output reg [31:0]AddResOut,
    output reg ZeroFlagOut,
    output reg [31:0]AluResOut1,
    output reg [31:0]DatoLec2,
    output reg [4:0]MuxDOut
);
initial begin
    AddResOut=0;
    ZeroFlagOut=0;
    AluResOut1=0;
    DatoLec2=0;
    MuxDOut=0;
end

always @(posedge clk) 
begin
    AddResOut = InAddRes;
    ZeroFlagOut = InZeroFlag;
    AluResOut1 = InAluRes;
    DatoLec2 = InDatoLec2;
    MuxDOut = InMuxD;
end
endmodule