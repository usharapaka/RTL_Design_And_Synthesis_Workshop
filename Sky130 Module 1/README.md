# Sky130 Module 1 - Inception of Open-Source EDA, OpenLANE and Sky130 PDK

## Overview

This module introduces the fundamentals of open-source digital ASIC design using the Sky130 PDK and OpenLANE. It covers the basic structure of a chip, RISC-V architecture, the transition from software to hardware, open-source ASIC design components, RTL-to-GDSII flow, OpenLANE, design preparation, synthesis, and synthesis result characterization.

---

# 1. SKY_L1 - Introduction to QFN-48 Package, Chip, Pads, Core, Die and IPs

## Objective

To understand the basic physical structure of an ASIC chip and the relationship between the package, die, pads, core, and IP blocks.

## Theory

### QFN-48 Package

QFN stands for **Quad Flat No-lead** package. A QFN-48 package contains 48 electrical connections around the package. The package provides the physical connection between the silicon chip and the external circuit board.

### Chip

A chip is an integrated circuit fabricated on a semiconductor material, generally silicon. It contains different functional blocks required to implement the desired design.

### Die

The die is the actual piece of silicon on which the circuit is fabricated. The die is placed inside a package and electrically connected to the package terminals.

### Pads

Pads are physical connection points on the chip. They provide electrical connections between the internal circuitry and the external environment.

### Core

The core is the main area of the chip where the digital logic and functional blocks are placed.

### IPs

IP stands for **Intellectual Property**. An IP is a reusable design block that performs a specific function.

Examples of IPs include:

- CPU cores
- Memory blocks
- UART
- SPI
- Timers
- GPIO
- PLLs

## Basic Hierarchy

```text
QFN Package
     |
     v
    Die
     |
     v
   Pads
     |
     v
   Core
     |
     v
   IP Blocks
```

## Key Learning

The physical structure of a chip can be understood as a hierarchy from the package level down to the internal IP blocks. Understanding this hierarchy provides the foundation for learning ASIC physical design.

## Screenshot
### figure 1:

<img width="933" height="630" alt="Screenshot 2026-08-30 152730" src="https://github.com/user-attachments/assets/2052e399-6c98-47c2-b67d-c47ad4f99118" />

### figure 2:

2.<img width="1200" height="677" alt="Screenshot 2026-08-30 152645" src="https://github.com/user-attachments/assets/dc5a0b13-6a38-4007-8f51-7702e257bb7e" />

# 2. SKY_L2 - Introduction to RISC-V
## Objective

To understand the basic concept of RISC-V and its importance in open-source processor development.

## Theory

RISC-V is an open standard Instruction Set Architecture (ISA). It is openly available and can be used for processor design without depending on a proprietary instruction set architecture.

RISC-V follows the Reduced Instruction Set Computer (RISC) approach.

### Important Features

Open and freely available ISA
Modular instruction-set architecture
Suitable for academic and industrial applications
Supports custom extensions
Can be implemented in hardware
Useful for processor and SoC development

### RISC-V and Hardware

Software instructions are eventually executed by a processor that implements the RISC-V ISA.

```text
Application
     |
     v
Compiler
     |
     v
RISC-V Instructions
     |
     v
RISC-V Processor
     |
     v
Hardware
```
## Key Learning

RISC-V provides an open instruction-set architecture that enables designers and researchers to develop and customize processor hardware.

## Screenshot
### figure 1:

1.<img width="1377" height="828" alt="Screenshot 2026-08-30 153432" src="https://github.com/user-attachments/assets/91d9d8a9-9893-4875-b32b-ed1f0ff913d6" />

# 3. SKY_L3 - From Software Applications to Hardware
## Objective

To understand how a software application is converted into machine instructions and executed by hardware.

## Theory

A software application is written using a high-level programming language. The compiler converts the program into lower-level instructions that can be executed by a processor.

### Software to Hardware Flow
```text
Software Application
        |
        v
Programming Language
        |
        v
Compiler
        |
        v
Assembly / Machine Code
        |
        v
Instruction Set Architecture
        |
        v
Processor
        |
        v
Digital Hardware
```
For a RISC-V based system, the compiler generates instructions according to the RISC-V ISA.

