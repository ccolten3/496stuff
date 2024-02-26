module registers(clk, reset, read_reg1, read_reg2, write_reg, 
						 write_data, reg_write, read_data1, read_data2);
						 
	input logic clk, reset, reg_write; // control input for writing
	input logic [4:0]  read_reg1, read_reg2, write_reg; //instruction directions
	input logic [31:0] write_data;  // data to write
	output logic [31:0] read_data1, read_data2;
	
	reg [31:0] Registers [31:0];
	
	assign read_data1 = Registers[read_reg1];
	assign read_data2 = Registers[read_reg2];
	
	alway_ff @(posedge clk) begin
		if (reset) begin 
			for (int i =0; i<32; i++)	begin 
				Registers[i] <= 32'b0;
			end 
		end 
		else if (reg_write) begin 
			Registers[write_reg] <= write_data;
		end 
	end 
endmodule 