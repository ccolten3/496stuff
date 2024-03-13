///////////////////////////////////////////////////////
// this module increments the instruction address by 4 through addition
module addr_adder(clk, toAdd, added);
	input logic clk;
	input logic [31:0] toAdd;
	output logic [31:0] added;
	
	// add four to the input
	assign added = toAdd + 4;
endmodule
