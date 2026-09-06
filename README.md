# RTL Design And Synthesis Workshop

This repository documents my learning journey and hands-on experiments completed during the RTL Design Workshop. It contains module-wise documentation, practical exercises, simulation results, waveform analysis, and Verilog RTL design implementations.


## Repository Contents

### Module-0 – Workshop Introduction

**Topics Covered:**

- Introduction and Cloud Lab Instructions
- Local Lab Installation

➡️**Documentation:** [Module 0 README](./Module%200/README.md)


## Module-1 –  Introduction to Verilog RTL design and Synthesis

**Topics Covered:**

- Workshop Overview
- Digital Design & RTL Design Flow
- Verilog Design and Testbench
- Icarus Verilog & GTKWave
- 2:1 Multiplexer Design
- Yosys, Gate Libraries & RTL Synthesis
- Technology Mapping & Gate-Level Netlist
- Practical Exercise, Results & Conclusion

➡️ **Documentation:** [Module 1 README](./Module%201/README.md)


## Module-2.1 –  Timing libs, hierarchical vs flat synthesis and efficient flop coding styles

**Topics Covered:**

- RTL Design Concepts
- Verilog RTL Coding
- Multiple Module Design
- Hierarchical Design
- RTL Simulation and Verification
- Yosys Synthesis
- Gate-Level Netlist
- Technology Mapping

➡️ **Documentation:** [Module 2.1 README](./Module%202.1/README.md)


## Module-2.2 

**Topics Covered:**

- Asynchronous Reset D Flip-Flop
- Asynchronous Set D Flip-Flop
- Synchronous Reset D Flip-Flop
- Flip-Flop Simulation & Synthesis
- SKY130 Technology Mapping
- Interesting Optimization – Part 1

➡️ **Documentation:** [Module 2.2 README](./Module%202.2/README.md)


## Module-3 – Combinational and sequential optmizations

**Topics Covered:**

- Constant Propagation
- State Optimization
- Cloning
- Retiming
- Optimization Labs

➡️ **Documentation:** [Module 3 README](./Module%203/README.md)



## Module-4 – GLS,blocking vs non-blocking and Synthesis Simulation mismatch

**Topics Covered:**

- Gate-Level Simulation (GLS)
- Synthesis-Simulation Mismatch
- Blocking vs. Non-Blocking Assignments
- Ternary Operator MUX
- Yosys Synthesis
- Gate-Level Simulation of MUX
- Common RTL Coding Pitfalls
- Blocking Assignment Caveat
- Synthesis of Corrected RTL

➡️ **Documentation:** [Module 4 README](./Module%204/README.md)



## Module-5 – Optimization in synthesis

**Topics Covered:**

- If-Else Statements
- Nested If-Else
- Inferred Latches
- Case Statements
- Incomplete/Partial Case Handling
- For Loops
- Generate Blocks
- Ripple Carry Adder (RCA)
- 4-to-1 MUX using For Loop
- 8-to-1 Demux using Case & For Loop
- 8-bit RCA using Generate Block
- Synthesis Optimization


➡️ **Documentation:** [Module 5 README](./Module%205/README.md)

---

# Mid Term Submission

## Session 1:
 **Topics Covered:**

- RISC-V Development Environment Setup using GitHub Codespaces
- Compiling a RISC-V C Program
- Viewing Assembly Code using `objdump`
- Running Programs using Spike Simulator
- RTL Simulation using Icarus Verilog
- Waveform Analysis using GTKWave
- Introduction to OpenROAD RTL-to-GDS Flow
- Exploring OpenROAD Repository Structure and Configuration

 ➡️ **Documentation:** [Session 1 README](./Session%201/README.md)

## Session 2:
**Topics Covered:** 

- Introduction to Yosys synthesis flow
- RTL simulation using Icarus Verilog
- Waveform analysis using GTKWave
- Good MUX and Bad MUX design comparison
- Writing Verilog testbenches
- Logic synthesis using Yosys
- Viewing synthesized netlists and schematics
- Gate-Level Simulation (GLS)
- Comparing RTL and synthesized design behavior

 ➡️ **Documentation:** [Session 2 README](./Session%202/README.md)


## Session 3: 
**Topics Covered:**

- RTL Simulation
- Yosys Synthesis
- Gate-Level Netlist
- Gate-Level Simulation (GLS)
- GTKWave Analysis

➡️ **Documentation:** [Session 3 README](./Session%203/README.md)

---

# Assignment: Sequence Detector
**Topics Covered:**

- FSM Design
- Sequence Detection (`1111001`)
- Testbench Verification
- RTL Simulation
- Synthesis and GLS

➡️ **Documentation:** [Assignment README](./Assignment/README.md)

---

## Tools Used

- Verilog
- Icarus Verilog (iverilog)
- GTKWave
- Yosys
- SKY130 Standard-Cell Library
- Git
- GitHub

---

# Sky130 Modules

## Module 1 - Inception of Open-Source EDA, OpenLANE and Sky130 PDK

1. QFN-48 Package, Chip, Pads, Core, Die & IPs
2. Introduction to RISC-V
3. From Software Applications to Hardware
4. Open-Source Digital ASIC Design Components
5. Simplified RTL2GDS Flow
6. OpenLANE and STRIVE Chipsets
7. OpenLANE Detailed ASIC Design Flow
8. OpenLANE Directory Structure
9. Design Preparation
10. Review Files After Design Prep & Synthesis
11. OpenLANE Project Git Link
12. Synthesis Results Characterization

➡️ **Documentation:** [Sky130 Module 1 README](./Sky130%20Module%201/README.md)



## Module 2 - Good Floorplan vs Bad Floorplan and Introduction to Library Cells

### Part 1 - Chip Floorplanning Considerations

1. Chip Floorplanning Considerations
2. Utilization Factor & Aspect Ratio
3. Pre-Placed Cells
4. De-coupling Capacitors
5. Power Planning
6. Pin Placement & Placement Blockages
7. Run Floorplan Using OpenLANE
8. Review Floorplan Files
9. Review Floorplan Layout in Magic

### Part 2 - Library Binding and Placement

10. Netlist Binding & Initial Placement
11. Wire-Length & Capacitance Optimization
12. Final Placement Optimization
13. Need for Libraries & Characterization
14. Congestion-Aware Placement Using RePlAce

### Part 3 - Cell Design and Characterization Flows

15. Cell Design & Characterization Flows
16. Inputs for Cell Design Flow
17. Circuit Design
18. Layout Design
19. Typical Characterization Flow

### Part 4 - General Timing Characterization Parameters

20. General Timing Characterization Parameters
21. Timing Threshold Definitions
22. Propagation Delay & Transition Time
    
➡️ **Documentation:** [Sky130 Module 2 README](./Sky130%20Module%202/README.md)



## Tools Used

- OpenLANE – RTL-to-GDSII ASIC design flow
- Sky130 PDK – Open-source process design kit
- OpenROAD – Physical design and placement
- RePlAce – Placement optimization
- Magic – VLSI layout visualization
- Git & GitHub – Version control and project documentation
- Linux Terminal – Running commands and executing the design flow

---

### Author

Name: Rapaka Usha  
College: Anurag University  
Branch: Electronics and Communication Engineering (ECE)
