`timescale 1ns/1ns

module SignExtend(
    input [15:0]InSingExtend,
    output [31:0]SignExtendOut
);

assign SignExtendOut = { { 16 { InSingExtend [15] } },InSingExtend };

endmodule