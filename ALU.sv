module ALU( read_data1, ALU_control, Mux, zero, ALU_result);
	input logic [31:0] read_data1, Mux;
	input logic [3:0] ALU_control;
	
	output logic [31:0] ALU_result;
	output logic zero;

	always_comb begin 
		case (ALU_control)
			4'b0000: begin zero = 0;
						ALU_result = read_data1 & Mux; 
						end 
			4'b0001: begin zero = 0;
						ALU_result = read_data1 | Mux; 
						end 
			4'b0010: begin zero = 0;
						ALU_result = read_data1 + Mux; 
						end 
			4'b0110: begin zero = 0;
						ALU_result = read_data1 - Mux; 
						end 
			defualt: begin zero = 0;
						ALU_result = read_data1;
						end 
		endcase 
	end 
	
endmodule
						