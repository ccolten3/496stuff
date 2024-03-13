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

  The basic layout of our design can be seen above which demostrates the basic layout of our processor with a few exceptions.
### Differences from Von Heumann Model
  The one difference between our design and the Von Heumann design, besides the extra instruction and data memory stages, is that istead of determining 
  branch logic with the ALU's 'zero' output, our code simply uses combinational logic based on the inputs of the ALU.
## Quartus and Modelsim
  We used Quartus as our SystemVerilog tool. Top.sv is declared as our top entity and from there once there are no compiler errors we went to Modelsim. To verify our instruction set we ran a run.do file that instantiated our wave forms and cpu. From there we could look at each instruction as it is loaded and follow every changing signal in our cpu, such as register and data memory values. This allows us to see in detail if and where our instructions glitch and follow the datapath. We included the run.do file and also the hex files with the instructions and memory we preloaded.
## Homework 1
  We were successfully able to get homework 1 to run on our processor. After writing the data and code hex files by hand based on or implimentation from the assignment we were able to replicate the functionality of our string copy method. Waveforms of this implimentation can be seen below
![image](https://github.com/ccolten3/496stuff/assets/156143216/54c8b1cd-4e1c-4abc-958f-60ae159ad328)
  The image above shows the data in data memory before string copy. As you can see the data holds the strings "hello" (source) and "world" (destination).
![image](https://github.com/ccolten3/496stuff/assets/156143216/b6742061-e352-4d72-9bf4-ea04172410b8)
  The image above shows the data in data memory after the observed three cycles of the function. Seen below are the values of the control signals during this process. 
## Homework 2
  Unfortunately we were unable to get homework 2 completely working in time however we did get it pretty close. the only issue that we are really having is requarding jumps and branches and for some reason the loop never ending. seen below is just a snippet from our simulation demostrating the systems behavior when executing a jalr istruction. 
  ![image](https://github.com/ccolten3/496stuff/assets/156143216/48e4ac1b-2364-4c68-869c-9311a6b00209)
## Usage 
  Some of the more complicated design features of our pipeline can be seen below.
### Hazard Detection and Stalling 
![image](https://github.com/ccolten3/496stuff/assets/156143216/9ccf3e6f-fc4d-4459-b875-17b5a245f14b)
  The image above demonstrated that our code will actually recognize a hazard and impliment as stall based on certan conditions. As seen above when memRead is active for the instruction in the execution stage or mem1 stage, and the write address in either of those stages is equal to rs1 or rs2 in the decode stage, a hazard is signaled and the system is stalled. As you can see the instruction accross both stages is stopped until the hazard is resolved.
### Flushing
![image](https://github.com/ccolten3/496stuff/assets/156143216/a5ef9640-7a3f-4c4c-92ca-1323478b03c4)
  Our design also impliments a flushing technique where by when the program is stalled all controls are set to zero so as to not effect the state of the system while stalling occurs. once the hazard is resolved the control signals are resumed. This can be seen in the image above after the hazard detection in the previous section. 
  Flushing is also used when jumping or branching as seen below. When an instruction address is changed it will take a few clock cycles for the decode stage to receive the new instruction and until then only null instructions are loaded into decode with all controls set to zero so as to have no effect on the system.
![image](https://github.com/ccolten3/496stuff/assets/156143216/248d914e-edf2-4b07-9343-0bb9a94fd85d)
### Forwarding
![image](https://github.com/ccolten3/496stuff/assets/156143216/71a0fbfd-cb87-4067-be81-ad499bcfecea)
  The image above demostrates our forwarding select and behavior. 'forward_b' when set to 010 enables forwarding between the execution stage mem1 stage and as you can see the ALU input of B is then set to the ALU output value of the instruction the the mem1 stage. Likewise when set to 011 forwarding is enabled between execution and mem2 stage. This too is reflected in the ALU input B.  
## Support 
  We were supported by the memory and riscv starter files given to us by the teaching team. With some editing the contriputed to our processors completion. We also used Chat GPT and general search as a tool for explanations of concepts and things like verilog syntax.
## Authors
Colten Crosby, Alex Ovchinnikov.

  
