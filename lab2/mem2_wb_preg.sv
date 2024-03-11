`include "riscv32_starter.sv"
module mem2_wb_preg(clk, reset, control_mem2, PC4_mem2, ALU_mem2, write_reg_mem2, instr_mem2, //opcode_mem2,
										control_wb, PC4_wb, ALU_wb, write_reg_wb, instr_wb); //opcode_wb);
	input logic clk, reset;
	input logic [31:0] control_mem2, PC4_mem2,  ALU_mem2, instr_mem2;
	input logic [4:0] write_reg_mem2;
	//input opcode_q opcode_mem2;
	
	output logic [31:0] control_wb, PC4_wb, ALU_wb, instr_wb;
	output logic [4:0] write_reg_wb;
	//output opcode_q opcode_wb;
	
	always @(posedge clk) begin 
		control_wb <= control_mem2;
		instr_wb <= instr_mem2;
		PC4_wb <= PC4_mem2;
		//data_wb <= data_mem2;
		write_reg_wb <= write_reg_mem2;
		ALU_wb <= ALU_mem2;
		//opcode_wb <= opcode_mem2;
	end 
endmodule 