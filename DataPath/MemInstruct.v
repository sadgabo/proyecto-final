`timescale 1ns/1ns

module MemInstruct(
    input [31:0]adr,
    output reg [31:0]instruc
);

reg [7:0]Sram[0:399];

initial $readmemb("TestF1_MemInsts.mem",Sram);

always @*begin
    instruc= { Sram[adr], Sram[adr+1], Sram[adr+2], Sram[adr+3] };

end
endmodule