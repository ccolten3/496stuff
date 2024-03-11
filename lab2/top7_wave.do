onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk /top_tb/dut/core/clk
add wave -noupdate -label reset /top_tb/dut/core/reset
add wave -noupdate -label reset_pc /top_tb/dut/core/reset_pc
add wave -noupdate -label inst_mem_req -expand /top_tb/dut/core/inst_mem_req
add wave -noupdate -label inst_mem_rsp -expand /top_tb/dut/core/inst_mem_rsp
add wave -noupdate -label inst_mem_req_ack /top_tb/dut/core/inst_mem_req_ack
add wave -noupdate -label data_mem_req /top_tb/dut/core/data_mem_req
add wave -noupdate -label data_mem_rsp /top_tb/dut/core/data_mem_rsp
add wave -noupdate -label data_mem_req_ack /top_tb/dut/core/data_mem_req_ack
add wave -noupdate -label PC_in /top_tb/dut/core/PC_in
add wave -noupdate -label ALUOp /top_tb/dut/core/ALUOp
add wave -noupdate -label ALU_control /top_tb/dut/core/ALU_control
add wave -noupdate -expand -group F1 -label PC_out_f1 -radix decimal /top_tb/dut/core/PC_out_f1
add wave -noupdate -expand -group F1 -label PC4_f1 -radix hexadecimal /top_tb/dut/core/PC4_f1
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
add wave -noupdate -expand -group DEC -label resgisters -expand /top_tb/dut/core/registers/Registers
add wave -noupdate -expand -group DEC -label opcode_dec /top_tb/dut/core/opcode_dec
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
add wave -noupdate -expand -group EX -label ALU_inA /top_tb/dut/core/ALU_inA
add wave -noupdate -expand -group EX -label ALU_inB /top_tb/dut/core/ALU_inB
add wave -noupdate -expand -group EX -label ALU_ex -radix decimal /top_tb/dut/core/ALU_ex
add wave -noupdate -expand -group EX -label format_ex /top_tb/dut/core/format_ex
add wave -noupdate -expand -group EX -label func7_ex /top_tb/dut/core/func7_ex
add wave -noupdate -expand -group EX -label func3_ex /top_tb/dut/core/func3_ex
add wave -noupdate -expand -group EX -label opcode_ex /top_tb/dut/core/opcode_ex
add wave -noupdate -expand -group MEM1 -label PC4_mem1 -radix decimal /top_tb/dut/core/PC4_mem1
add wave -noupdate -expand -group MEM1 -label control_mem1 /top_tb/dut/core/control_mem1
add wave -noupdate -expand -group MEM1 -label read_data2_mem1 -radix hexadecimal /top_tb/dut/core/read_data2_mem1
add wave -noupdate -expand -group MEM1 -label write_reg_mem1 -radix decimal /top_tb/dut/core/write_reg_mem1
add wave -noupdate -expand -group MEM1 -label ALU_mem1 -radix decimal /top_tb/dut/core/ALU_mem1
add wave -noupdate -expand -group MEM1 -label format_mem1 /top_tb/dut/core/format_mem1
add wave -noupdate -expand -group MEM1 -label opcode_mem1 /top_tb/dut/core/opcode_mem1
add wave -noupdate -expand -group MEM2 -label PC4_mem2 -radix decimal /top_tb/dut/core/PC4_mem2
add wave -noupdate -expand -group MEM2 -label control_mem2 /top_tb/dut/core/control_mem2
add wave -noupdate -expand -group MEM2 -label read_data2_mem2 -radix hexadecimal /top_tb/dut/core/read_data2_mem2
add wave -noupdate -expand -group MEM2 -label write_reg_mem2 -radix decimal /top_tb/dut/core/write_reg_mem2
add wave -noupdate -expand -group MEM2 -label ALU_mem2 -radix decimal /top_tb/dut/core/ALU_mem2
add wave -noupdate -expand -group MEM2 -label data_mem2 -radix hexadecimal /top_tb/dut/core/data_mem2
add wave -noupdate -expand -group MEM2 -label format_mem2 /top_tb/dut/core/format_mem2
add wave -noupdate -expand -group MEM2 -label opcode_mem2 /top_tb/dut/core/opcode_mem2
add wave -noupdate -expand -group WB -label PC4_wb -radix decimal /top_tb/dut/core/PC4_wb
add wave -noupdate -expand -group WB -label control_wb /top_tb/dut/core/control_wb
add wave -noupdate -expand -group WB -label write_reg_wb -radix decimal /top_tb/dut/core/write_reg_wb
add wave -noupdate -expand -group WB -label ALU_wb -radix decimal /top_tb/dut/core/ALU_wb
add wave -noupdate -expand -group WB -label data_wb -radix hexadecimal /top_tb/dut/core/data_wb
add wave -noupdate -expand -group WB -label format_wb /top_tb/dut/core/format_wb
add wave -noupdate -expand -group WB -label opcode_wb /top_tb/dut/core/opcode_wb
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {420 ps} 0}
quietly wave cursor active 1
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
WaveRestoreZoom {0 ps} {1201 ps}
