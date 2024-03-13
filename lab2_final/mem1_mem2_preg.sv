`include "riscv32_starter.sv"
module mem1_mem2_preg(clk, reset, stall, control_mem1, ALU_mem1, write_reg_mem1, PC4_mem1, read_data2_mem1, instr_mem1, //opcode_mem1, 
											control_mem2, ALU_mem2, write_reg_mem2, PC4_mem2, read_data2_mem2, instr_mem2); //opcode_mem2);
	input logic clk, reset, stall;
	input logic [31:0] control_mem1, PC4_mem1, read_data2_mem1, ALU_mem1, instr_mem1;
	input logic [4:0] write_reg_mem1;
	
	output logic [31:0] control_mem2, PC4_mem2, read_data2_mem2, ALU_mem2, instr_mem2;
	output logic [4:0] write_reg_mem2;
	
	always @(posedge clk) begin 
		control_mem2 <= control_mem1;
		instr_mem2 <= instr_mem1;
		read_data2_mem2 <= read_data2_mem1;
		PC4_mem2 <= PC4_mem1;
		write_reg_mem2 <= write_reg_mem1;
		ALU_mem2 <= ALU_mem1;
	end 
endmodule 
	