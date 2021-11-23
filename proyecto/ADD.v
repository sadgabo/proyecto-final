`timescale 1ns/1ns//fase 2

module ADD (
    input [31:0]A,
    input [31:0]B,
    output [31:0]AddOut
);

assign AddOut = A + B;

endmodule
