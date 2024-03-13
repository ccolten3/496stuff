module hazard_unit (clk, reset, MemRead, mem_read, rd_ex, rd_mem1, rs1_dec, rs2_dec, stall, cycle_count);
	input logic clk, reset;
	input logic [4:0] rd_ex, rd_mem1, rs1_dec, rs2_dec;
	input logic [3:0] MemRead, mem_read; //[9:6]
	output logic stall;
	output logic [2:0] cycle_count;
	
	always_comb begin 
		if (reset) stall = 1'b0;
		else if ((MemRead!=0) & ((rd_ex==rs1_dec)|(rd_ex==rs2_dec))|| (mem_read!=0) & ((rd_mem1==rs1_dec)|(rd_mem1==rs2_dec))) begin 
			stall =1'b1;
		end else if (cycle_count == 2)
			stall = 1'b0;
			
	end
	
	always @(posedge clk) begin 
		if (cycle_count == 2) cycle_count<=3'b0;
		else if (stall) cycle_count <= cycle_count + 1;
		else cycle_count <= 3'b0;
	end
endmodule 