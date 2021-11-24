`timescale 1ns/1ns

module ALU1(
   input [31:0]op1,
   input [31:0]op2,
   input [2:0]sel,
   output reg[31:0]Result,//C
   output reg zflag
);

always @* begin
     case(sel)
         3'b000: Result = op1 + op2;
         3'b001: Result = op1 - op2;
         3'b011: Result = op1 * op2;
         3'b100: Result = op1 / op2;
         3'b101: Result = op1 & op2;
         3'b110: Result = op1 | op2;
         3'b111: Result = op1 << 1;
         3'b010: Result = op1 < op2 ? 1 : 0; //op1 ^ op2;
     endcase
     zflag<=(!Result)? 0 : 1;
end
endmodule
