module hazard_unit (clk, reset, MemRead, rd_ex, rs1_dec, rs2_dec, stall);
	input logic clk, reset;
	input logic [4:0] rd_ex, rs1_dec, rs2_dec;
	input logic [3:0] MemRead;
	output logic stall;
	
	assign stall = (MemRead & ((rd_ex==rs1_dec)|(rd_ex==rs2_dec))) ? 1'b1: 1'b0;
endmodule 