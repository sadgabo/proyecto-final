`timescale 1ns/1ns
module Alucontrol(
	input [2:0]uc,
	input [5:0]ins,
	output reg [2:0]so
);
always@*
	case(uc)
	3'b111:
	begin
	case (ins)
	6'b100000:
	begin
	so = 3'b001;
	end
	6'b100100:
	begin
	so = 3'b111;
	end
	6'b100101:
	begin
	so = 3'b000;
	end
	6'b100010:
	begin
	so = 3'b100;
	end
	6'b101010:
	begin
	so = 3'b101;
	end
	endcase
end
endcase
endmodule
	
