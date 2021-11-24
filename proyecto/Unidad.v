`timescale 1ns/1ns
module Unidad(
	input[5:0]op,
	output reg regdst,
	output reg branch,
	output reg memread,
	output reg memreg,
	output reg memwrite,
	output reg alusrc,
	output reg regwrite,
	output reg [2:0]alop
);
always @* begin
	case (op)
		//tipo R  //modificar las señales de todos los cases
		6'b000000: 
		begin
			regdst=1'b1;
			branch=1'b0;
			memread=1'b0;
			memreg=1'b0;
			memwrite=1'b0;
			alusrc=1'b0;
			regwrite=1'b1;
			alop=3'b111;
		end
		//LW
		6'b100011:
		begin
			regdst=1'b0;
			branch=1'b0;
			memread=1'b1;
			memreg=1'b1;
			memwrite=1'b0;
			alusrc=1'b1;
			regwrite=1'b1;
			alop=3'b111;
		end
		//SW
		6'b101011:
		begin 
			regdst=1'bX;
			branch=1'b0;
			memread=1'b0;
			memreg=1'b0;
			memwrite=1'b1;
			alusrc=1'b1;
			regwrite=1'b0;
			alop=3'b111;
		end
		//BEQ
		6'b000100:
		begin
			regdst=1'bx;
			branch=1'b1;
			memread=1'b0;
			memreg=1'b0;
			memwrite=1'b0;
			alusrc=1'b0;
			regwrite=1'b0;
			alop=3'bx;
		end
		//Addi
		6'b001000:
		begin
			regdst=1'b0;
			branch=1'b0;
			memread=1'b0;
			memreg=1'b0;
			memwrite=1'b0;
			alusrc=1'b1;
			regwrite=1'b1;
			alop=3'b000;	
		end
		//Andi
		6'b001100:
		begin
			regdst=1'b0;
			branch=1'b0;
			memread=1'b0;
			memreg=1'b0;
			memwrite=1'b0;
			alusrc=1'b1;
			regwrite=1'b1;
			alop=3'b101;	
			
		end
		//SLTI
		6'b001010:
		begin//modificar las señales 
			regdst=1'b0;
			branch=1'b0;
			memread=1'b0;
			memreg=1'b0;
			memwrite=1'b0;
			alusrc=1'b1;
			regwrite=1'b1;
			alop=3'b010;
		end
		//ORI
		6'b001101:
		begin
			regdst=1'b0;
			branch=1'b0;
			memread=1'b0;
			memreg=1'b0;
			memwrite=1'b0;
			alusrc=1'b1;
			regwrite=1'b1;
			alop=3'b110;
		end
		

	endcase
end
endmodule
