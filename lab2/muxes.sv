// this file contains the two types of muxes used in the processor

module mux2_1_32(A, B, sel, out);
	input logic [31:0] A, B;
	input logic sel;
	output logic [31:0] out;
	
	//assign out = (sel==1'b) ? A : B;
	always_comb begin 
		casex(sel)
			1'bx: out = B;
			1'b1: out = A;
			1'b0: out = B;
			default: out = B;
		endcase 
	end
endmodule

module mux3_1_32(A, B, C, sel1, sel2, out);
	input logic [31:0] A, B, C;
	input logic sel1, sel2;
	output logic [31:0] out;
	
	always_comb begin 
		if (sel2) out = C;
		else if (sel1) out = A;
		else out = B;
	end 
endmodule
	
	
	