// This file controls all control signals for the CPU

`include "riscv32_starter.sv"
module control(instr, read_data1, read_data2, jump, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, ALUSrd, RegWrite,PC4toReg);
    // assign inputs and outputs
	 input logic [31:0] instr, read_data1, read_data2;
	 opcode_q opcode;
	 instr_format format;
	 funct3 func3;
    output logic Branch, MemtoReg, ALUSrc, ALUSrd, RegWrite, PC4toReg, jump;
    output logic [3:0] MemRead, MemWrite;
	 output logic [1:0] ALUOp;
	
	 assign opcode = decode32_opcode_q(instr);
	 assign format = decode32_format(opcode);
	 assign func3 = decode32_funct3(instr);
	 
	 // assign controls based on opcode, format and funct3 
    always_comb begin 
		if (instr == 32'h0) begin
			  Branch = 1'b0;
			  MemRead = 4'b0000;
			  MemtoReg = 1'b0;
			  MemWrite = 4'b0000;
			  ALUSrc = 1'b0;
			  ALUSrd = 0;
			  RegWrite = 1'b0;
			  ALUOp = 2'bxx;
			  PC4toReg = 1'b0;
			  jump = 0;
		 end 
		 else begin
		
        case(format)
		  // assign r format control signals
        r_format: begin 
                    Branch = 1'b0;
                    MemRead = 4'b0000;
                    MemtoReg = 1'b0;
                    MemWrite = 4'b0000;
                    ALUSrc = 1'b0;
						  ALUSrd = 0;
                    RegWrite = 1'b1;
                    ALUOp = 2'b10;
                    PC4toReg = 1'b0;
						  jump = 0;
                end 
        i_format: begin 
			// assign i format controls
                    case(instr[6:0]) //load controls
                        7'b0000011: begin
									Branch = 0;
                            MemtoReg = 1;
                            MemWrite = 4'b0000;
                            ALUSrc = 1;
									 ALUSrd = 0;
                            RegWrite = 1;
                            ALUOp = 2'b00;
                            PC4toReg = 0;
									 jump = 0;
									case(func3) 
										3'b010:MemRead = 4'b1111;// lw
										3'b000: if (read_data1 % 4 ==0) MemRead= 4'b0001; // lb
													else if (read_data1 % 4 ==1) MemRead= 4'b0010;
													else if (read_data1 % 4 ==2) MemRead= 4'b0100;
													else if (read_data1 % 4 ==3) MemRead= 4'b1000;
										default: MemRead = 4'b1111;
									endcase
                        end
                        7'b0010011: begin // addi
                            Branch = 0;
                            MemRead = 4'b0000;
                            MemtoReg = 0;
                            MemWrite = 4'b0000;
                            ALUSrc = 1;
									 ALUSrd = 0;
                            RegWrite = 1;
                            ALUOp = 2'b00;
                            PC4toReg = 0;
									 jump = 0;
                        end
								7'b1100111: begin //jalr
                            Branch = 0;
                            MemRead = 4'b0000;
                            MemtoReg = 0;
                            MemWrite = 4'b0000;
                            ALUSrc = 1;
									 ALUSrd = 0;
                            RegWrite = 0;
                            ALUOp = 2'b00;
                            PC4toReg = 1;
									 jump = 1;
								 end
                    endcase 
                end
        s_format: begin 
		  // assign format controls
                    case(instr[6:0]) 
                        7'b0100011: begin //store
                            Branch = 0;
                            MemRead = 4'b0000;
                            MemtoReg = 1'bx;
                            ALUSrc = 1;
									 ALUSrd = 0;
                            RegWrite = 0;
                            ALUOp = 2'b00;
                            PC4toReg = 0;
									 jump = 0;
									 case(func3) 
										3'b010:MemWrite = 4'b1111;// lw
										3'b000: if (read_data1 % 4 ==0) MemWrite= 4'b0001; // lb
													else if (read_data1 % 4 == 1) MemWrite = 4'b0010;
													else if (read_data1 % 4 == 2) MemWrite= 4'b0100;
													else if (read_data1 % 4 == 3) MemWrite= 4'b1000;
										default: MemWrite = 4'b1111;
									endcase
                        end
                        default: begin 
                            Branch = 0;
                            MemRead = 4'b0000;
                            MemtoReg = 1'bx;
                            MemWrite = 4'b1111;
                            ALUSrc = 1;
									 ALUSrd = 0;
                            RegWrite = 0;
                            ALUOp = 2'b00;
                            PC4toReg = 0;
									 jump = 0;
                        end
                    endcase 
                end
        b_format: begin // beq
			// assign branch controls
                    Branch = 1;
                    MemRead = 4'b0000;
                    MemtoReg = 1'bx;
                    MemWrite = 4'b0000;
                    //ALUSrc = 0;
						  ALUSrc = 1;
						  ALUSrd = 1;
                    RegWrite = 0;
                    ALUOp = 2'b00;
                    PC4toReg = 0;
						  jump = 0;
                end
        j_format: begin // jal
		  // assign j format controls
                    Branch = 0;
                    MemRead = 4'b0000;
                    MemtoReg = 0;
                    MemWrite = 4'b0000;
                    ALUSrc = 1'b1;
						  ALUSrd = 1;
                    RegWrite = 1;
                    ALUOp = 2'bxx;
						  PC4toReg = 1;
						  jump = 1;
                end 
        default:  begin 
		// assign default controls
                    Branch = 0;
                    MemRead = 4'b0000;
                    MemtoReg = 0;
                    MemWrite = 4'b0000;
                    ALUSrc = 0;
						  ALUSrd = 0;
                    RegWrite = 1;
                    ALUOp = 2'b10;
						  PC4toReg = 0;
						  jump = 1;
                end
        endcase
	  end
    end 
endmodule
        

        
