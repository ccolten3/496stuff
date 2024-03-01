onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk /top_tb/dut/core/clk
add wave -noupdate -label reset /top_tb/dut/core/reset
add wave -noupdate -group {program counter } -label reset_pc /top_tb/dut/core/reset_pc
add wave -noupdate -group {program counter } -label PC_in -radix binary /top_tb/dut/core/PC_in
add wave -noupdate -group {program counter } -label PC_out -radix binary /top_tb/dut/core/PC_out
add wave -noupdate -group {program counter } /top_tb/dut/core/PC/valid
add wave -noupdate -label inst_mem_req /top_tb/dut/core/inst_mem_req
add wave -noupdate -label inst_mem_rsp /top_tb/dut/core/inst_mem_rsp
add wave -noupdate -label inst_mem_req_ack /top_tb/dut/core/inst_mem_req_ack
add wave -noupdate -label data_mem_req /top_tb/dut/core/data_mem_req
add wave -noupdate -label data_mem_rsp /top_tb/dut/core/data_mem_rsp
add wave -noupdate -label data_mem_req_ack /top_tb/dut/core/data_mem_req_ack
add wave -noupdate -label {instr (hex)} -radix hexadecimal /top_tb/dut/core/instr
add wave -noupdate -label {instr (bin)} -radix binary /top_tb/dut/core/instr
add wave -noupdate -group Registers -label read_reg1 /top_tb/dut/core/registers/read_reg1
add wave -noupdate -group Registers -label read_reg2 /top_tb/dut/core/registers/read_reg2
add wave -noupdate -group Registers -label write_reg /top_tb/dut/core/registers/write_reg
add wave -noupdate -group Registers -label write_data /top_tb/dut/core/write_data
add wave -noupdate -group Registers -label read_data1 -radix hexadecimal /top_tb/dut/core/read_data1
add wave -noupdate -group Registers -label read_data2 -radix hexadecimal /top_tb/dut/core/read_data2
add wave -noupdate -group Registers -label Registers /top_tb/dut/core/registers/Registers
add wave -noupdate -label immediate_gen /top_tb/dut/core/immediate_gen
add wave -noupdate -label ALU_mux_in /top_tb/dut/core/ALU_mux_in
add wave -noupdate -label ALU_result /top_tb/dut/core/ALU_result
add wave -noupdate -label data_mem_out /top_tb/dut/core/data_mem_out
add wave -noupdate -label PC4 /top_tb/dut/core/PC4
add wave -noupdate -label PC_imm /top_tb/dut/core/PC_imm
add wave -noupdate -expand -group control -label Branch /top_tb/dut/core/Branch
add wave -noupdate -expand -group control -label MemtoReg /top_tb/dut/core/MemtoReg
add wave -noupdate -expand -group control -label ALUSrc /top_tb/dut/core/ALUSrc
add wave -noupdate -expand -group control -label RegWrite /top_tb/dut/core/RegWrite
add wave -noupdate -expand -group control -label PC4toReg /top_tb/dut/core/PC4toReg
add wave -noupdate -expand -group control -label zero /top_tb/dut/core/zero
add wave -noupdate -expand -group control -label ALUOp /top_tb/dut/core/ALUOp
add wave -noupdate -expand -group control -label MemRead /top_tb/dut/core/MemRead
add wave -noupdate -expand -group control -label MemWrite /top_tb/dut/core/MemWrite
add wave -noupdate -group ALU_controler -label ALU_control /top_tb/dut/core/AlU_cont/ALU_control
add wave -noupdate -group ALU_controler -label combined /top_tb/dut/core/AlU_cont/combined
add wave -noupdate -label opcode /top_tb/dut/core/opcode
add wave -noupdate -label format /top_tb/dut/core/format
add wave -noupdate -label func7 /top_tb/dut/core/func7
add wave -noupdate -label func3 /top_tb/dut/core/func3
add wave -noupdate -group data_mem -label size /top_tb/dut/data_mem/size
add wave -noupdate -group data_mem -label initialize_mem /top_tb/dut/data_mem/initialize_mem
add wave -noupdate -group data_mem -label byte0 -radix ascii /top_tb/dut/data_mem/byte0
add wave -noupdate -group data_mem -label byte1 -radix ascii /top_tb/dut/data_mem/byte1
add wave -noupdate -group data_mem -label byte2 -radix ascii /top_tb/dut/data_mem/byte2
add wave -noupdate -group data_mem -label byte3 -radix ascii /top_tb/dut/data_mem/byte3
add wave -noupdate -group data_mem -label enable_rsp_addr /top_tb/dut/data_mem/enable_rsp_addr
add wave -noupdate -group data_mem -label size_l2 -radix decimal /top_tb/dut/data_mem/size_l2
add wave -noupdate -group data_mem -label clk /top_tb/dut/data_mem/clk
add wave -noupdate -group data_mem -label req /top_tb/dut/data_mem/req
add wave -noupdate -group data_mem -label rsp_q /top_tb/dut/data_mem/rsp_q
add wave -noupdate -group data_mem -label data0 -radix hexadecimal /top_tb/dut/data_mem/data0
add wave -noupdate -group data_mem -label data1 -radix hexadecimal /top_tb/dut/data_mem/data1
add wave -noupdate -group data_mem -label data2 -radix hexadecimal /top_tb/dut/data_mem/data2
add wave -noupdate -group data_mem -label data3 -radix hexadecimal /top_tb/dut/data_mem/data3
add wave -noupdate -group data_mem -label opcode_mem /top_tb/dut/data_mem/opcode_mem
add wave -noupdate -group data_mem -label rsp /top_tb/dut/data_mem/rsp
add wave -noupdate -group code_mem -label byte0 -radix ascii /top_tb/dut/code_mem/byte0
add wave -noupdate -group code_mem -label byte1 -radix ascii /top_tb/dut/code_mem/byte1
add wave -noupdate -group code_mem -label byte2 -radix ascii /top_tb/dut/code_mem/byte2
add wave -noupdate -group code_mem -label {byte3 } -radix ascii /top_tb/dut/code_mem/byte3
add wave -noupdate -group code_mem -label {byte 4} /top_tb/dut/code_mem/enable_rsp_addr
add wave -noupdate -group code_mem -label size_l2 /top_tb/dut/code_mem/size_l2
add wave -noupdate -group code_mem -label clk /top_tb/dut/code_mem/clk
add wave -noupdate -group code_mem -label req /top_tb/dut/code_mem/req
add wave -noupdate -group code_mem -label rsp_q /top_tb/dut/code_mem/rsp_q
add wave -noupdate -group code_mem -label data0 -radix hexadecimal /top_tb/dut/code_mem/data0
add wave -noupdate -group code_mem -label opcode_mem -radix hexadecimal /top_tb/dut/code_mem/opcode_mem
add wave -noupdate -group code_mem -label data1 -radix hexadecimal /top_tb/dut/code_mem/data1
add wave -noupdate -group code_mem -label data2 -radix hexadecimal /top_tb/dut/code_mem/data2
add wave -noupdate -group code_mem -label data3 -radix hexadecimal /top_tb/dut/code_mem/data3
add wave -noupdate -group code_mem -label rsp -childformat {{/top_tb/dut/code_mem/rsp.data -radix hexadecimal}} -subitemconfig {/top_tb/dut/code_mem/rsp.data {-height 15 -radix hexadecimal}} /top_tb/dut/code_mem/rsp
add wave -noupdate -group code_mem -label size -radix hexadecimal /top_tb/dut/code_mem/size
add wave -noupdate -group code_mem -label initialize_mem /top_tb/dut/code_mem/initialize_mem
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {162 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 258
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {135 ps} {241 ps}