The processor fetches, decodes, and executes these instructions using different hardware units.

## Important Processor Blocks
ALU
Registers
Control Unit
Program Counter
Memory Interface
## Key Learning

The Instruction Set Architecture acts as an interface between software and hardware. It defines the instructions that software can use and the hardware must implement.

## Screenshot
### figure 1:

1.<img width="1380" height="823" alt="Screenshot 2026-08-30 154711" src="https://github.com/user-attachments/assets/95516c70-87b0-454c-8787-a1b0bc51c371" />

### figure 2:

2.<img width="1328" height="822" alt="Screenshot 2026-08-30 155531" src="https://github.com/user-attachments/assets/07eccebb-f9b0-4e05-bc08-8ad96404c95c" />

# 4. SKY_L1 - Introduction to All Components of Open-Source Digital ASIC Design
## Objective

To understand the major components involved in an open-source digital ASIC design flow.

## Theory

An ASIC design flow converts a hardware description into a physical chip layout that can be manufactured.

The major stages include:

### RTL

RTL stands for Register Transfer Level. It describes the functionality and behavior of a digital circuit using a Hardware Description Language such as Verilog.

### Simulation

Simulation verifies whether the RTL design behaves according to the required functionality.

### Synthesis

Synthesis converts RTL into a gate-level netlist using standard-cell libraries.

### Floorplanning

Floorplanning determines the physical organization of the chip, including the core and die dimensions.

### Placement

Placement determines the physical locations of standard cells inside the core area.

### Clock Tree Synthesis

Clock Tree Synthesis (CTS) creates a clock distribution network to deliver the clock signal to sequential elements.

### Routing

Routing creates physical connections between cells using metal layers.

### Signoff

Signoff checks the design for timing, physical, and other required constraints before fabrication.

## Overall Flow
```text
RTL
 |
 v
Simulation
 |
 v
Synthesis
 |
 v
Floorplanning
 |
 v
Placement
 |
 v
Clock Tree Synthesis
 |
 v
Routing
 |
 v
Signoff
 |
 v
GDSII
```
## Key Learning

The open-source ASIC flow provides a complete path from RTL description to a physical chip layout.

## Screenshot
### figure 1:

1.<img width="685" height="742" alt="Screenshot 2026-08-30 161303" src="https://github.com/user-attachments/assets/9d37a452-05cf-4041-9546-e69b5f1f661f" />

### figure 2:

2.<img width="1292" height="715" alt="Screenshot 2026-08-30 161603" src="https://github.com/user-attachments/assets/21d8f833-d489-42c8-aa77-aeef22d17f94" />

# 5. SKY_L2 - Simplified RTL2GDS Flow
## Objective

To understand the simplified RTL-to-GDSII flow used in digital ASIC design.

## Theory

RTL2GDS refers to the process of converting a hardware design from RTL into a physical layout represented by GDSII.

### RTL2GDS Flow
```text 
RTL
 |
 v
Synthesis
 |
 v
Floorplanning
 |
 v
Placement
 |
 v
Clock Tree Synthesis
 |
 v
Routing
 |
 v
Signoff
 |
 v
GDSII
```
### RTL

The functionality of the digital design is described at RTL level.

### Synthesis

The RTL is converted into a gate-level netlist using standard cells.

### Floorplanning

The dimensions of the core and die are defined and the major physical regions are organized.

### Placement

Standard cells are physically placed inside the core.

### Clock Tree Synthesis

The clock distribution network is created and optimized.

### Routing

Physical connections between the cells are created using metal layers.

### GDSII

GDSII represents the final physical layout of the chip and is used as the layout database for manufacturing.

## Key Learning

The RTL2GDS flow transforms an abstract RTL design into a physical representation suitable for fabrication.

## Screenshot
### figure 1:
1.<img width="835" height="455" alt="Screenshot 2026-09-05 191423" src="https://github.com/user-attachments/assets/9509afcd-2890-4134-a817-2813490a4aa4" />

# 6. SKY_L3 - Introduction to OpenLANE and Strive Chipsets
## Objective

To understand OpenLANE and its role in automating the digital ASIC design flow.

## OpenLANE

OpenLANE is an open-source automated RTL-to-GDSII flow for digital ASIC design.

