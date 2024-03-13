`include "riscv32_starter.sv"
// register for mem2 and writeback pipelining
module mem2_wb_preg(clk, reset,stall, control_mem2, PC4_mem2, ALU_mem2, write_reg_mem2, instr_mem2, 
										control_wb, PC4_wb, ALU_wb, write_reg_wb, instr_wb);
	input logic clk, reset, stall;
	input logic [31:0] control_mem2, PC4_mem2,  ALU_mem2, instr_mem2;
	input logic [4:0] write_reg_mem2;
	
	output logic [31:0] control_wb, PC4_wb, ALU_wb, instr_wb;
	output logic [4:0] write_reg_wb;

	// registers on pos clock cycle
	always @(posedge clk) begin
		control_wb <= control_mem2;
		instr_wb <= instr_mem2;
		PC4_wb <= PC4_mem2;
		write_reg_wb <= write_reg_mem2;
		ALU_wb <= ALU_mem2;
	end 
endmodule 
