//`include "memory_io.sv"
`include "riscv32_starter.sv"
module dec_ex_preg(clk, reset, control_dec, read_data1_dec, read_data2_dec, PC4_dec, PC_out_dec, imm_dec, write_reg_dec, func7_dec, func3_dec, instr_dec,  
									control_ex, read_data1_ex, read_data2_ex, PC4_ex, PC_out_ex, imm_ex, write_reg_ex, func7_ex, func3_ex, instr_ex);
	input logic clk, reset;
	input logic [31:0] control_dec, read_data1_dec, read_data2_dec, PC4_dec, PC_out_dec, imm_dec, instr_dec;
	input logic [4:0] write_reg_dec;
	input funct7 func7_dec;
	input funct3 func3_dec;
	//input opcode_q opcode_dec;
	
	output logic [31:0] control_ex, read_data1_ex, read_data2_ex, PC4_ex, PC_out_ex, imm_ex, instr_ex;
	output logic [4:0] write_reg_ex;
	output funct7 func7_ex;
	output funct3 func3_ex;
	//output opcode_q opcode_ex;
	
	always @(posedge clk) begin 
		instr_ex <= instr_dec;
		control_ex <= control_dec;
		read_data1_ex <= read_data1_dec;
		read_data2_ex <= read_data2_dec;
		PC4_ex <= PC4_dec;
		PC_out_ex <= PC_out_dec;
		imm_ex <= imm_dec;
		write_reg_ex <= write_reg_dec;
		func7_ex <= func7_dec;
		func3_ex <= func3_dec;
		//opcode_ex <= opcode_dec;
	end 
endmodule 