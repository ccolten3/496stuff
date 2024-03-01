`include "riscv32_starter.sv"
module control(instr, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite,PC4toReg);
    input logic [31:0] instr;
//module control(input opcode_q opcode, input instr_format format, output logic Branch, MemtoReg, ALUSrc, RegWrite, PC4toReg, output logic [3:0] MemRead, MemWrite, output logic [1:0] ALUOp);
	 opcode_q opcode;
	 instr_format format;
	 funct3 func3;
    output logic Branch, MemtoReg, ALUSrc, RegWrite, PC4toReg;
    output logic [3:0] MemRead, MemWrite;
	 output logic [1:0] ALUOp;
	
	 assign opcode = decode32_opcode_q(instr);
	 assign format = decode32_format(opcode);
	 assign func3 = decode32_funct3(instr);
	 
    always_comb begin 
        case(format)
        r_format: begin 
                    Branch = 1'b0;
                    MemRead = 4'b0000;
                    MemtoReg = 1'b0;
                    MemWrite = 4'b0000;
                    ALUSrc = 1'b0;
                    RegWrite = 1'b1;
                    ALUOp = 2'b10;
                    PC4toReg = 1'b0;
                end 
        i_format: begin 
                    case(instr[6:0])
                        7'b0000011: begin
									Branch = 0;
                            MemtoReg = 1;
                            MemWrite = 4'b0000;
                            ALUSrc = 1;
                            RegWrite = 1;
                            ALUOp = 2'b00;
                            PC4toReg = 0;
									case(func3) 
										3'b010:MemRead = 4'b1111;// lw/lb
										3'b000:MemRead= 4'b0001;
										default: MemRead = 4'b1111;
									endcase
                        end
                        7'b0010011: begin //addi
                            Branch = 0;
                            MemRead = 4'b0000;
                            MemtoReg = 0;
                            MemWrite = 4'b0000;
                            ALUSrc = 1;
                            RegWrite = 1;
                            ALUOp = 2'b00;
                            PC4toReg = 0;
                        end
                    endcase 
                end
        s_format: begin 
                    case(instr[6:0]) 
                        7'b0100011: begin 
                            Branch = 0;
                            MemRead = 4'b0000;
                            MemtoReg = 1'bx;
                            ALUSrc = 1;
                            RegWrite = 0;
                            ALUOp = 2'b00;
                            PC4toReg = 0;
									 case(func3) 
										3'b010:MemWrite = 4'b1111;// lw
										3'b000:MemWrite= 4'b0001;//lb
										default: MemWrite = 4'b1111;
									endcase
                        end
                        default: begin 
                            Branch = 0;
                            MemRead = 4'b0000;
                            MemtoReg = 1'bx;
                            MemWrite = 4'b1111;
                            ALUSrc = 1;
                            RegWrite = 0;
                            ALUOp = 2'b00;
                            PC4toReg = 0;
                        end
                    endcase 
                end
        b_format: begin //beq 
                    Branch = 1;
                    MemRead = 4'b0000;
                    MemtoReg = 1'bx;
                    MemWrite = 4'b0000;
                    ALUSrc = 0;
                    RegWrite = 0;
                    ALUOp = 2'b01;
                    PC4toReg = 0;
                end
        j_format: begin //jal
                    Branch = 0;
                    MemRead = 4'b0000;
                    MemtoReg = 0;
                    MemWrite = 4'b0000;
                    ALUSrc = 1'bx;
                    RegWrite = 1;
                    ALUOp = 2'bxx;
						  PC4toReg = 1;
                end 
        default:  begin 
                    Branch = 0;
                    MemRead = 4'b0000;
                    MemtoReg = 0;
                    MemWrite = 4'b0000;
                    ALUSrc = 0;
                    RegWrite = 1;
                    ALUOp = 2'b10;
						  PC4toReg = 0;
                end
        endcase 
    end 
endmodule
        

        
