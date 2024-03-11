// this module controls the opperations of the ALU

module ALU(ALU_inA, ALU_control, ALU_inB, zero, ALU_result);
	//assign inputs and outputs
	input logic [31:0] ALU_inA, ALU_inB;
	input logic [3:0] ALU_control;
	output logic [31:0] ALU_result;
	output logic zero;
	
	// based on ALU control select the ALUs operation
	always_comb begin 
		case (ALU_control)
			4'b0000: begin zero = 0;
						ALU_result = ALU_inA & ALU_inB; 
						end 
			4'b0001: begin zero = 0;
						ALU_result = ALU_inA | ALU_inB; 
						end 
			4'b0010: begin zero = 0;
						ALU_result = ALU_inA + ALU_inB; 
						end 
			4'b0110: begin zero = 0;
						ALU_result = ALU_inA - ALU_inB; 
						end 
			default: begin zero = 0;
						ALU_result = ALU_inA;
						end 
		endcase 
	end 
endmodule
						