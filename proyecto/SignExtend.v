`timescale 1ns/1ns

module SignExtend(
    input [15:0]SEentrada,
    output reg[31:0]SEsalida
);

always @*
begin
    if(SEentrada[15])
        SEsalida={16'd1,SEentrada};
    else
        SEsalida={16'd0,SEentrada};
end
endmodule
