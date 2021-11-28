`timescale 1ns/1ns

module PC(
    input clk,
    input [31:0]InstIn,
    output reg[31:0]InstOut
);

always @(posedge clk)begin
	InstOut = InstIn;
end

initial 
begin
	InstOut=32'd0;
end

    
endmodule