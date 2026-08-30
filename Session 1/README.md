# RISC-V, RTL Simulation and OpenROAD RTL-to-GDS Flow

## Overview

This repository documents hands-on learning and practical experiments performed using open-source tools for RISC-V development, RTL simulation, waveform analysis, and physical design.

The work covers:

- RISC-V development using GitHub Codespaces
- Cross-compiling a C program for RISC-V
- Binary disassembly using `objdump`
- Program execution using Spike
- RTL simulation using Icarus Verilog
- Waveform analysis using GTKWave
- OpenROAD RTL-to-GDS flow exploration
- Makefile-based design configuration
- Final GDS layout visualization using KLayout

---

# Part 1: RISC-V Development Environment

## Step 1: Open the RISC-V Repository

The RISC-V repository was opened on GitHub. The repository contains the required files, sample programs, and environment configuration needed to experiment with RISC-V software development.

The GitHub Codespaces feature was used to create a cloud-based development environment.

### Repository View

<img width="1536" height="691" alt="WhatsApp Image 2026-08-31 at 12 50 51 AM" src="https://github.com/user-attachments/assets/9c2ac25c-8e4b-4fc7-a92e-795bb8113d5e" />

---

## Step 2: Create a GitHub Codespace

A new GitHub Codespace was created from the repository.

### Procedure

1. Open the RISC-V repository.
2. Click the green **Code** button.
3. Select **Codespaces**.
4. Create a new Codespace.
5. Wait for the development environment to initialize.

GitHub Codespaces provides a browser-based VS Code environment with terminal access.

<img width="1536" height="691" alt="WhatsApp Image 2026-08-30 at 11 16 20 PM" src="https://github.com/user-attachments/assets/bc37547c-3bcd-4e26-93c4-180a61179de0" />

---

## Step 3: Verify the Development Environment

After the Codespace was initialized, the terminal was used to access the project files and execute the required commands.

The development environment provides access to the sample programs and required RISC-V tools.

<img width="1536" height="691" alt="WhatsApp Image 2026-08-30 at 11 16 23 PM" src="https://github.com/user-attachments/assets/8330d74b-a1c0-4e37-904d-c6850aa7ddfd" />

---

# Part 2: RISC-V Program Compilation

## Step 4: Navigate to the Samples Directory

The sample programs are available inside the `samples` directory.

```bash
cd samples/
```

The directory contains example C programs that can be compiled and executed for the RISC-V architecture.

---

## Step 5: Compile the RISC-V Program

The RISC-V cross compiler was used to compile the C program.

```bash
riscv64-unknown-elf-gcc -o sum1ton.o sum1ton.c
```

### Command Description

- `riscv64-unknown-elf-gcc` – RISC-V cross compiler
- `-o sum1ton.o` – Specifies the output file
- `sum1ton.c` – Input C source file

The successful compilation generates an executable that can be analyzed and executed using RISC-V tools.

<img width="1536" height="691" alt="WhatsApp Image 2026-08-30 at 11 16 22 PM" src="https://github.com/user-attachments/assets/3b069b2b-0f76-4aed-bcc3-f6e1903ed50b" />

---

# Part 3: Binary Disassembly

## Step 6: Analyze the Generated Executable

The compiled program was analyzed using the `objdump` utility.

```bash
objdump -d sum1ton.o
```

The `objdump` command displays the machine instructions and their corresponding assembly representation.

This helps in understanding:

- Generated assembly instructions
- Register operations
- Function execution
- Machine-level program flow

### Disassembly Output

![RISC-V objdump Output](images/03-riscv-objdump-output.jpg)

<img width="1536" height="691" alt="WhatsApp Image 2026-08-30 at 11 16 23 PM" src="https://github.com/user-attachments/assets/aae59e3e-3a3b-496f-82e5-a059554161ea" />

---

# Part 4: Running the RISC-V Program

## Step 7: Execute the Program Using Spike

The compiled RISC-V executable was executed using the Spike RISC-V simulator.

```bash
spike pk sum1ton.o
```

The expected output of the program is:

```text
Sum from 1 to 9 is 45
```

The successful execution confirms that the program was correctly compiled for the RISC-V architecture.

<img width="1536" height="691" alt="WhatsApp Image 2026-08-30 at 11 16 20 PM (1)" src="https://github.com/user-attachments/assets/df37322c-fa10-4a87-92d4-42b6f37dff57" />


<img width="1536" height="691" alt="WhatsApp Image 2026-08-31 at 12 50 53 AM" src="https://github.com/user-attachments/assets/9261f031-e13a-472b-9ad0-ce68ddaba431" />

---

# Part 5: RTL Simulation

## Overview

RTL simulation was performed to verify the functional behavior of a Verilog design.

The RTL verification flow includes:

1. Writing the RTL design
2. Creating a testbench
3. Compiling the Verilog files
4. Running the simulation
5. Generating waveform output
6. Analyzing the waveform

---

## Step 8: Compile the Verilog Design

