`timescale 1ns/1ns

module fase1_dp_TB();

reg clk;

fase1_dp duv(clk);

initial begin
    $dumpfile("fase1_dp_TB.vcd");
    $dumpvars(0,fase1_dp_TB);
forever begin
    clk=0;
    #50 clk=~clk;
    #1000;
end
end
endmodule