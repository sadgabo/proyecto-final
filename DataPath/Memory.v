`timescale 1ns/1ns

module Memory(
    input [31:0]Address,
    input [31:0]WriteData,
    input MemWrite,
    input MemRead,
    output reg [31:0]ReadData
);

reg [31:0]Mem[0:31];

always @* begin
    if(MemWrite)
        begin
            Mem[Address] = WriteData;
        end
    else if(MemRead)
        begin
            ReadData = Mem[Address];
        end
    else
        begin
            ReadData = 32'dx;
        end
end

initial begin     
	Mem[0]=32'd65;
	Mem[1]=32'd110;
	Mem[2]=32'd103;
	Mem[3]=32'd101;
	Mem[4]=32'd108;
	Mem[5]=32'd32;
	Mem[6]=32'd77;
	Mem[7]=32'd101;
	Mem[8]=32'd114;
	Mem[9]=32'd99;
	Mem[10]=32'd97;
	Mem[11]=32'd100;
	Mem[12]=32'd111;
	#100;
	$stop;
end
endmodule