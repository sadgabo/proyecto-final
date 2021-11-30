`timescale 1ns/1ns

module ShiftLeft(
    input [31:0]ShifLeftIn,
    output [31:0]ShiftLeftOut
);

assign ShiftLeftOut = ShifLeftIn<<2;

endmodule