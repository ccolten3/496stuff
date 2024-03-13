//`include "memory_io.sv"
// decode execution register
`include "riscv32_starter.sv"
module dec_ex_preg(clk, reset, stall, flush, cycle_count, control_dec, read_data1_dec, read_data2_dec, PC4_dec, PC_out_dec, imm_dec, write_reg_dec, func7_dec, func3_dec, instr_dec,  
									control_ex, read_data1_ex, read_data2_ex, PC4_ex, PC_out_ex, imm_ex, write_reg_ex, func7_ex, func3_ex, instr_ex);
	input logic clk, reset, stall, flush;
	input logic [2:0] cycle_count;
	input logic [31:0] control_dec, read_data1_dec, read_data2_dec, PC4_dec, PC_out_dec, imm_dec, instr_dec;
	input logic [4:0] write_reg_dec;
	input funct7 func7_dec;
	input funct3 func3_dec;
	logic [2:0] flush_count;
	
	output logic [31:0] control_ex, read_data1_ex, read_data2_ex, PC4_ex, PC_out_ex, imm_ex, instr_ex;
	output logic [4:0] write_reg_ex;
	output funct7 func7_ex;
	output funct3 func3_ex;

	// registers decoding values for pipelining
	always @(posedge clk) begin 
		if (reset) flush_count <= 0;
		
		
		instr_ex <= instr_dec;
		if ((stall  && cycle_count <3))begin  control_ex <= 32'h0; 
		end else if (flush) begin  control_ex <= 32'h0; flush_count <= 1'b1;
		end else if ((flush_count > 0)&& flush_count < 3)begin flush_count <= flush_count + 1'b1; control_ex <= 32'h0; end
		else  
		control_ex <= control_dec;
		
		read_data1_ex <= read_data1_dec;
		read_data2_ex <= read_data2_dec;
		PC4_ex <= PC4_dec;
		PC_out_ex <= PC_out_dec;
		imm_ex <= imm_dec;
		write_reg_ex <= write_reg_dec;
		func7_ex <= func7_dec;
		func3_ex <= func3_dec;
	end 
endmodule 
