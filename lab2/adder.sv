module adder (A, B, added);
	input logic [31:0] A, B;
	output logic [31:0] added;
	
	assign added = A + B;
endmodule 