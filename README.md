# Lab1 496: Single Cycle Riscv Processor
## Description
  This project focused and the design and implimentation of a single cycle riscv processor based on the Von Neumann architecture. Designed in system verilog using Quartus and intended for testing in Modelsim the components of this processor are separated in various modules and files each representing a component of Von Neumanns architecture. The various files include:
* top.sv
* memory.sv
* memory_io.sv
* risc32_starter.sv
* program_counter.sv 
* registers.sv
* control.sv
* ALU.sv and ALU_control.sv
* core32.sv
* muxes.sv and addr_adder.sv
  The files in the project are split between three modules in top.sv: core32.sv and two declarations of the memory module given in this assignment that serve as data and instruction memory.
##  Von Neumann Model
![image](https://github.com/ccolten3/496stuff/assets/156143216/92191829-24ae-43d1-81ac-38ae0446c3c4)
  The basic layout of our design can be seen above which demostrates the basic layout of our processor with a few exceptions.
### Differences from Von Heumann Model
  The one difference between our design and the Von Heumann design is that instead of using an adder to add the immediate to the program counter, we muxed the read data1 output of the register and developed a control signal to determine whether to input the program counter or read data1 to the ALU where they could be added together. 
## Homework 1
  We were successfully able to get homework 1 to run on our processor. After writing the data and code hex files based on or implimentation from the assignment we were able to replicate the functionality of our string copy method. Waveforms of this implimentation can be seen below
![image](https://github.com/ccolten3/496stuff/assets/156143216/6293ba66-59e9-4da1-945a-2b4181ab97b4)
  The image above shows the data in data memory before string copy.
![image](https://github.com/ccolten3/496stuff/assets/156143216/6e0f4dd8-bd31-47e5-9e4a-2391a712afba)
  The image above shows the data in data memory after the observed three cycles of the function. Seen below are the values of the control signals during this process. As you can see there are clear signals indicative of load byte and store byte as well as jumps and branches.
![image](https://github.com/ccolten3/496stuff/assets/156143216/a6f7880b-180c-49d6-a5a7-fa47f8d09caf)
## Homework 2
  Unfortunately we were unable to get homework 2 working in time however this is not an matter of inclomplete or faulty instruction encoding. We simply ran out of time to write out all the hex and data files by hand before the deadline. Since we will be demoing tomorrow we expect that getting homework 2 working will just be a matter of writing the correct hex code and running it through our processor. 
## Usage 
  Some of the more complicated instructions such as JAL and branching instructiosn are seen below.
### JAL
![image](https://github.com/ccolten3/496stuff/assets/156143216/e327f692-3c87-4e88-8b61-50d3989a2dca)
  The image above demonstrated that our JAL instruction encode is correct the actual instruction for this is was jal x1, -20. as you can see the PC output at the next clock cycle was moved back 20 bytes or 5 instruction and the loop repeats itself we cal also see that it is writting what whould have been the next instruction address, but is now the return address into register 1.
### BEQ
![image](https://github.com/ccolten3/496stuff/assets/156143216/1ff298ae-c4db-4cb4-858b-a699ca95987e)
  Similiarly with BEQ we can see that when BEQ is called and passes branch is asserted which assigned the the current instruction address plus the immediate to the input of the program counter. unlike JAL however the return adress is not saved as branching does not require a return address.
## Support 
  We were supported by the memory and riscv starter files given to us by the teaching team. With some editing the contriputed to our processors completion.
## Authors
Colten Crosby, Alex Ovchinnikov.

  

