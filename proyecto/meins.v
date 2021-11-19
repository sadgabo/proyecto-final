`timescale 1ns/1ns
module memins(
	input[31:0]adr,
	output reg[31:0]instruccion
);

reg [7:0]Sram[0:359];
always @*
begin
instruccion={Sram[adr],Sram[adr+1],Sram[2],Sram[3]};
end
initial
begin
$readmemb("TestF1_MemInst.mem",Sram);
end
endmodule
