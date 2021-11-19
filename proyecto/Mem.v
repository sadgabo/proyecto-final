`timescale 1ns/1ns
module Mem(
	input [31:0] dir,
	input [31:0]datain,
	input memwrites,
	input memreads,
	output reg [31:0] dataout
	
);
reg [31:0]mem [0:31];

always @*
begin
	if(memwrites)
	begin
	mem[dir]=datain;
	end
	else if(memreads)
	begin
	dataout=mem[dir];
	end
	else 
	begin
	dataout=32'dx;
	end

end
initial
begin     
	mem[0]=32'd65;
	mem[1]=32'd110;
	mem[2]=32'd103;
	mem[3]=32'd101;
	mem[4]=32'd108;
	mem[5]=32'd32;
	mem[6]=32'd77;
	mem[7]=32'd101;
	mem[8]=32'd114;
	mem[9]=32'd99;
	mem[10]=32'd97;
	mem[11]=32'd100;
	mem[12]=32'd111;
	#100;
	$stop;
end
endmodule
