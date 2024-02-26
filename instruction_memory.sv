module instruction_memory(clk, reset, PC_out, intruct);
	input logic  clk, reset;
	input logic [31:0] PC_out;
	output memory_io_rsp rsp_q;
	
	
	memory_io_req req = { PC_out, 32'b0, 4'b1, 4'b0, 1'b1, 2'b00};
	
	memory instr_mem(.req, .rsp_q);
			
	
endmodule 
	
	