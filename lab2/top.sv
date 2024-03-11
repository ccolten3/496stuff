
`include "memory_io.sv"
`include "riscv32_starter.sv"

// this module serves as the top level complie location for the entire single cycle processor
module top(input clk, input reset, output logic halt);

memory_io_req 	inst_mem_req;
memory_io_rsp 	inst_mem_rsp;
memory_io_req 	data_mem_req;
memory_io_rsp 	data_mem_rsp;

localparam logic false = 0;
localparam logic true = 1;


core32_7stage core(
	.clk(clk)
	,.reset(reset)
	,.reset_pc(32'h0001_0000)
	,.inst_mem_req(inst_mem_req)
	,.inst_mem_rsp(inst_mem_rsp)
	,.inst_mem_req_ack(inst_mem_req.valid)

	,.data_mem_req(data_mem_req)
	,.data_mem_rsp(data_mem_rsp)
	,.data_mem_req_ack(data_mem_req.valid)
    );

memory #(
    .size(32'h0001_0000)
    ,.initialize_mem(true)
    ,.byte0("code0.hex")
    ,.byte1("code1.hex")
    ,.byte2("code2.hex")
    ,.byte3("code3.hex")
    ) code_mem (
    .clk(clk)
    ,.req(inst_mem_req)
    ,.rsp_q(inst_mem_rsp)
    );

memory #(
    .size(32'h0001_0000)
    ,.initialize_mem(true)
    ,.byte0("data0.hex")
    ,.byte1("data1.hex")
    ,.byte2("data2.hex")
    ,.byte3("data3.hex")
    ) data_mem (
    .clk(clk)
    ,.req(data_mem_req)
    ,.rsp_q(data_mem_rsp)
    );

always_ff @(posedge clk)
	if (data_mem_req.valid && data_mem_req.addr == 32'h0002_FFF8 && data_mem_req.do_write == 4'b1111) begin
		//$display("yay!");
		$write("%c", data_mem_req.data[7:0]);
	end

always_ff @(posedge clk)
	if (data_mem_req.valid && data_mem_req.addr == 32'h0002_FFFC && data_mem_req.do_write == 4'b1111)
		halt <= true;
	else
		halt <= false;

endmodule


// this simple testbench that runs the top module
module top_tb();
	logic clk, reset;
	logic hault;
	
	top dut(clk, reset, hault);
	
	parameter CLOCK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk; // Forever toggle the clock
	end
	// Set up the inputs to the design. Each line is a clock cycle.
	initial begin
		reset <= 1; @(posedge clk);
		reset <= 0;	repeat(50) @(posedge clk);
		repeat(50)	@(posedge clk);
		
		$stop; // End the simulation.
	end
endmodule
		
	
			
			
