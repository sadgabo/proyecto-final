`timescale 1ns/1ns

module AluControl(
    input [2:0]UC,
    input [5:0]Instruction,
    output reg [2:0]AluOut
);

always @* begin
    case(UC)
        3'b111:begin
            case(Instruction)
            6'b100000: AluOut = 3'b000;//add
            6'b100100: AluOut = 3'b101;//and
            6'b100101: AluOut = 3'b110;//or
            6'b100010: AluOut = 3'b001;//sub
            6'b101010: AluOut = 3'b010;//SLT
            endcase
        end 
        3'b000: AluOut = 3'b000;//ADDI
		3'b101: AluOut = 3'b101;//ANDI
        3'b001: AluOut = 3'b001;//sub
		3'b010: AluOut = 3'b010;//SLTI
		3'b110: AluOut = 3'b110;//ORI
    endcase
end
endmodule