It integrates multiple open-source EDA tools to perform different stages of the ASIC implementation flow.

## OpenLANE Flow
``` text
Design Preparation
        |
        v
Synthesis
        |
        v
Floorplanning
        |
        v
Placement
        |
        v
Clock Tree Synthesis
        |
        v
Routing
        |
        v
Signoff
        |
        v
GDSII
```
## STRIVE Chipsets

STRIVE is associated with open-source silicon efforts that demonstrate the practical implementation of open-source ASIC design flows.

These projects demonstrate how open-source EDA tools and open PDKs can be used for complete chip development.

## Key Learning

OpenLANE provides automation for the RTL-to-GDSII flow and enables digital ASIC implementation using open-source tools.

## Screenshot
### figure 1:

1.<img width="1367" height="772" alt="Screenshot 2026-09-04 180144" src="https://github.com/user-attachments/assets/4593ec26-b411-4886-98ea-3833cbcde838" />

### figure 2:

2.<img width="1370" height="770" alt="Screenshot 2026-09-04 180425" src="https://github.com/user-attachments/assets/1249e1fd-a320-4082-9c8b-50d4684a36df" />

### figure 3:

3.<img width="1372" height="771" alt="Screenshot 2026-09-04 180508" src="https://github.com/user-attachments/assets/2370ff05-083a-48cd-89bb-c30e2f59854e" />


# 7. SKY_L4 - Introduction to OpenLANE Detailed ASIC Design Flow
## Objective

To understand the detailed stages performed by OpenLANE during ASIC implementation.

## Detailed OpenLANE Flow
```text
Design Preparation
        |
        v
Synthesis
        |
        v
Floorplanning
        |
        v
Placement
        |
        v
Clock Tree Synthesis
        |
        v
Routing
        |
        v
Signoff
        |
        v
GDSII
```
## 1. Design Preparation

The RTL source files, configuration files, constraints, libraries, and other required design information are prepared.

## 2. Synthesis

The RTL design is converted into a gate-level netlist.

## 3. Floorplanning

The core and die dimensions are defined and the major physical elements are organized.

## 4. Placement

Standard cells are placed inside the core area.

## 5. Clock Tree Synthesis

A clock distribution network is generated to distribute the clock signal to sequential elements.

## 6. Routing

The physical connections between cells are created using available metal layers.

## 7. Signoff

The design is checked against required physical and timing constraints.

## 8. GDSII

The final physical layout is generated in GDSII format.

## Key Learning

OpenLANE automates the major stages of the ASIC physical design flow, from design preparation to final GDSII generation.

## Screenshot
### figure 1:

1.<img width="1372" height="767" alt="Screenshot 2026-09-04 181600" src="https://github.com/user-attachments/assets/56b7dbeb-62a3-4454-9f46-0b23a3882947" />

### figure 2:

2.<img width="1597" height="866" alt="Screenshot 2026-09-04 182500" src="https://github.com/user-attachments/assets/e1cd250d-bf66-4813-8130-05718759b154" />

### figure 3:

3.<img width="1672" height="803" alt="Screenshot 2026-09-04 182541" src="https://github.com/user-attachments/assets/7c04730e-07c3-4c9d-9ea1-53e063f3f3fb" />

### figure 4:

4.<img width="1306" height="702" alt="Screenshot 2026-09-04 182714" src="https://github.com/user-attachments/assets/1a2730b9-f675-4712-9546-fd2b0f4a4724" />


# 8. SKY_L1 - OpenLANE Directory Structure in Detail
## Objective

To understand the directory structure used by OpenLANE projects.

## Directory Structure

A typical OpenLANE installation contains directories for designs, scripts, configuration files, dependencies, and PDK-related files.
``` text
openlane/
|
+-- designs/
|
+-- scripts/
|
+-- configuration/
|
+-- dependencies/
|
+-- pdks/
```
The exact directory structure can vary depending on the OpenLANE version and installation.

## Important Directories
### designs/

Contains the designs that are implemented using the OpenLANE flow.

### scripts/

Contains scripts used to automate different stages of the flow.

### configuration/

Contains configuration parameters and flow settings.

### pdks/

