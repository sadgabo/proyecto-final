`timescale 1ns/1ns

module Bufer_MEM_WB (
    input [31:0]InDataOut,
    input [31:0]InAluRes,
    input InMuxD,
    input clk,
    output reg [31:0]DataOut_Out,
    output reg [31:0]AluResOut2,
    output reg MuxD_Out
);

initial begin
    DataOut_Out=0;
    AluResOut2=0;
    MuxD_Out=0;
end
always @(posedge clk)
begin
    DataOut_Out = InDataOut;
    AluResOut2 = InAluRes;
    MuxD_Out = InMuxD;
end 
    
endmodule