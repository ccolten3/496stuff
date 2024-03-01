`include "memory_io.sv"
`include "riscv32_starter.sv"
module core32(
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
	logic [31:0] immediate_gen, ALU_mux_in, ALU_result, data_mem_out, PC4, PC_imm;
	logic Branch, MemtoReg, ALUSrc, RegWrite, PC4toReg, zero, valid ;
	logic [1:0] ALUOp;
	logic [3:0] ALU_control, MemRead, MemWrite;
	opcode_q opcode;
	instr_format format;
	funct7 func7;
	funct3 func3;
	
	//functions for determining instruction formating from risc32_starter.sv
	assign instr = inst_mem_rsp.data; // define instructions
	
	//always_comb begin 
		
	assign opcode = decode32_opcode_q(instr); //define opcode_q
	
	assign format = decode32_format(opcode);// define format
	//end
	
	
	//program counter
	program_counter PC (.clk, .reset, .reset_pc, .PC_in, .PC_out, .valid);
	assign inst_mem_req.addr = PC_out;
	assign inst_mem_req.do_read = 4'b1111;
	//assign inst_mem_req_ack = valid; 
	assign inst_mem_req.valid = valid;
	
	addr_adder address_add(.clk, .toAdd(PC_out), .added(PC4));
	
	//registers
	registers registers(.clk, .reset, .read_reg1(instr[19:15]), .read_reg2(instr[24:20]), .write_reg(instr[11:7]), 
								.write_data, .RegWrite, .read_data1, .read_data2);
	
	//Immediate Generation
	assign immediate_gen = decode32_imm(instr, format);
	
	
	//control logic
	control control(.instr, .Branch, .MemRead, .MemtoReg, .ALUOp, .MemWrite, .ALUSrc, .RegWrite,.PC4toReg);
	
	// muxed registers output
	mux2_1_32 reg_mux (.A(immediate_gen), .B(read_data2), .sel(ALUSrc), .out(ALU_mux_in));
	
	
	//ALU control logic
	assign func7 = decode32_funct7(instr, format);
	assign func3 = decode32_funct3(instr);
	
	ALU_ctrl AlU_cont(.ALUOp, .func7, .func3, .ALU_control);
	
	//ALU
	ALU ALU(.read_data1, .ALU_control, .Mux(ALU_mux_in), .zero, .ALU_result);
	
	assign data_mem_req.do_write = MemWrite;
	assign data_mem_req.do_read = MemRead;
	assign data_mem_req.addr = ALU_result;
	assign data_mem_req.data = read_data2;
	assign data_mem_req.valid = 1'b1;
	// assign data_mem_req.dummy = 
	
	assign data_mem_out = data_mem_rsp.data;
	mux3_1_32 data_out_mux (.A(data_mem_out), .B(ALU_result), .C(PC4), .sel1(MemtoReg), .sel2(PC4toReg), .out(write_data));
	
	
	adder imm_plus_PC (.A(immediate_gen), .B(PC_out), .added(PC_imm));
	
	mux2_1_32 pcmux(.A(PC_imm), .B(PC4), .sel(Branch & zero), .out(PC_in));

endmodule 

	
module adder32 (
	input logic [31:0] A, 
	input logic [31:0] B,
	input logic Cin,
	output logic [31:0] S,
	output logic Cout,
	);

	assign {Cout, s} = A + B + Cin;
endmodule

module mux #(
	parameter WIDTH = 32
	) (
	input  logic [WIDTH-1:0] d0, d1, 
	input  logic             s, 
	output logic [WIDTH-1:0] y
	);

	assign y = s ? d1 : d0; 
endmodule

