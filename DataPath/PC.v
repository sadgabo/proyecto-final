module PC(
    input clk,
    input[31:0]InstIn,
    output reg[31:0]InstOut
);

initial InstOut=32'b0;


always @(posedge clk)begin
	InstOut = InstIn;
end
endmodule