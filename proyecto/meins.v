`timescale 1ns/1ns

module memins(
	input[31:0]adr,
	output reg[31:0]instruccion
);

reg [7:0] Sram [0:399];

initial $readmemb("TestF2_MemInst.mem", Sram);

always @* begin
	instruccion = { Sram[adr], Sram[adr+1], Sram[adr+2], Sram[adr+3] };
end

endmodule
