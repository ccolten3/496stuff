# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./memory_io.sv"
vlog "./memory.sv"
vlog "./riscv32_starter.sv"
vlog "./addr_adder.sv"
vlog "./program_counter.sv"
vlog "./registers.sv"
vlog "./top.sv"
vlog "./ALU.sv"
vlog "./control.sv"
vlog "./core32.sv"
vlog "./muxes.sv"
#vlog "./code0.hex"
#vlog "./code1.hex"
#vlog "./code2.hex"
#vlog "./code3.hex"
#vlog "./data0.hex"
#vlog "./data1.hex"
#vlog "./data2.hex"
#vlog "./data3.hex"
vlog "./ALU_ctrl.sv"
vlog "./adder.sv"



# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work top_tb

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do top_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
