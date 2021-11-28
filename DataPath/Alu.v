`timescale 1ns/1ns

module Alu(
    input [31:0]OP1,
    input [31:0]OP2,
    input [2:0]Sel,
    output reg [31:0]Result,
    output reg ZeroFlag
);

always @* begin
    case(Sel)
        3'b000: Result = OP1 + OP2;
        3'b001: Result = OP1 - OP2;
        3'b011: Result = OP1 * OP2;
        3'b100: Result = OP1 / OP2;
        3'b101: Result = OP1 & OP2;
        3'b110: Result = OP1 | OP2;
        3'b111: Result = OP1 << 1;
        3'b010: Result = OP1 < OP2 ? 1 : 0;
    endcase
    ZeroFlag<=(!Result)?0 : 1;     
end
endmodule