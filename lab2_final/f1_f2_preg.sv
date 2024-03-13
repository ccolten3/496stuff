module f1_f2_preg(clk, reset, PC4_f1, PC_out_f1, PC4_f2, PC_out_f2);
	input logic clk, reset;
	input logic [31:0] PC4_f1, PC_out_f1;
	output logic [31:0] PC4_f2, PC_out_f2;

	
	always @(posedge clk) begin 
		if (reset) begin 
			PC4_f2 <= 32'h0;
			PC_out_f2 <= 32'h0;
		end else begin
			PC4_f2 <= PC4_f1;
			PC_out_f2 <= PC_out_f1;
		end
	end
endmodule
