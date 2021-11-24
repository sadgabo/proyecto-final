`timescale 1ns/1ns

module Bufer_IF_ID(
    input [31:0]Adder,
    input [31:0]instmem,
    input clk,
    output reg [31:0]AdderOut,
    output reg [31:0]instmemOut
);
initial begin
    AdderOut=0;
    instmemOut=0;
end

always @(posedge clk)
begin
    AdderOut = Adder;
    instmemOut = instmem;  
end


endmodule
