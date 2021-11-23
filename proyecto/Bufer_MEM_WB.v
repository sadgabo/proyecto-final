`timescale 1ns/1ns

module Bufer_MEM_WB (
    input [31:0]InDataOut,
    input [31:0]InAluRes,
    input InMuxD,
    output reg [31:0]DataOut_Out,
    output reg [31:0]AluResOut2,
    output reg MuxD_Out
);
always @*
begin
    DataOut_Out = InDataOut;
    AluResOut2 = InAluRes;
    MuxD_Out = InMuxD;
end 
    
endmodule