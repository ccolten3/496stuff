onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk /top_tb/dut/core/clk
add wave -noupdate -label reset /top_tb/dut/core/reset
add wave -noupdate -label reset_pc /top_tb/dut/core/reset_pc
add wave -noupdate -label inst_mem_req /top_tb/dut/core/inst_mem_req
add wave -noupdate -label inst_mem_rsp /top_tb/dut/core/inst_mem_rsp
add wave -noupdate -label inst_mem_req_ack /top_tb/dut/core/inst_mem_req_ack
add wave -noupdate -label data_mem_req /top_tb/dut/core/data_mem_req
add wave -noupdate -label data_mem_rsp /top_tb/dut/core/data_mem_rsp
add wave -noupdate -label data_mem_req_ack /top_tb/dut/core/data_mem_req_ack
add wave -noupdate -label PC_in -radix unsigned /top_tb/dut/core/PC_in
add wave -noupdate -label ALUOp /top_tb/dut/core/ALUOp
add wave -noupdate -expand -group code_mem -label size /top_tb/dut/code_mem/size
add wave -noupdate -expand -group code_mem -label initialize_mem /top_tb/dut/code_mem/initialize_mem
add wave -noupdate -expand -group code_mem -label byte0 -radix hexadecimal /top_tb/dut/code_mem/byte0
add wave -noupdate -expand -group code_mem -label byte1 -radix hexadecimal /top_tb/dut/code_mem/byte1
add wave -noupdate -expand -group code_mem -label byte2 -radix hexadecimal /top_tb/dut/code_mem/byte2
add wave -noupdate -expand -group code_mem -label byte3 -radix hexadecimal /top_tb/dut/code_mem/byte3
add wave -noupdate -expand -group code_mem -label enable_rsp_addr /top_tb/dut/code_mem/enable_rsp_addr
add wave -noupdate -expand -group code_mem -label size_l2 /top_tb/dut/code_mem/size_l2
add wave -noupdate -expand -group code_mem -label clk /top_tb/dut/code_mem/clk
add wave -noupdate -expand -group code_mem -label req -expand /top_tb/dut/code_mem/req
add wave -noupdate -expand -group code_mem -label rsp_q -childformat {{/top_tb/dut/code_mem/rsp_q.data -radix hexadecimal}} -expand -subitemconfig {/top_tb/dut/code_mem/rsp_q.data {-height 15 -radix hexadecimal}} /top_tb/dut/code_mem/rsp_q
add wave -noupdate -expand -group code_mem -label data0 -radix hexadecimal /top_tb/dut/code_mem/data0
add wave -noupdate -expand -group code_mem -label data1 -radix hexadecimal /top_tb/dut/code_mem/data1
add wave -noupdate -expand -group code_mem -label data2 -radix hexadecimal /top_tb/dut/code_mem/data2
add wave -noupdate -expand -group code_mem -label data3 -radix hexadecimal /top_tb/dut/code_mem/data3
add wave -noupdate -expand -group code_mem -label rsp /top_tb/dut/code_mem/rsp
add wave -noupdate -expand -group data_mem -label size /top_tb/dut/data_mem/size
add wave -noupdate -expand -group data_mem -label initialize_mem /top_tb/dut/data_mem/initialize_mem
add wave -noupdate -expand -group data_mem -label byte0 -radix hexadecimal /top_tb/dut/data_mem/byte0
add wave -noupdate -expand -group data_mem -label byte1 -radix hexadecimal /top_tb/dut/data_mem/byte1
add wave -noupdate -expand -group data_mem -label byte2 -radix hexadecimal /top_tb/dut/data_mem/byte2
add wave -noupdate -expand -group data_mem -label byte3 -radix hexadecimal /top_tb/dut/data_mem/byte3
add wave -noupdate -expand -group data_mem -label enable_rsp_addr /top_tb/dut/data_mem/enable_rsp_addr
add wave -noupdate -expand -group data_mem -label size_l2 /top_tb/dut/data_mem/size_l2
add wave -noupdate -expand -group data_mem -label clk /top_tb/dut/data_mem/clk
add wave -noupdate -expand -group data_mem -label req -expand /top_tb/dut/data_mem/req
add wave -noupdate -expand -group data_mem -label rsp_q /top_tb/dut/data_mem/rsp_q
add wave -noupdate -expand -group data_mem -label data0 -radix ascii /top_tb/dut/data_mem/data0
add wave -noupdate -expand -group data_mem -label data1 -radix ascii /top_tb/dut/data_mem/data1
add wave -noupdate -expand -group data_mem -label data2 -radix ascii /top_tb/dut/data_mem/data2
add wave -noupdate -expand -group data_mem -label data3 -radix ascii /top_tb/dut/data_mem/data3
add wave -noupdate -expand -group data_mem -label rsp /top_tb/dut/data_mem/rsp
add wave -noupdate -expand -group F1 -label PC_in -radix unsigned /top_tb/dut/core/PC_in
add wave -noupdate -expand -group F1 -label PC_out_f1 -radix decimal /top_tb/dut/core/PC_out_f1
add wave -noupdate -expand -group F1 -label PC4_f1 -radix decimal /top_tb/dut/core/PC4_f1
add wave -noupdate -expand -group F2 -label PC_out_f2 -radix decimal /top_tb/dut/core/PC_out_f2
add wave -noupdate -expand -group F2 -label PC4_f2 -radix decimal /top_tb/dut/core/PC4_f2
add wave -noupdate -expand -group F2 -label format_f2 /top_tb/dut/core/format_f2
add wave -noupdate -expand -group DEC -label PC_out_dec -radix decimal /top_tb/dut/core/PC_out_dec
add wave -noupdate -expand -group DEC -label PC4_dec -radix decimal /top_tb/dut/core/PC4_dec
add wave -noupdate -expand -group DEC -label instr_dec -radix hexadecimal /top_tb/dut/core/instr_dec
add wave -noupdate -expand -group DEC -label control_dec /top_tb/dut/core/control_dec
add wave -noupdate -expand -group DEC -label read_data1_dec -radix hexadecimal /top_tb/dut/core/read_data1_dec
add wave -noupdate -expand -group DEC -label read_data2_dec -radix hexadecimal /top_tb/dut/core/read_data2_dec
add wave -noupdate -expand -group DEC -label imm_dec -radix decimal /top_tb/dut/core/imm_dec
add wave -noupdate -expand -group DEC -label write_reg_dec -radix decimal /top_tb/dut/core/write_reg_dec
add wave -noupdate -expand -group DEC -label format_dec /top_tb/dut/core/format_dec
add wave -noupdate -expand -group DEC -label func7_dec /top_tb/dut/core/func7_dec
add wave -noupdate -expand -group DEC -label func3_dec /top_tb/dut/core/func3_dec
add wave -noupdate -expand -group DEC -label resgisters -childformat {{{/top_tb/dut/core/registers/Registers[31]} -radix decimal} {{/top_tb/dut/core/registers/Registers[30]} -radix decimal} {{/top_tb/dut/core/registers/Registers[29]} -radix decimal} {{/top_tb/dut/core/registers/Registers[28]} -radix decimal} {{/top_tb/dut/core/registers/Registers[27]} -radix decimal} {{/top_tb/dut/core/registers/Registers[26]} -radix decimal} {{/top_tb/dut/core/registers/Registers[25]} -radix decimal} {{/top_tb/dut/core/registers/Registers[24]} -radix decimal} {{/top_tb/dut/core/registers/Registers[23]} -radix decimal} {{/top_tb/dut/core/registers/Registers[22]} -radix decimal} {{/top_tb/dut/core/registers/Registers[21]} -radix decimal} {{/top_tb/dut/core/registers/Registers[20]} -radix decimal} {{/top_tb/dut/core/registers/Registers[19]} -radix decimal} {{/top_tb/dut/core/registers/Registers[18]} -radix decimal} {{/top_tb/dut/core/registers/Registers[17]} -radix decimal} {{/top_tb/dut/core/registers/Registers[16]} -radix decimal} {{/top_tb/dut/core/registers/Registers[15]} -radix decimal} {{/top_tb/dut/core/registers/Registers[14]} -radix decimal} {{/top_tb/dut/core/registers/Registers[13]} -radix decimal} {{/top_tb/dut/core/registers/Registers[12]} -radix decimal} {{/top_tb/dut/core/registers/Registers[11]} -radix decimal} {{/top_tb/dut/core/registers/Registers[10]} -radix decimal} {{/top_tb/dut/core/registers/Registers[9]} -radix decimal} {{/top_tb/dut/core/registers/Registers[8]} -radix decimal} {{/top_tb/dut/core/registers/Registers[7]} -radix decimal} {{/top_tb/dut/core/registers/Registers[6]} -radix decimal} {{/top_tb/dut/core/registers/Registers[5]} -radix decimal} {{/top_tb/dut/core/registers/Registers[4]} -radix decimal} {{/top_tb/dut/core/registers/Registers[3]} -radix decimal} {{/top_tb/dut/core/registers/Registers[2]} -radix decimal} {{/top_tb/dut/core/registers/Registers[1]} -radix decimal} {{/top_tb/dut/core/registers/Registers[0]} -radix decimal}} -expand -subitemconfig {{/top_tb/dut/core/registers/Registers[31]} {-height 15 -radix decimal} {/top_tb/dut/core/registers/Registers[30]} {-height 15 -radix decimal} {/top_tb/dut/core/registers/Registers[29]} {-height 15 -radix decimal} {/top_tb/dut/core/registers/Registers[28]} {-height 15 -radix decimal} {/top_tb/dut/core/registers/Registers[27]} {-height 15 -radix decimal} {/top_tb/dut/core/registers/Registers[26]} {-height 15 -radix decimal} {/top_tb/dut/core/registers/Registers[25]} {-height 15 -radix decimal} {/top_tb/dut/core/registers/Registers[24]} {-height 15 -radix decimal} {/top_tb/dut/core/registers/Registers[23]} {-height 15 -radix decimal} {/top_tb/dut/core/registers/Registers[22]} {-height 15 -radix decimal} {/top_tb/dut/core/registers/Registers[21]} {-height 15 -radix decimal} {/top_tb/dut/core/registers/Registers[20]} {-height 15 -radix decimal} {/top_tb/dut/core/registers/Registers[19]} {-height 15 -radix decimal} {/top_tb/dut/core/registers/Registers[18]} {-height 15 -radix decimal} {/top_tb/dut/core/registers/Registers[17]} {-height 15 -radix decimal} {/top_tb/dut/core/registers/Registers[16]} {-height 15 -radix decimal} {/top_tb/dut/core/registers/Registers[15]} {-height 15 -radix decimal} {/top_tb/dut/core/registers/Registers[14]} {-height 15 -radix decimal} {/top_tb/dut/core/registers/Registers[13]} {-height 15 -radix decimal} {/top_tb/dut/core/registers/Registers[12]} {-height 15 -radix decimal} {/top_tb/dut/core/registers/Registers[11]} {-height 15 -radix decimal} {/top_tb/dut/core/registers/Registers[10]} {-height 15 -radix decimal} {/top_tb/dut/core/registers/Registers[9]} {-height 15 -radix decimal} {/top_tb/dut/core/registers/Registers[8]} {-height 15 -radix decimal} {/top_tb/dut/core/registers/Registers[7]} {-height 15 -radix decimal} {/top_tb/dut/core/registers/Registers[6]} {-height 15 -radix decimal} {/top_tb/dut/core/registers/Registers[5]} {-height 15 -radix decimal} {/top_tb/dut/core/registers/Registers[4]} {-height 15 -radix decimal} {/top_tb/dut/core/registers/Registers[3]} {-height 15 -radix decimal} {/top_tb/dut/core/registers/Registers[2]} {-height 15 -radix decimal} {/top_tb/dut/core/registers/Registers[1]} {-height 15 -radix decimal} {/top_tb/dut/core/registers/Registers[0]} {-height 15 -radix decimal}} /top_tb/dut/core/registers/Registers
add wave -noupdate -expand -group DEC -label opcode_dec /top_tb/dut/core/opcode_dec
add wave -noupdate -expand -group DEC -label rd_dec -radix decimal /top_tb/dut/core/rd_dec
add wave -noupdate -expand -group DEC -label rs2_dec -radix unsigned /top_tb/dut/core/rs2_dec
add wave -noupdate -expand -group DEC -label rs1_dec -radix unsigned /top_tb/dut/core/rs1_dec
add wave -noupdate -expand -group DEC -label stall /top_tb/dut/core/hazard_unit/stall
add wave -noupdate -expand -group EX -label PC_out_ex -radix decimal /top_tb/dut/core/PC_out_ex
add wave -noupdate -expand -group EX -label PC4_ex -radix decimal /top_tb/dut/core/PC4_ex
add wave -noupdate -expand -group EX -label instr_ex -radix hexadecimal /top_tb/dut/core/instr_ex
add wave -noupdate -expand -group EX -label control_ex /top_tb/dut/core/control_ex
add wave -noupdate -expand -group EX -label read_data1_ex -radix hexadecimal /top_tb/dut/core/read_data1_ex
add wave -noupdate -expand -group EX -label read_data2_ex -radix hexadecimal /top_tb/dut/core/read_data2_ex
add wave -noupdate -expand -group EX -label imm_ex -radix decimal /top_tb/dut/core/imm_ex
add wave -noupdate -expand -group EX -label write_reg_ex -radix decimal /top_tb/dut/core/write_reg_ex
add wave -noupdate -expand -group EX -label forward_A /top_tb/dut/core/forward_A
add wave -noupdate -expand -group EX -label forward_B /top_tb/dut/core/forward_B
add wave -noupdate -expand -group EX -label ALU_inA -radix decimal /top_tb/dut/core/ALU_inA
add wave -noupdate -expand -group EX -label ALU_inB -radix decimal /top_tb/dut/core/ALU_inB
add wave -noupdate -expand -group EX -label ALU_ex -radix hexadecimal /top_tb/dut/core/ALU_ex
add wave -noupdate -expand -group EX -label mux_inB -radix hexadecimal /top_tb/dut/core/mux_inB
add wave -noupdate -expand -group EX -label format_ex /top_tb/dut/core/format_ex
add wave -noupdate -expand -group EX -label func7_ex /top_tb/dut/core/func7_ex
add wave -noupdate -expand -group EX -label func3_ex /top_tb/dut/core/func3_ex
add wave -noupdate -expand -group EX -label opcode_ex /top_tb/dut/core/opcode_ex
add wave -noupdate -expand -group EX -label rd_ex -radix unsigned /top_tb/dut/core/rd_ex
add wave -noupdate -expand -group EX -label rs1_ex -radix decimal /top_tb/dut/core/rs1_ex
add wave -noupdate -expand -group EX -label rs2_ex -radix decimal /top_tb/dut/core/rs2_ex
add wave -noupdate -expand -group EX -label ALU_control /top_tb/dut/core/ALU_control
add wave -noupdate -expand -group EX -label branch_ex /top_tb/dut/core/branch_ex
add wave -noupdate -label branch_addr_ex -radix unsigned /top_tb/dut/core/branch_addr_ex
add wave -noupdate -label stall /top_tb/dut/core/hazard_unit/stall
add wave -noupdate -expand -group MEM1 -label PC4_mem1 -radix decimal /top_tb/dut/core/PC4_mem1
add wave -noupdate -expand -group MEM1 -label control_mem1 /top_tb/dut/core/control_mem1
add wave -noupdate -expand -group MEM1 -label write_data_mem1 -radix hexadecimal /top_tb/dut/core/write_data_mem1
add wave -noupdate -expand -group MEM1 -label write_reg_mem1 -radix decimal /top_tb/dut/core/write_reg_mem1
add wave -noupdate -expand -group MEM1 -label ALU_mem1 -radix decimal /top_tb/dut/core/ALU_mem1
add wave -noupdate -expand -group MEM1 -label format_mem1 /top_tb/dut/core/format_mem1
add wave -noupdate -expand -group MEM1 -label opcode_mem1 /top_tb/dut/core/opcode_mem1
add wave -noupdate -expand -group MEM1 -label instr_mem1 -radix hexadecimal /top_tb/dut/core/instr_mem1
add wave -noupdate -expand -group MEM1 -label rd_mem1 -radix decimal /top_tb/dut/core/rd_mem1
add wave -noupdate -expand -group MEM1 -label branch_addr_mem1 -radix unsigned /top_tb/dut/core/branch_addr_mem1
add wave -noupdate -expand -group MEM1 -label A -radix unsigned /top_tb/dut/core/pcmux/A
add wave -noupdate -expand -group MEM1 -label B -radix unsigned /top_tb/dut/core/pcmux/B
add wave -noupdate -expand -group MEM1 -label {jump/branch enable} /top_tb/dut/core/pcmux/sel
add wave -noupdate -expand -group MEM1 -label out -radix unsigned /top_tb/dut/core/pcmux/out
add wave -noupdate -expand -group MEM2 -label PC4_mem2 -radix decimal /top_tb/dut/core/PC4_mem2
add wave -noupdate -expand -group MEM2 -label control_mem2 /top_tb/dut/core/control_mem2
add wave -noupdate -expand -group MEM2 -label read_data2_mem2 -radix hexadecimal /top_tb/dut/core/read_data2_mem2
add wave -noupdate -expand -group MEM2 -label write_reg_mem2 -radix decimal /top_tb/dut/core/write_reg_mem2
add wave -noupdate -expand -group MEM2 -label ALU_mem2 -radix decimal /top_tb/dut/core/ALU_mem2
add wave -noupdate -expand -group MEM2 -label data_mem2 -radix hexadecimal /top_tb/dut/core/data_mem2
add wave -noupdate -expand -group MEM2 -label format_mem2 /top_tb/dut/core/format_mem2
add wave -noupdate -expand -group MEM2 -label opcode_mem2 /top_tb/dut/core/opcode_mem2
add wave -noupdate -expand -group MEM2 -label instr_mem2 -radix hexadecimal /top_tb/dut/core/instr_mem2
add wave -noupdate -expand -group MEM2 -label rd_mem2 -radix decimal /top_tb/dut/core/rd_mem2
add wave -noupdate -expand -group WB -label PC4_wb -radix decimal /top_tb/dut/core/PC4_wb
add wave -noupdate -expand -group WB -label control_wb /top_tb/dut/core/control_wb
add wave -noupdate -expand -group WB -label write_reg_wb -radix decimal /top_tb/dut/core/write_reg_wb
add wave -noupdate -expand -group WB -label ALU_wb -radix decimal /top_tb/dut/core/ALU_wb
add wave -noupdate -expand -group WB -label data_wb -radix hexadecimal /top_tb/dut/core/data_wb
add wave -noupdate -expand -group WB -label format_wb /top_tb/dut/core/format_wb
add wave -noupdate -expand -group WB -label opcode_wb /top_tb/dut/core/opcode_wb
add wave -noupdate -expand -group WB -label instr_wb -radix hexadecimal /top_tb/dut/core/instr_wb
add wave -noupdate -expand -group WB -label rd_wb -radix decimal /top_tb/dut/core/rd_wb
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {9853 ps} 0} {{Cursor 2} {3885 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 150
configure wave -valuecolwidth 239
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
WaveRestoreZoom {3615 ps} {4816 ps}
bookmark add wave bookmark0 {{0 ps} {1201 ps}} 76
