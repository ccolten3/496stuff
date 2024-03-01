module program_counter(clk, reset, reset_pc, PC_in, PC_out, valid);
	input logic clk, reset;
	input logic [31:0] PC_in, reset_pc;
	output logic [31:0] PC_out;
	output logic valid;
	
	always @(posedge clk) begin 
		if(reset) begin
			PC_out <= reset_pc;
			valid <= 1'b1;
		end else 
			PC_out <= PC_in;
	end
endmodule 