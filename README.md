# RTL Design & Synthesis Workshop

**A structured collection of hands-on experiments and documentation covering RTL design, simulation, synthesis, optimization, timing analysis, and open-source ASIC design.**

This repository documents my learning journey and practical work completed during the **RTL Design Workshop**, including Verilog RTL implementations, simulation and waveform analysis, synthesis experiments, optimization techniques, and SKY130-based ASIC design studies.

---
## Quick Navigation

- [Workshop Overview](#rtl-design--synthesis)
- [Module 0 – Workshop Introduction](#module-0--workshop-introduction)
- [Module 1 – Verilog RTL Design & Synthesis](#module-1--introduction-to-verilog-rtl-design-and-synthesis)
- [Module 2.1 – Timing Libraries & Synthesis](#module-21--timing-libraries-hierarchical-vs-flat-synthesis--efficient-flop-coding-styles)
- [Module 2.2 – Efficient Flip-Flop Coding](#module-22--flip-flop-design--sky130-technology-mapping)
- [Module 3 – Combinational & Sequential Optimizations](#module-3--combinational-and-sequential-optimizations)
- [Module 4 – GLS & Synthesis-Simulation Mismatch](#module-4--gls-blocking-vs-non-blocking--synthesis-simulation-mismatch)
- [Module 5 – RTL Coding Constructs](#module-5--optimization-in-synthesis)
- [Mid-Term Submission](#mid-term-submission)
- [Assignment – Sequence Detector](#assignment--sequence-detector)
- [SKY130 Modules](#sky130-modules)
  - [SKY130 Module 1](#sky130-module-1--inception-of-open-source-eda-openlane--sky130-pdk)
  - [SKY130 Module 2](#sky130-module-2--good-floorplan-vs-bad-floorplan-and-introduction-to-library-cells)
  - [SKY130 Module 3](#sky130-module-3--design-library-cell-using-magic-layout-and-ngspice-characterization)
  - [SKY130 Module 4](#sky130-module-4--pre-layout-timing-analysis-and-importance-of-good-clock-tree)
  - [SKY130 Module 5](#sky130-module-5--final-steps-for-rtl2gds-using-tritonroute-and-opensta)
  - [Tools & Technologies](#tools--technologies)
- [Author](#author)
---

# Repository Contents

| Section                    | Focus                                                                          |
|----------------------------|--------------------------------------------------------------------------------|
| **RTL Design & Synthesis** | Verilog RTL design, simulation, synthesis, technology mapping and optimization |
| **Mid Term Submission**    | RISC-V, RTL simulation, synthesis, GLS and OpenROAD exploration                |
| **Sequence Detector**      | FSM design, sequence detection, verification, synthesis and GLS                |
| **SKY130 Modules**         | Open-source EDA, ASIC design, layout, timing, CTS, routing and DRC             |
| **Tools & Technologies**   | OpenLANE, OpenROAD, Yosys, Magic, RePlAce, SKY130 and related tools            |

---
# RTL Design & Synthesis

| Module         | Topic                                                                    | Documentation                           |
| -------------- | ------------------------------------------------------------------------ | --------------------------------------- |
| **Module 0**   | Workshop Introduction                                                    | [View README](./Module%200/README.md)   |
| **Module 1**   | Introduction to Verilog RTL Design and Synthesis                         | [View README](./Module%201/README.md)   |
| **Module 2.1** | Timing Libraries, Hierarchical vs Flat Synthesis & Efficient Flop Coding | [View README](./Module%202.1/README.md) |
| **Module 2.2** | Flip-Flop Design, Simulation & SKY130 Mapping                            | [View README](./Module%202.2/README.md) |
| **Module 3**   | Combinational & Sequential Optimization                                  | [View README](./Module%203/README.md)   |
| **Module 4**   | GLS & Synthesis-Simulation Mismatch                                      | [View README](./Module%204/README.md)   |
| **Module 5**   | Optimization in Synthesis                                                | [View README](./Module%205/README.md)   |

---

# Module 0 — Workshop Introduction 

### Topics Covered

* Introduction and Cloud Lab Instructions
* Local Lab Installation

**Documentation:** [Module 0 README](./Module%200/README.md)

---

# Module 1 — Introduction to Verilog RTL Design and Synthesis

### Topics Covered

* Workshop Overview
* Digital Design & RTL Design Flow
* Verilog Design and Testbench
* Icarus Verilog & GTKWave
* 2:1 Multiplexer Design
* Yosys, Gate Libraries & RTL Synthesis
* Technology Mapping & Gate-Level Netlist
* Practical Exercise, Results & Conclusion

**Documentation:** [Module 1 README](./Module%201/README.md)

---

# Module 2.1 — Timing Libraries, Hierarchical vs Flat Synthesis & Efficient Flop Coding Styles

### Topics Covered

* RTL Design Concepts
* Verilog RTL Coding
* Multiple Module Design
* Hierarchical Design
* RTL Simulation and Verification
* Yosys Synthesis
* Gate-Level Netlist
* Technology Mapping

**Documentation:** [Module 2.1 README](./Module%202.1/README.md)

---

# Module 2.2 — Flip-Flop Design & SKY130 Technology Mapping

### Topics Covered

* Asynchronous Reset D Flip-Flop
* Asynchronous Set D Flip-Flop
* Synchronous Reset D Flip-Flop
* Flip-Flop Simulation & Synthesis
* SKY130 Technology Mapping
* Interesting Optimization – Part 1

**Documentation:** [Module 2.2 README](./Module%202.2/README.md)

---

# Module 3 — Combinational and Sequential Optimizations

### Topics Covered

* Constant Propagation
* State Optimization
* Cloning
* Retiming
* Optimization Labs

**Documentation:** [Module 3 README](./Module%203/README.md)

---

# Module 4 — GLS, Blocking vs Non-Blocking & Synthesis-Simulation Mismatch

### Topics Covered

* Gate-Level Simulation (GLS)
* Synthesis-Simulation Mismatch
* Blocking vs. Non-Blocking Assignments
* Ternary Operator MUX
* Yosys Synthesis
* Gate-Level Simulation of MUX
* Common RTL Coding Pitfalls
* Blocking Assignment Caveat
* Synthesis of Corrected RTL

**Documentation:** [Module 4 README](./Module%204/README.md)

---

# Module 5 — Optimization in Synthesis

### Topics Covered

* If-Else Statements
* Nested If-Else
* Inferred Latches
* Case Statements
* Incomplete/Partial Case Handling
* For Loops
* Generate Blocks
* Ripple Carry Adder (RCA)
* 4-to-1 MUX using For Loop
* 8-to-1 Demux using Case & For Loop
* 8-bit RCA using Generate Block
* Synthesis Optimization

**Documentation:** [Module 5 README](./Module%205/README.md)

---

# Mid Term Submission

## Session 1

### Topics Covered

* RISC-V Development Environment Setup using GitHub Codespaces
* Compiling a RISC-V C Program
* Viewing Assembly Code using `objdump`
* Running Programs using Spike Simulator
* RTL Simulation using Icarus Verilog
* Waveform Analysis using GTKWave
* Introduction to OpenROAD RTL-to-GDS Flow
* Exploring OpenROAD Repository Structure and Configuration

**Documentation:** [Session 1 README](./Session%201/README.md)

---

## Session 2

### Topics Covered

* Introduction to Yosys Synthesis Flow
* RTL Simulation using Icarus Verilog
* Waveform Analysis using GTKWave
* Good MUX and Bad MUX Design Comparison
* Writing Verilog Testbenches
* Logic Synthesis using Yosys
* Viewing Synthesized Netlists and Schematics
* Gate-Level Simulation (GLS)
* Comparing RTL and Synthesized Design Behavior

**Documentation:** [Session 2 README](./Session%202/README.md)

---

## Session 3

### Topics Covered

* RTL Simulation
* Yosys Synthesis
* Gate-Level Netlist
* Gate-Level Simulation (GLS)
* GTKWave Analysis

**Documentation:** [Session 3 README](./Session%203/README.md)

---

# Assignment — Sequence Detector

### Topics Covered

* FSM Design
* Sequence Detection (`1111001`)
* Testbench Verification
* RTL Simulation
* Synthesis and GLS

**Documentation:** [Assignment README](./Assignment/README.md)

---

# Tools Used

| Tool / Technology                | Usage                      |
| -------------------------------- | -------------------------- |
| **Verilog**                      | RTL Design                 |
| **Icarus Verilog (iverilog)**    | Simulation                 |
| **GTKWave**                      | Waveform Analysis          |
| **Yosys**                        | Logic Synthesis            |
| **SKY130 Standard-Cell Library** | Technology Mapping         |
| **Git**                          | Version Control            |
| **GitHub**                       | Repository & Documentation |

---

# SKY130 Modules

## SKY130 Module 1 — Inception of Open-Source EDA, OpenLANE & SKY130 PDK

### SKY130_D1_SK1 — How to Talk to Computers

1. **svgSKY_L1** — Introduction to QFN-48 Package, Chip, Pads, Core, Die and IPs
2. **SKY_L2** — Introduction to RISC-V
3. **SKY_L3** — From Software Applications to Hardware

### SKY130_D1_SK2 — SoC Design and OpenLANE

1. **svgSKY_L1** — Introduction to All Components of Open-Source Digital ASIC Design
2. **SKY_L2** — Simplified RTL2GDS Flow
3. **SKY_L3** — Introduction to OpenLANE and STRIVE Chipsets
4. **SKY_L4** — Introduction to OpenLANE Detailed ASIC Design Flow

### SKY130_D1_SK3 — Get Familiar with Open-Source EDA Tools

1. **svgSKY_L1** — OpenLANE Directory Structure in Detail
2. **SKY_L2** — Design Preparation Step
3. **SKY_L3** — Review Files After Design Prep and Run Synthesis
4. **SKY_L4** — OpenLANE Project Git Link Description
5. **SKY_L5** — Steps to Characterize Synthesis Results

**Documentation:** [SKY130 Module 1 README](./Sky130%20Module%201/README.md)

---

# SKY130 Module 2 — Good Floorplan vs Bad Floorplan and Introduction to Library Cells

## Part 1 — Chip Floorplanning Considerations

1. Chip Floorplanning Considerations
2. Utilization Factor & Aspect Ratio
3. Pre-Placed Cells
4. De-coupling Capacitors
5. Power Planning
6. Pin Placement & Placement Blockages
7. Run Floorplan Using OpenLANE
8. Review Floorplan Files
9. Review Floorplan Layout in Magic

## Part 2 — Library Binding and Placement

10. Netlist Binding & Initial Placement
11. Wire-Length & Capacitance Optimization
12. Final Placement Optimization
13. Need for Libraries & Characterization
14. Congestion-Aware Placement Using RePlAce

## Part 3 — Cell Design and Characterization Flows

15. Cell Design & Characterization Flows
16. Inputs for Cell Design Flow
17. Circuit Design
18. Layout Design
19. Typical Characterization Flow

## Part 4 — General Timing Characterization Parameters

20. General Timing Characterization Parameters
21. Timing Threshold Definitions
22. Propagation Delay & Transition Time

**Documentation:** [SKY130 Module 2 README](./Sky130%20Module%202/README.md)

---

# SKY130 Module 3 — Design Library Cell Using Magic Layout and ngspice Characterization

## SKY130_D3_SK1 — Labs for CMOS Inverter ngspice Simulations

1. **svgSKY_L0** — IO Placer Revision
2. **SKY_L1** — SPICE Deck Creation for CMOS Inverter
3. **SKY_L2** — SPICE Simulation Lab for CMOS Inverter
4. **SKY_L3** — Switching Threshold — Vm
5. **SKY_L4** — Static and Dynamic Simulation of CMOS Inverter
6. **SKY_L5** — Lab Steps to Git Clone `vsdstdcelldesign`

---

## SKY130_D3_SK2 — Inception of Layout — CMOS Fabrication Process

1. **svgSKY_L1** — Create Active Regions
2. **SKY_L2** — Formation of N-Well and P-Well
3. **SKY_L3** — Formation of Gate Terminal
4. **SKY_L4** — Lightly Doped Drain (LDD) Formation
5. **SKY_L5** — Source–Drain Formation
6. **SKY_L6** — Local Interconnect Formation
7. **SKY_L7** — Higher-Level Metal Formation
8. **SKY_L8** — Lab Introduction to SKY130 Basic Layers Layout and LEF Using Inverter
9. **SKY_L9** — Lab Steps to Create Standard Cell Layout and Extract SPICE Netlist

## SKY130_D3_SK2 — Inception of Layout — CMOS Fabrication Process

1. **svgSKY_L9** — Lab Steps to Create Standard Cell Layout and Extract SPICE Netlist
2. **SKY_L2** — Lab Steps to Characterize Inverter Using SKY130 Model Files
3. **SKY_L3** — Lab Introduction to Magic Tool Options and DRC Rules
4. **SKY_L4** — Lab Introduction to SKY130 PDKs and Steps to Download Labs
5. **SKY_L5** — Lab Introduction to Magic and Steps to Load SKY130 Tech Rules
6. **SKY_L6** — Lab Exercise to Fix `poly.9` Error in SKY130 Tech File
7. **SKY_L7** — Lab Exercise to Implement Poly Resistor Spacing to Diff and Tap
8. **SKY_L8** — Lab Challenge Exercise to Describe DRC Error as Geometrical Construct
9. **SKY_L9** — Lab Challenge to Find Missing or Incorrect Rules and Fix Them

**Documentation:** [SKY130 Module 3 README](./Sky130%20Module%203/README.md)

---

# SKY130 Module 4 — Pre-Layout Timing Analysis and Importance of Good Clock Tree

## SKY130_D4_SK1 — Timing Modelling Using Delay Tables

1. **svgSKY_L1** — Lab Steps to Convert Grid Info to Track Info
2. **SKY_L2** — Lab Steps to Convert Magic Layout to Standard Cell LEF
3. **SKY_L3** — Introduction to Timing Libraries and Steps to Include New Cell in Synthesis
4. **SKY_L4** — Introduction to Delay Tables
5. **SKY_L5** — Delay Table Usage — Part 1
6. **SKY_L6** — Delay Table Usage — Part 2
7. **SKY_L7** — Lab Steps to Configure Synthesis Settings to Fix Slack and Include `vsdinv`

## SKY130_D4_SK2 — Timing Analysis with Ideal Clocks Using OpenSTA

1. **svgSKY_L1** — Setup Timing Analysis and Introduction to Flip-Flop Setup Time
2. **SKY_L2** — Introduction to Clock Jitter and Uncertainty
3. **SKY_L3** — Lab Steps to Configure OpenSTA for Post-Synthesis Timing Analysis
4. **SKY_L4** — Lab Steps to Optimize Synthesis to Reduce Setup Violations
5. **SKY_L5** — Lab Steps to Perform Basic Timing ECO

## SKY130_D4_SK3 — Clock Tree Synthesis Using TritonCTS and Signal Integrity

1. **svgSKY_L1** — Clock Tree Routing and Buffering Using H-Tree Algorithm
2. **SKY_L2** — Crosstalk and Clock Net Shielding
3. **SKY_L3** — Lab Steps to Run CTS Using TritonCTS
4. **SKY_L4** — Lab Steps to Verify CTS Runs

## SKY130_D4_SK4 — Timing Analysis with Real Clocks Using OpenSTA

1. **svgSKY_L1** — Setup Timing Analysis Using Real Clocks
2. **SKY_L2** — Hold Timing Analysis Using Real Clocks
3. **SKY_L3** — Lab Steps to Analyze Timing with Real Clocks Using OpenSTA
4. **SKY_L4** — Lab Steps to Execute OpenSTA with the Correct Timing Libraries and CTS Assignment
5. **SKY_L5** — Lab Steps to Observe the Impact of Larger CTS Buffers on Setup and Hold Timing

**Documentation:** [SKY130 Module 4 README](./Sky130%20Module%204/README.md)

---

# SKY130 Module 5 — Final Steps for RTL2GDS Using TritonRoute and OpenSTA

## SKY130_D5_SK1 — Routing and Design Rule Check (DRC)

1. **svgSKY_L1** — Introduction to Maze Routing — Lee’s Algorithm
2. **SKY_L2** — Lee’s Algorithm Conclusion
3. **SKY_L3** — Design Rule Check (DRC)

## SKY130_D5_SK2 — Power Distribution Network and Routing

1. **svgSKY_L1** — Lab Steps to Build Power Distribution Network
2. **SKY_L2** — Lab Steps from Power Straps to Standard Cell Power
3. **SKY_L3** — Basics of Global and Detailed Routing and Configuring TritonRoute

## SKY130_D5_SK3 — TritonRoute Features

1. **svgSKY_L1** — TritonRoute Feature 1 — Honors Pre-Processed Route Guides
2. **SKY_L2** — TritonRoute Features 2 & 3 — Inter-Guide Connectivity and Intra- & Inter-Layer Routing
3. **SKY_L3** — TritonRoute Method to Handle Connectivity
4. **SKY_L4** — Routing Topology Algorithm and Final Files List Post-Route

**Documentation:** [SKY130 Module 5 README](./Sky130%20Module%205/README.md)

---

#  Tools & Technologies

| Tool / Technology | Application |
| :---------------- | :---------- |
| **OpenLANE** | RTL-to-GDSII ASIC design flow |
| **SKY130 PDK** | Open-source process design kit |
| **OpenROAD** | Physical design, placement, CTS and routing |
| **RePlAce** | Placement optimization |
| **TritonCTS** | Clock Tree Synthesis |
| **TritonRoute** | Global and detailed routing |
| **OpenSTA** | Static Timing Analysis and timing verification |
| **Magic** | VLSI layout, extraction and Design Rule Checking (DRC) |
| **ngspice** | CMOS inverter simulation and characterization |
| **LEF** | Standard-cell physical abstraction |
| **DEF** | Physical design and layout representation |
| **Liberty (.lib)** | Standard-cell timing and characterization data |
| **SDC** | Timing and clock constraints |
| **Git** | Version control |
| **GitHub** | Repository management and documentation |
| **Linux Terminal** | VLSI tool execution and design-flow automation |

---

# Author

**Rapaka Usha**

**College:** Anurag University
**Branch:** Electronics and Communication Engineering (ECE)
