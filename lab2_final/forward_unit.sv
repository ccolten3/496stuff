// handles data forwarding for hazard control
module forward_unit(clk, reset, rd_ex, rs1_ex, rs2_ex, rd_mem1, rd_mem2, rd_wb, 
							control_mem1, control_mem2, control_wb, forward_A, forward_B);
	input logic clk, reset;
	input logic [4:0]  rd_ex, rs1_ex, rs2_ex, rd_mem1, rd_mem2, rd_wb; 
	input logic [31:0] control_mem1, control_mem2, control_wb;
	output logic [2:0]forward_A, forward_B;
	
//								{[31:16]        15      14       13      12       11        10      [9:6]    [5:2]    [1:0]}
//	assign control_dec = {{16{1'b0}}, Branch, MemtoReg, ALUSrc, ALUSrd, RegWrite, PC4toReg, MemRead, MemWrite, ALUOp};
	
	always_comb begin 
		// if instr @ mem1 enables regwrite and rd @mem1 doesnt equal zero and the 
		// rd @ mem1 equals read data 1 of instr @ ex use ALU output @ mem1 as ALU input A
		if (control_mem1[11] & (rd_mem1 != 5'b0) & (rd_mem1==rs1_ex)) forward_A = 3'b010;
		
		// if instr @ mem2 enables regwrite and rd @ mem2 doesnt equal zero and 
		// equals the read data 1 of instr @ ex use ALU output @ mem2 as ALU input A
		else if (control_mem2[11] & (rd_mem2 != 5'b0) & (rd_mem2==rs1_ex)) forward_A = 3'b011;
		
		
		// if instr @ mem1 enables regwrite and rd @mem1 doesnt equal zero and the 
		// rd @ mem1 equals read data 2 of instr @ ex use ALU output @ mem1 as ALU input B
		else if (control_mem1[11] & (rd_mem1 != 5'b0) & (rd_mem1==rs2_ex)) forward_B = 3'b010;
		// if instr @ mem2 enables regwrite and rd @mem2 doesnt equal zero and the 
		// rd @ mem2 equals read data 2 of instr @ ex use ALU output @ mem2 as ALU input B
		else if (control_mem2[11] & (rd_mem2 != 5'b0) & (rd_mem2==rs2_ex)) forward_B = 3'b011;
		
		// if instr @ wb enables regwrite and rd @ wb doesnt equal 0 and equals rs1 @ ex use wb data as ALU input A
		else if (control_wb[11] & (rd_wb != 5'b0) & (rd_wb==rs1_ex)) forward_A = 3'b001;
		// if instr @ wb enables regwrite and rd @ wb doesnt equal 0 and equals rs2 @ ex use wb data as ALU input B
		else if (control_wb[11] & (rd_wb != 5'b0) & (rd_wb==rs2_ex)) forward_B = 3'b001;
	
		// if instr @ wb enables regwrite and rd @ wb doesnt equal 0, and not[(regwrite enabled at mem1) and (rd @ mem1 doesnt equal 0) and 
		// (rd @ mem1 = rd @ ex) 
		else if (control_wb[11] & (rd_wb != 5'b0) & !(control_mem1[11]&(rd_mem1!=5'b0)&(rd_mem1== rd_ex))&(rd_wb==rs1_ex)) forward_A = 3'b001;
		else if (control_wb[11] & (rd_wb != 5'b0) & !(control_mem1[11]&(rd_mem1!=5'b0)&(rd_mem1== rd_ex))&(rd_wb==rs2_ex)) forward_B = 3'b001;
		else begin 
			forward_A = 3'b000;
			forward_B = 3'b000;
		end
	end 
endmodule
