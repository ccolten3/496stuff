// this module serves as the program counter which allows the input 
// instruction address to be clocks
module program_counter(clk, reset, reset_pc, PC_in, PC_out, valid);
	input logic clk, reset;
	input logic [31:0] PC_in, reset_pc;
	output logic [31:0] PC_out;
	output logic valid;
	
	// at the clockedge set output to input
	always @(posedge clk) begin
		// if reset set instruction address to specific reset value
		if(reset) begin
			PC_out <= reset_pc;
			valid <= 1'b1;
		end else 
			PC_out <= PC_in;
	end
endmodule 