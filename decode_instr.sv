module decode_instr(clk, memory_io_rsp rsp_q);
	input memory_io_rsp rsp_q;
	output logic [6:0] opcode;
	output logic [4:0] reg1R, reg2R, reg3W;
	
	
	
	//decode32_opcode_q(instr32 instr);
	assign instr_format = decode32_format(decode32_opcode_q(rsp_q.data));
	
	assign opcode = decode32_opcode(rsp_q.data);
	
	