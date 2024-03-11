// this file contains the instructions for encoding the ALU control signals

module ALU_ctrl (ALUOp, func7, func3, ALU_control);
	input logic [1:0] ALUOp;
	input logic [6:0] func7;
	input logic [2:0] func3;
	output logic [3:0] ALU_control;
	logic [11:0] combined;
	assign combined = {ALUOp, func7, func3};

	 // based on ALUOp, funct7, and funct3 assign the ALU control signals
	always_comb begin 
		casex(combined)
			12'b00_xxxxxxx_xxx: ALU_control = 4'b0010;
			12'bx1_xxxxxxx_xxx: ALU_control = 4'b0110;
			12'b1x_0000000_000: ALU_control = 4'b0010;
			12'b1x_0100000_000: ALU_control = 4'b0110;
			12'b1x_0000000_111: ALU_control = 4'b0000;
			12'b1x_0000000_110: ALU_control = 4'b0001;
		endcase 
	end
endmodule 

			
			