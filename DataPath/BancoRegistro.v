`timescale 1ns/1ns
module BancoRegistro(
    input [4:0] ReadReg1,
	input [4:0] ReadReg2,
	input [31:0] WriteData,
	input [4:0] WriteRegister,
	input enesc,
	output reg [31:0] ReadData1,
	output reg [31:0] ReadData2
);

reg[31:0] BR [0:31];

initial $readmemb("TestF1_Breg.mem",BR);

always @* 
begin
    if(enesc==1)begin
        BR[WriteRegister]=WriteData;
    end
    ReadData1=BR[ReadReg1];
    ReadData2=BR[ReadReg2];
    
end
endmodule