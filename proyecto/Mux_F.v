`timescale 1ns/1ns

module Mux_F (
    input [31:0]A1,
    input [31:0]B1,
    input sel1,
    output reg [31:0]C1
);

always @* 
begin
    case(sel1)
        1'b0: C1 = A1;

        1'b1: C1 = B1;
    endcase
end
endmodule