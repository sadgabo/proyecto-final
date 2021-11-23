`timescale 1ns/1ns

module Bufer_IF_ID(
    input [31:0]Adder,
    input [31:0]instmem,
    output reg [31:0]AdderOut,
    output reg [31:0]instmemOut
);

always @* 
begin
    AdderOut = Adder;
    instmemOut = instmem;  
end


endmodule
