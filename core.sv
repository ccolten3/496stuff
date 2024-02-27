module core32(
	input logic clk,
	input logic reset,
	input logic reset_pc,
	output inst_mem_req,
	input inst_mem_rsp,
	input logic inst_mem_req_ack,

	output data_mem_req,
	input data_mem_rsp,
	output logic data_mem_req_ack
    );

	logic [31:0] PC_in, PC_out, instr, write_data, read_data1, read_data2;
	logic [31:0] immediate_gen, ALU_mux_in, ALU_result, data_mem_out;
	logic Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, PC4toReg, zero;
	logic [1:0] ALUOp;
	
	//functions for determining instruction formating from risc32_starter.sv
	assign instr = inst_mem_rsp.data; // define instructions
	
	opcode_q opcodeq = decode32_opcode_q(instr); //define opcode_q
	
	instr_format format = decode32_format(opcodeq);// define format
	
	
	//program counter
	program_counter PC (.clk, .reset, .PC_in, .PC_out);
	assign inst_mem_req.addr = PC_out;
	assign inst_mem_req.valid = 1'b1;
	
	
	//registers
	registers registers(.clk, .reset, .read_reg1(inst[19:15]), .read_reg2(intr[24:20]), .write_reg(instr[11:7]), 
								.write_data, .RegWrite, .read_data1, .read_data2);
	
	//Immediate Generation
	assign immediate_gen = decode32_imm(instr, format);
	
	//control logic
	control control(.opcode(instr[6:0]), .Branch, .MemRead, .MemtoReg, .ALUOp, .MemWrite, .ALUSrc, .RegWrite,.PC4toReg);
	
	// muxed registers output
	mux2_1_32 reg_mux (.A(immediate_gen), .B(read_data2), .sel(ALUSrc), .out(ALU_mux_in));
	
	//ALU control logic
	ALU_control AlU_cont(.ALUOp, func7, func3, ALU_control);
	
	//ALU
	ALU ALU(.read_data1, .ALU_control, .Mux(ALU_mux_in), .zero, .ALU_result);
	
	assign data_mem_req.do_write = MemWrite;
	assign data_mem_reg.do_read = MemRead;
	assign data_mem_reg.addr = ALU_result;
	assign data_mem_req.data = read_data2;
	assign data_mem_req.valid = 1'b1;
	// assign data_mem_req.dummy = 
	
	assign data_mem_out = data_mem_rsp.data
	mux3_1_32 data_out_mux (.A(data_mem_out), .B(ALU_result), .C(PC4), .sel1(MemtoReg), .sel2(PC4toReg), .out(write_data);
	
	

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