Contains technology-related files and libraries required for ASIC implementation.

### Runs

During execution, OpenLANE generates run directories containing intermediate and final results.

These may include:

Synthesis reports
Netlists
Floorplan data
Placement results
Routing results
Timing reports
GDSII files
## Key Learning

Understanding the OpenLANE directory structure helps in locating design files, configuration files, scripts, reports, and generated implementation results.

## Screenshot
### figure 1:

1.<img width="885" height="480" alt="Screenshot 2026-09-05 213358" src="https://github.com/user-attachments/assets/399d4400-b4cc-4c7d-9e12-6e207add69d4" />

### figure 2:

2.<img width="892" height="490" alt="Screenshot 2026-09-05 213454" src="https://github.com/user-attachments/assets/302bef97-8e44-4ffd-943b-b189699329a1" />

### figure 3:

3.<img width="885" height="492" alt="Screenshot 2026-09-05 213542" src="https://github.com/user-attachments/assets/6b9c597a-be15-4055-b58c-0360b80bbefb" />


# 9. SKY_L2 - Design Preparation Step
## Objective

To understand the preparation required before running the OpenLANE ASIC flow.

## Theory

Before starting the main ASIC flow, the required design files, configuration parameters, libraries, and constraints must be available.

### Required Design Information

Typical design preparation includes:

RTL source files
Top module
Clock information
Timing constraints
Configuration parameters
Technology libraries
### Basic Design Structure
```text
Design
 |
 +-- config
 |
 +-- src
 |
 +-- constraints
```

The exact files depend on the design and OpenLANE version.

## Design Preparation

The design is placed in the appropriate OpenLANE design directory and the required configuration parameters are provided.

Proper preparation allows OpenLANE to identify the RTL, top module, technology, libraries, and constraints correctly.

## Key Learning

Design preparation is an important initial step because incorrect or missing configuration can prevent later stages of the ASIC flow from executing correctly.

## Screenshot
### figure 1:

1.<img width="890" height="493" alt="Screenshot 2026-09-05 213601" src="https://github.com/user-attachments/assets/f43fa440-ac7b-4a47-b04e-70d050f22a7f" />

### figure 2:

2.<img width="885" height="487" alt="Screenshot 2026-09-05 213621" src="https://github.com/user-attachments/assets/7c4bfba7-ef3e-45aa-9087-e4d5a9c57b03" />

# 10. SKY_L3 - Review Files After Design Prep and Run Synthesis
## Objective

To review the generated design files after design preparation and execute synthesis.

## Review After Design Preparation

After preparing the design, the generated files and configuration should be reviewed before running the complete flow.

Important files include:

RTL source files
Configuration files
Timing constraints
Technology information
Library information
## Synthesis

Synthesis converts the RTL description into a gate-level netlist using the available standard-cell library.
``` text
RTL
 |
 v
Synthesis Tool
 |
 v
Gate-Level Netlist
```
## Synthesis Results

The synthesis stage provides information such as:

Number of cells
Sequential cells
Combinational cells
Cell area
Timing information
Clock information
## Key Learning

Synthesis converts the RTL design into a gate-level implementation and provides important information about the hardware complexity, area, and timing characteristics of the design.

## Screenshot
### figure 1:

1.<img width="885" height="492" alt="Screenshot 2026-09-05 213711" src="https://github.com/user-attachments/assets/53f921b8-4a80-4d92-8c35-fd6d4a5ca07b" />

### figure 2:

2.<img width="886" height="487" alt="Screenshot 2026-09-05 213657" src="https://github.com/user-attachments/assets/7c6d1610-0aa9-446c-984d-96cb21f946e0" />

### figure 3:

3.<img width="891" height="492" alt="Screenshot 2026-09-05 213732" src="https://github.com/user-attachments/assets/ddec2c78-772f-4beb-9a88-13044ae75d96" />

### figure 4:

4.<img width="883" height="491" alt="Screenshot 2026-09-05 213949" src="https://github.com/user-attachments/assets/917c46ca-4fee-45a3-a50a-b279de4ca7df" />

# 11. SKY_L4 - OpenLANE Project Git Link Description
## Objective

To understand how the OpenLANE project can be maintained, documented, and shared using Git and GitHub.