The Verilog design and testbench were compiled using Icarus Verilog.

```bash
iverilog -o gmux verilog_files/good_mux.v verilog_files/tb_good_mux.v
```

### Purpose

- `iverilog` compiles the Verilog source files.
- `good_mux.v` contains the RTL design.
- `tb_good_mux.v` contains the testbench.
- The generated simulation output is used for functional verification.

<img width="1408" height="460" alt="WhatsApp Image 2026-08-30 at 11 28 05 PM" src="https://github.com/user-attachments/assets/646e882e-11c7-49d2-b927-d56cfd37d7d3" />

---

# Part 6: Waveform Analysis Using GTKWave

## Step 9: Analyze the Simulation Waveform

The generated waveform was opened using GTKWave.

GTKWave provides a graphical representation of signal transitions during simulation.

The waveform allows verification of:

- Input signal behavior
- Select signal transitions
- Output response
- Timing relationships

The observed waveform confirms the functional behavior of the RTL design.

<img width="1536" height="1156" alt="WhatsApp Image 2026-08-31 at 12 50 55 AM (1)" src="https://github.com/user-attachments/assets/eba8326a-bfce-479d-a545-4e261e0de256" />

---

# Part 7: OpenROAD RTL-to-GDS Flow

## Overview

The OpenROAD project was explored to understand the complete RTL-to-GDS physical design flow.

The OpenROAD flow automates multiple stages of digital IC physical design.

### Major Stages

```text
RTL Design
    ↓
Logic Synthesis
    ↓
Floorplanning
    ↓
Placement
    ↓
Clock Tree Synthesis
    ↓
Routing
    ↓
GDS Generation
```

---

## Step 10: Explore the OpenROAD Repository

The OpenROAD RTL-to-GDS repository was opened in GitHub Codespaces.

The repository contains the OpenROAD-flow-scripts infrastructure and configuration files required for executing physical design flows.

Important directories include:

```text
images/
orfs/
designs/
scripts/
tools/
```

The repository provides support for multiple technologies and design configurations.

<img width="1536" height="691" alt="WhatsApp Image 2026-08-30 at 11 16 23 PM (1)" src="https://github.com/user-attachments/assets/8bc54af3-5001-4011-b9e9-940245a3dc2a" />

---

# Part 8: Design Configuration

## Step 11: Explore the Makefile Configuration

The Makefile contains configuration paths for different technology libraries and design implementations.

Example configuration entries include:

```text
DESIGN_CONFIG=./designs/gf12/aes/config.mk
DESIGN_CONFIG=./designs/sky130hd/aes/config.mk
DESIGN_CONFIG=./designs/scl180/fs120/config.mk
```

### Purpose of the Configuration

The configuration files are used to:

- Select the target design
- Define technology parameters
- Specify design configuration files
- Automate the RTL-to-GDS flow
- Control different physical design stages

<img width="1536" height="691" alt="WhatsApp Image 2026-08-31 at 12 50 55 AM (2)" src="https://github.com/user-attachments/assets/0520f858-34c8-4b8a-8a4d-798de9f73535" />

---

# Part 9: Final GDS Layout Visualization

## Step 12: View the Generated GDS Layout

The final physical layout was visualized using KLayout.

KLayout is used to inspect the GDS layout generated after the physical design flow.

The layout contains multiple technology layers representing different physical components of the integrated circuit.

### Physical Layers Include

- Metal layers
- Poly layers
- Diffusion layers
- Well layers
- Contact layers
- Routing layers

The final layout visualization demonstrates the physical implementation result of the RTL-to-GDS flow.

<img width="1536" height="864" alt="WhatsApp Image 2026-08-31 at 12 50 55 AM" src="https://github.com/user-attachments/assets/a106ac83-e7c4-4a8c-adee-1df9b950706e" />

---

# Key Learning Outcomes

Through these hands-on experiments, the following concepts were explored:

- Setting up a RISC-V development environment
- Using GitHub Codespaces
- Compiling C programs for RISC-V
- Understanding executable disassembly
- Executing programs using Spike
- Performing RTL simulation
- Using testbenches for functional verification
- Analyzing waveforms using GTKWave
- Understanding the OpenROAD RTL-to-GDS flow
- Exploring technology and design configuration files
- Understanding Makefile-based automation
- Visualizing final GDS layouts using KLayout

---

# Conclusion

This hands-on work provided practical exposure to multiple stages of digital and VLSI design.

The experiments covered the complete learning path from RISC-V software development and RTL simulation to physical design and GDS layout visualization.

By using open-source tools such as RISC-V GCC, Spike, Icarus Verilog, GTKWave, OpenROAD, and KLayout, practical understanding was gained in:

- Software compilation for RISC-V
- Instruction-level analysis
- RTL functional verification
- Digital waveform analysis
- Physical design automation
- RTL-to-GDS implementation
- Final layout visualization

This workflow demonstrates how different open-source tools can be integrated to understand the broader semiconductor design ecosystem.
