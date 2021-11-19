module Alu(
   input [31:0]op1,
   input [31:0]op2,
   input [2:0]sel,
   output reg[31:0]Result,//C
   output reg zflag
);
   
always @*
 begin
     case(sel)
     3'b000:
     begin
        Result=op1+op2;
     end
     3'b001:
     begin
        Result =op1-op2;
     end
     3'b011:
     begin
        Result=op1*op2;
     end
     3'b100:
     begin
        Result=op1/op2;
     end
     3'b101:
     begin
        Result = op1 & op2;
     end
     3'b111:
     begin
        Result = op1 | op2;
     end
     3'b110:
     begin
        Result = op1<<1;
     end
     3'b010:
     begin
        Result = op1<op2?1:0; //op1 ^ op2;
     end
     endcase
zflag<=(!Result)? 0 : 1;
    
end
endmodule