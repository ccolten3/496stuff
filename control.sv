module control(opcode, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite,PC4toReg);
    input logic [6:0] opcode;
    output logic Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
    output logic [1:0] ALUOp;

    instr_format format = decode32_format(opcode[4:0]);

    always_comb begin 
        case(format)
        r_format: begin 
                    Branch = 0;
                    MemRead = 0;
                    MemtoReg = 0;
                    MemWrite = 0;
                    ALUSrc = 0;
                    RegWrite = 1;
                    ALUOp = 2'b10;
                    PC4toReg = 0;
                end 
        i_format: begin 
                    case(opcode) 
                        7'b0000011: begin // lw/lb
                            Branch = 0;
                            MemRead = 1;
                            MemtoReg = 1;
                            MemWrite = 0;
                            ALUSrc = 1;
                            RegWrite = 1;
                            ALUOp = 2'b00;
                            PC4toReg =0;
                        end
                        7'b0010011: begin //addi
                            Branch = 0;
                            MemRead = 0;
                            MemtoReg = 0;
                            MemWrite = 0;
                            ALUSrc = 1;
                            RegWrite = 1;
                            ALUOp = 2'b00;
                            PC4toReg =0;
                        end
                    endcase 
                end
        s_format: begin 
                    case(opcode) 
                        7'b0100011: begin 
                            Branch = 0;
                            MemRead = 0;
                            MemtoReg = 1'bx;
                            MemWrite = 1;
                            ALUSrc = 1;
                            RegWrite = 0;
                            ALUOp = 2'b00;
                            PC4toReg = 0;
                        end
                        default: begin 
                            Branch = 0;
                            MemRead = 0;
                            MemtoReg = 1'bx;
                            MemWrite = 1;
                            ALUSrc = 1;
                            RegWrite = 0;
                            ALUOp = 2'b00;
                            PC4toReg = 0;
                        end
                    endcase 
                end
        b_format: begin //beq 
                    Branch = 1;
                    MemRead = 0;
                    MemtoReg = 1'bx;
                    MemWrite = 0;
                    ALUSrc = 0;
                    RegWrite = 0;
                    ALUOp = 2'b01;
                    PC4toReg = 0;
                end
        //j_format: begin //jal
                  //  Branch = 0;
                  //  MemRead = 0;
                  //  MemtoReg = 0;
                  //  MemWrite = 0;
                  //  ALUSrc = 1'bx;
                  //  RegWrite = 1;
                  //  ALUOp = 2'bxx;
                //end 
        default:  begin 
                    Branch = 0;
                    MemRead = 0;
                    MemtoReg = 0;
                    MemWrite = 0;
                    ALUSrc = 0;
                    RegWrite = 1;
                    ALUOp = 2'b10;
                end
        endcase 
    end 
endmodule
        

        

