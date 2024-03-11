module f2_dec_preg(clk, reset, PC_out_f2, PC4_f2, stall, PC_out_dec, PC4_dec);
	input logic clk, reset, stall;
	input logic [31:0] PC_out_f2, PC4_f2;
	output logic [31:0] PC_out_dec, PC4_dec;
	
	always @(posedge clk) begin
		if (reset) begin
			//instr_dec <= 32'h0;	
			PC_out_dec <= 32'h0;
			PC4_dec <= 32'h0;
		end else if (~stall) begin 
			//instr_dec <= instr_f2;
			PC_out_dec <= PC_out_f2;
			PC4_dec <= PC4_f2;
		end 
	end 
endmodule
			