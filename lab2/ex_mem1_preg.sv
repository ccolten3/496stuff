`include "riscv32_starter.sv"
module ex_mem1_preg(clk, reset, control_ex, ALU_ex, write_reg_ex, PC4_ex, read_data2_ex, instr_ex, branch_addr_ex, //opcode_ex,
											control_mem1, ALU_mem1, write_reg_mem1, PC4_mem1, read_data2_mem1, instr_mem1, branch_addr_mem1); //opcode_mem1);
	input logic clk, reset;
	input logic [31:0] control_ex, PC4_ex, read_data2_ex, ALU_ex, instr_ex, branch_addr_ex;
	input logic [4:0] write_reg_ex;
	//input opcode_q opcode_ex;
	
	output logic [31:0] control_mem1, PC4_mem1, read_data2_mem1, ALU_mem1, instr_mem1, branch_addr_mem1;
	output logic [4:0] write_reg_mem1;
	//output opcode_q opcode_mem1;
	
	always @(posedge clk) begin
		instr_mem1 <= instr_ex;
		control_mem1 <= control_ex;
		read_data2_mem1 <= read_data2_ex;
		PC4_mem1 <= PC4_ex;
		write_reg_mem1 <= write_reg_ex;
		ALU_mem1 <= ALU_ex; 
		branch_addr_mem1 <= branch_addr_ex;
		//opcode_mem1 <= opcode_ex;
	end
endmodule
		
	