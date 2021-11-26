`timescale 1ns/1ns

module MUX323(
	input [31:0]o5,
	input [31:0]o6,
	input select3,
	output reg [31:0]sal3
);

always@* begin 
	case(select3)

		1'b0:
		begin
			sal3=o5;
		end
		1'b1:
		begin
			sal3=o6;
		end

	endcase
end
endmodule
