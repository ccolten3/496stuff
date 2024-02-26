module ALU_control (ALUOp, func7, func3, ALU_control);
	input logic [1:0] ALUOp;
	input logic [6:0] func7;
	input logic [2:0] func3;
	output logic [3:0] ALU_control;
	 
	always_comb begin 
		case({ALUOp, func7, func3})
			12'b00xxxxxxxxxx: ALU_control = 4'b0010;
			12'bx1xxxxxxxxxx: ALU_control = 4'b0110;
			12'b1x0000000000: ALU_control = 4'b0010;
			12'b1x0100000000: ALU_control = 4'b0110;
			12'b1x0000000111: ALU_control = 4'b0000;
			12'b1x0000000110: ALU_control = 4'b0001;
		endcase 
	end 
endmodule