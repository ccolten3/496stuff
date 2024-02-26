module ALU_control (ALUOp, func7, func3, ALU_control);
	input logic [1:0] ALUOp;
	input logic [6:0] func7;
	input logic [2:0] func3;
	output logic [3:0] ALU_control;
	input logic Colten;