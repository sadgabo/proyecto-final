`timescale 1ns/1ns

module muxD(
	input [31:0]pc_adder,
    input [31:0]shift_adder,
	input sel,
	output reg [31:0]pc_out
);

always@* begin 

	case(sel)

		1'b0:
		begin
			pc_out = pc_adder;
		end
		1'b1:
		begin
			pc_out = shift_adder;
		end

	endcase
end
endmodule   