# Git

Git is a distributed version-control system used to track changes in source code and project files.

## GitHub

GitHub is an online platform for hosting Git repositories and collaborating on projects.

## Project Repository

A typical project repository can contain:
``` text
README.md
|
+-- RTL Files
|
+-- Configuration Files
|
+-- Documentation
|
+-- Screenshots
|
+-- Results
```
## Advantages of GitHub

GitHub helps to:

Maintain project history
Track changes
Organize project files
Share the project
Document experiments
Collaborate with others
## Workshop Documentation

The GitHub repository can contain the theory covered in the workshop, commands used during practical sessions, screenshots, observations, and results.

## Key Learning

Git and GitHub provide an organized way to maintain and share the OpenLANE project and its documentation.

# 12. SKY_L5 - Steps to Characterize Synthesis Results
## Objective

To understand how synthesis results are analyzed and characterized.

## Theory

After synthesis, the generated reports are analyzed to understand the quality and characteristics of the synthesized design.

## Important Parameters
### 1. Cell Count

Cell count indicates the number of standard cells used by the synthesized design and provides an indication of the hardware complexity.

### 2. Area

The total cell area gives an estimate of the silicon area required by the synthesized design.

### 3. Timing

Timing analysis determines whether the design can operate at the required clock frequency.

Important timing parameters include:

Clock period
Setup timing
Hold timing
Slack
Critical path
### 4. Power

Power analysis provides an estimate of the power consumed by the design.

## Synthesis Characterization
```text
Synthesis
    |
    v
Reports
    |
    +-- Cell Count
    |
    +-- Area
    |
    +-- Timing
    |
    +-- Slack
    |
    +-- Power
```
## Key Learning

Characterizing synthesis results helps determine whether the design satisfies the required area, timing, and power constraints before proceeding to later physical-design stages.

## Screenshot
### figure 1:

1.<img width="890" height="490" alt="Screenshot 2026-09-05 214009" src="https://github.com/user-attachments/assets/5c395ca9-dc4a-4d62-a13e-6b9228c75098" />

### figure 2:

2.<img width="878" height="487" alt="Screenshot 2026-09-05 214100" src="https://github.com/user-attachments/assets/6616a5b0-2b2b-4926-a344-c5fd2d2504dc" />

### figure 3:

3.<img width="881" height="487" alt="Screenshot 2026-09-05 214122" src="https://github.com/user-attachments/assets/4de89ed7-2158-4e8b-83ee-5bfa0063261a" />

### figure 4:

4.<img width="880" height="487" alt="Screenshot 2026-09-05 214140" src="https://github.com/user-attachments/assets/be6fc1b1-8009-4dfb-a0c1-f606c1aa67de" />

### figure 5:

5.<img width="887" height="491" alt="Screenshot 2026-09-05 214231" src="https://github.com/user-attachments/assets/61d442ea-4822-41fe-a598-7fba77f217da" />

### figure 6:

6.<img width="885" height="492" alt="Screenshot 2026-09-05 214247" src="https://github.com/user-attachments/assets/a2dca1bd-4912-48ac-b1f3-aac89b630f24" />

### figure 7:

7.<img width="883" height="487" alt="Screenshot 2026-09-05 214311" src="https://github.com/user-attachments/assets/1b93915d-962b-45bc-a59c-d98a7a32ba3e" />

# Module 1 - Overall Learning

Through this module, I learned the fundamentals of open-source digital ASIC design using the Sky130 PDK and OpenLANE.

The module covered:

QFN-48 package and chip structure
Pads, core, die, and IPs
RISC-V instruction set architecture
Software-to-hardware flow
Open-source digital ASIC design components
RTL-to-GDSII flow
OpenLANE
STRIVE chipsets
OpenLANE detailed ASIC flow
OpenLANE directory structure
Design preparation
Synthesis
Synthesis result characterization
Git and GitHub project documentation
## Conclusion

This module provided the foundation required to understand open-source ASIC design. The theoretical concepts were supported by hands-on experiments involving OpenLANE, design preparation, synthesis, file review, and analysis of synthesis results.

The knowledge gained in this module forms the basis for understanding the subsequent stages of the Sky130 ASIC physical design flow.
