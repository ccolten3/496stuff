module addr_adder(clk, toAdd, added);
	input logic clk;
	input logic [31:0] toAdd;
	output logic [31:0] added;

	assign added = toAdd + 4;
//	always_ff @(posedge clk) begin 
//		added <= toAdd + 32'b32;
//	end
endmodule
