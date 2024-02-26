core32(
	input logic clk,
	input logic reset,
	input logic reset_pc,
	input logic inst_mem_req,
	input logic inst_mem_rsp,
	input logic inst_mem_req_ack,

	output logic data_mem_req,
	output logic data_mem_rsp,
	output logic data_mem_req_ack
    );
endmodule

	
module adder32 (
	input logic [31:0] A, 
	input logic [31:0] B,
	input logic Cin,
	output logic [31:0] S,
	output logic Cout,
	);

	assign {Cout, s} = A + B + Cin;
endmodule

module mux #(
	parameter WIDTH = 32
	) (
	input  logic [WIDTH-1:0] d0, d1, 
	input  logic             s, 
	output logic [WIDTH-1:0] y
	);

	assign y = s ? d1 : d0; 
endmodule

