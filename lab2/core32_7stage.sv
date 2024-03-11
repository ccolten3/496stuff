`include "memory_io.sv"
`include "riscv32_starter.sv"
module core32_7stage(
	input logic clk,
	input logic reset,
	input logic [31:0] reset_pc,
	output memory_io_req inst_mem_req,
	input memory_io_rsp inst_mem_rsp,
	output logic inst_mem_req_ack,

	output memory_io_req data_mem_req,
	input memory_io_rsp data_mem_rsp,
	output logic data_mem_req_ack
    );
	logic [31:0] PC_in, PC_out, instr, write_data, read_data1, read_data2;
	logic [31:0] immediate_gen, ALU_mux_in,ALU_mux1_in, ALU_result, data_mem_out, PC4, PC_imm;
	logic Branch, MemtoReg, ALUSrc, ALUSrd, RegWrite, PC4toReg, zero, valid ;
	logic [1:0] ALUOp;
	logic [3:0] ALU_control, MemRead, MemWrite;
	opcode_q opcode_dec;
	opcode_q	opcode_ex, opcode_mem1, opcode_mem2, opcode_wb;
	instr_format format_f2, format_dec, format_ex, format_mem1, format_mem2, format_wb;
	funct7 func7_dec, func7_ex;
	funct3 func3_dec, func3_ex;
	
	//-----------------------------------------------------------
	//                    IF1
	//-----------------------------------------------------------
	
	logic [31:0] PC_out_f1, PC_out_f2, PC_out_dec, PC_out_ex;
	logic [31:0] PC4_f1, PC4_f2, PC4_dec, PC4_ex, PC4_mem1, PC4_mem2, PC4_wb;
	
	program_counter PC (.clk, .reset, .reset_pc, .PC_in, .PC_out(PC_out_f1), .valid);
	assign inst_mem_req.addr = PC_out_f1;
	assign inst_mem_req.do_read = 4'b1111;
	assign inst_mem_req.valid = valid;
	
	addr_adder PC_plus4 (.clk, .toAdd(PC_out_f1), .added(PC4_f1));
	
	f1_f2_preg pipe_reg1 (.clk, .reset, .PC4_f1, .PC_out_f1, .PC4_f2, .PC_out_f2);
	
	//-----------------------------------------------------------
	//                    IF2
	//-----------------------------------------------------------
	
	logic [31:0] instr_dec, instr_ex, instr_mem1, instr_mem2, instr_wb;
	logic stall;
	//assign instr_f2 = inst_mem_rsp.data; // define instructions
