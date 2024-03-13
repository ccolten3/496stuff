// execution memory register for pipelining
`include "riscv32_starter.sv"
module ex_mem1_preg(clk, reset, stall, flush, branch_ex,control_ex, ALU_ex, write_reg_ex, PC4_ex, write_data_ex, instr_ex, branch_addr_ex, 
											branch_mem1,control_mem1, ALU_mem1, write_reg_mem1, PC4_mem1, write_data_mem1, instr_mem1, branch_addr_mem1); 
	input logic clk, reset, stall, branch_ex, flush;
	input logic [31:0] control_ex, PC4_ex, write_data_ex, ALU_ex, instr_ex, branch_addr_ex;
	input logic [4:0] write_reg_ex;
	
	output logic [31:0] control_mem1, PC4_mem1, write_data_mem1, ALU_mem1, instr_mem1, branch_addr_mem1;
	output logic [4:0] write_reg_mem1;
	output logic branch_mem1;
	
	// registers for pipeline
	always @(posedge clk) begin
		instr_mem1 <= instr_ex;
		if (flush) control_mem1 <= 32'h0;
		else 
		control_mem1 <= control_ex;
		write_data_mem1 <= write_data_ex;
		PC4_mem1 <= PC4_ex;
		write_reg_mem1 <= write_reg_ex;
		ALU_mem1 <= ALU_ex; 
		branch_addr_mem1 <= branch_addr_ex;
		branch_mem1 <= branch_ex;
		//opcode_mem1 <= opcode_ex;
	end
endmodule
		
	
