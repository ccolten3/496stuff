module program_counter(clk, reset, PC_in, PC_out);
	input logic clk, reset;
	input logic [31:0] PC_in;
	output logic [31:0] PC_out;
	
	always @(posedge clk) begin 
		if(reset)
			PC_out <= 32'h00000000;
		else 
			PC_out <= PC_in
	end
endmodule 