//assign opcode_f2 = decode32_opcode_q(instr_f2); //define opcode_q
//assign format_f2 = decode32_format(opcode);// define format
//	assign func7_f2 = decode32_funct7(instr, format);
//	assign func3_f2 = decode32_funct3(instr);
	
	f2_dec_preg pipe_reg2 (.clk, .reset, .PC_out_f2, .PC4_f2, .stall, .PC_out_dec, .PC4_dec);
	
	//-----------------------------------------------------------
	//                    DECODE
	//-----------------------------------------------------------
	assign instr_dec = inst_mem_rsp.data;
	
	logic [31:0] control_dec, control_ex, control_mem1, control_mem2, control_wb;
	logic [31:0] read_data1_dec, read_data1_ex, read_data1_mem1, read_data1_mem2;
	logic [31:0] read_data2_dec, read_data2_ex, read_data2_mem1, read_data2_mem2;
	logic [31:0] imm_dec, imm_ex;
	logic [4:0] write_reg_dec, write_reg_ex, write_reg_mem1, write_reg_mem2, write_reg_wb;
	//logic stall;
	assign opcode_dec = decode32_opcode_q(instr_dec); //define opcode_q
	assign format_dec = decode32_format(opcode_dec);// define format
	assign func7_dec = decode32_funct7(instr_dec, format_dec);
	assign func3_dec = decode32_funct3(instr_dec);
	
	
	registers registers (.clk, .reset, .read_reg1(instr_dec[19:15]), .read_reg2(instr_dec[24:20]), .write_reg(write_reg_wb), 
								.write_data, .RegWrite(control_wb[11]), .read_data1(read_data1_dec), .read_data2(read_data2_dec));
	
	control control (.instr(instr_dec), .read_data1(read_data1_dec), .read_data2(read_data2_dec), 
											.Branch, .MemRead, .MemtoReg, .ALUOp, .MemWrite, .ALUSrc, .ALUSrd, .RegWrite, .PC4toReg);
											
	hazard_unit hazard_unit (.clk, .reset, .MemRead(control_ex[9:6]), .rd_ex(instr_ex[11:7]), .rs1_dec(instr[24:20]), .rs2_dec(instr_dec[24:20]), .stall);										
	
	//                   {[31:16]        15      14       13      12       11        10      [9:6]    [5:2]    [1:0]}
	assign control_dec = {{16{1'b0}}, Branch, MemtoReg, ALUSrc, ALUSrd, RegWrite, PC4toReg, MemRead, MemWrite, ALUOp};
	assign imm_dec = decode32_imm(instr_dec, format_dec);
	assign write_reg_dec = instr_dec[11:7];
	
	dec_ex_preg pipe_reg3 (.clk, .reset, .control_dec, .read_data1_dec, .read_data2_dec, .PC4_dec, .PC_out_dec, .imm_dec, .write_reg_dec, .func7_dec, .func3_dec, .instr_dec, //.opcode_dec, 
									.control_ex, .read_data1_ex, .read_data2_ex, .PC4_ex, .PC_out_ex, .imm_ex, .write_reg_ex, .func7_ex, .func3_ex, .instr_ex); //.opcode_ex);
								
	
	//-----------------------------------------------------------
	//                    EX
	//-----------------------------------------------------------
//	assign func7 = decode32_funct7(instr_ex, format_ex);
//	assign func3 = decode32_funct3(instr_ex);
	assign opcode_ex = decode32_opcode_q(instr_ex); //define opcode_q
	logic [31:0] ALU_ex, ALU_mem1, ALU_mem2, ALU_wb;
	logic [31:0] branch_addr_ex, branch_addr_mem1, branch_addr_mem2, branch_addr_wb;
	logic [2:0] forward_A, forward_B;
	logic [31:0] ALU_inA, ALU_inB;
	
//	
//	mux2_1_32 reg1_mux (.A(PC_out_ex), .B(read_data1_ex), .sel(control_ex[12]), .out(ALU_mux1_in));
//	// mux at read_data2 output of register selects between immediate and read_data2
//	mux2_1_32 reg_mux (.A(imm_ex), .B(read_data2_ex), .sel(control_ex[13]), .out(ALU_mux_in));
	
	always_comb begin
		case(forward_A)
			3'b010: ALU_inA = ALU_mem1;
			3'b000: ALU_inA = read_data1_ex;
			3'b011: ALU_inA = ALU_mem2;
			3'b001: ALU_inA = write_data;
			default: ALU_inA = read_data1_ex;
		endcase
		case(forward_B) 
			3'b010: ALU_inB = ALU_mem1;
			3'b000: ALU_inB = read_data2_ex;
			3'b011: ALU_inB = ALU_mem2;
			3'b001: ALU_inB = write_data;
			default: ALU_inA = read_data2_ex;
		endcase
	end 
	
	forward_unit forward_unit (.clk, .reset, .rd_ex(instr_ex[11:7]), .rs1_ex(instr_ex[24:20]), .rs2_ex(instr_ex[19:15]), .rd_mem1(instr_mem1[11:7]), 
												.rd_mem2(instr_mem2[11:7]), .rd_wb(instr_wb[11:7]),  .control_mem1, .control_mem2, .control_wb, .forward_A, .forward_B);
	
	ALU_ctrl AlU_cont (.ALUOp(control_ex[1:0]), .func7(func7_ex), .func3(func3_ex), .ALU_control);
	
	ALU ALU(.ALU_inA, .ALU_control, .ALU_inB, .zero, .ALU_result(ALU_ex));
	
	adder imm_pc_adder (.A(imm_ex), .B(PC_out_ex), .added(branch_addr_ex));
	
	ex_mem1_preg pipe_reg4 (.clk, .reset, .control_ex, .ALU_ex, .write_reg_ex, .PC4_ex, .read_data2_ex, .instr_ex, .branch_addr_ex, //.opcode_ex,
											.control_mem1, .ALU_mem1, .write_reg_mem1, .PC4_mem1, .read_data2_mem1, .instr_mem1, .branch_addr_mem1); //.opcode_mem1);
	
	//-----------------------------------------------------------
	//                    MEM1
	//-----------------------------------------------------------
	assign opcode_mem1 = decode32_opcode_q(instr_mem1); //define opcode_q
	
	assign data_mem_req.do_write = control_mem1[5:2];
	assign data_mem_req.do_read = control_mem1[9:6];
	assign data_mem_req.addr = ALU_mem1;
	assign data_mem_req.data = read_data2_mem1;
	assign data_mem_req.valid = 1'b1;
	//assign data_mem_out = data_mem_rsp.data;
	
	mux2_1_32 pcmux(.A(ALU_mem1), .B(PC4_f1), .sel(control_mem1[15]), .out(PC_in));
	
	mem1_mem2_preg pipe_reg5(.clk, .reset, .control_mem1, .ALU_mem1, .write_reg_mem1, .PC4_mem1, .read_data2_mem1,.instr_mem1,// .opcode_mem1, 
												.control_mem2, .ALU_mem2, .write_reg_mem2, .PC4_mem2, .read_data2_mem2, .instr_mem2); //.opcode_mem2);
	
	
	//-----------------------------------------------------------
	//                    MEM2
	//-----------------------------------------------------------
	assign opcode_mem2 = decode32_opcode_q(instr_mem2); //define opcode_q
	logic [31:0] data_mem2, data_wb;
	assign data_mem2 = data_mem_rsp.data;
	
	
	
	mem2_wb_preg pipe_reg6 (.clk, .reset, .control_mem2, .PC4_mem2, .ALU_mem2, .write_reg_mem2, .instr_mem2, //.opcode_mem2,
										.control_wb, .PC4_wb, .ALU_wb, .write_reg_wb, .instr_wb); //.opcode_wb);
	
	//-----------------------------------------------------------
	//                    WB
	//-----------------------------------------------------------
	assign opcode_wb = decode32_opcode_q(instr_wb); //define opcode_q
	assign data_wb = data_mem_rsp.data;
	
	mux3_1_32 data_out_mux (.A(data_wb), .B(ALU_wb), .C(PC4_wb), .sel1(control_wb[14]), .sel2(control_wb[10]), .out(write_data));
	
//	mux2_1_32 pcmux(.A(ALU_result), .B(PC4), .sel(Branch), .out(PC_in));
endmodule 	
	
