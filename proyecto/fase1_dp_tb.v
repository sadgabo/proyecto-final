`timescale 1ns/1ns
module fase1_dp_tb();

reg clk;

Fase1 duv(clk);

	initial begin
	$dumpfile("fase1_dp_tb.vcd");
    $dumpvars(0,fase1_dp_tb);
	clk<=0;
	#300;
	end

	always #50 clk = ~clk;	

endmodule	