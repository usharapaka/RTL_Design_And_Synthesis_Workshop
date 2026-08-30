# RISC-V, RTL Simulation and OpenROAD RTL-to-GDS Exploration

This repository documents hands-on exploration of open-source tools used in RISC-V development, RTL simulation, waveform analysis, and RTL-to-GDS physical design flows.

The work includes:

- RISC-V development environment setup using GitHub Codespaces
- Compiling and executing a RISC-V C program
- Binary inspection using `objdump`
- RTL simulation using Icarus Verilog
- Waveform analysis using GTKWave
- Exploring the OpenROAD RTL-to-GDS flow

---

# Table of Contents

- [1. RISC-V Development Environment Setup](#1-risc-v-development-environment-setup)
- [2. Creating and Exploring the Codespace](#2-creating-and-exploring-the-codespace)
- [3. RISC-V Program Compilation](#3-risc-v-program-compilation)
- [4. Binary Inspection Using objdump](#4-binary-inspection-using-objdump)
- [5. Program Execution Using Spike](#5-program-execution-using-spike)
- [6. RTL Simulation Using Icarus Verilog](#6-rtl-simulation-using-icarus-verilog)
- [7. Waveform Analysis Using GTKWave](#7-waveform-analysis-using-gtkwave)
- [8. OpenROAD RTL-to-GDS Flow Exploration](#8-openroad-rtl-to-gds-flow-exploration)
- [9. Key Learnings](#9-key-learnings)
- [10. Tools Used](#10-tools-used)
- [11. Conclusion](#11-conclusion)

---

# 1. RISC-V Development Environment Setup

The RISC-V development environment was set up using GitHub Codespaces. This provides a cloud-based development environment where the required tools can be accessed without manually installing the complete toolchain on a local system.

The repository contains sample programs and instructions for compiling and executing programs using the RISC-V toolchain.

<img width="1536" height="691" alt="WhatsApp Image 2026-08-30 at 11 16 20 PM" src="https://github.com/user-attachments/assets/cc340fe7-ac40-438c-ade1-973a68a400c7" />

---

# 2. Creating and Exploring the Codespace

After creating the Codespace, the repository was opened in the browser-based VS Code environment.

The repository README provides instructions for setting up the environment and running RISC-V programs.

The general setup process includes:

1. Opening the repository.
2. Creating a GitHub Codespace.
3. Waiting for the environment to initialize.
4. Accessing the terminal.
5. Exploring the available sample files.

![Getting Started with RISC-V](images/02_getting_started_riscv.jpg)

## Sample Files

The `samples` directory contains example programs and supporting files.

The files explored include:

- `sum1ton.c`
- `sum1ton.o`
- `sum1ton_custom.c`
- `Makefile`
- `load.S`

The `sum1ton.c` file was used as the example program for compilation and execution.

![Sample Files and Initial Compilation](images/03_riscv_sample_files.jpg)

---

# 3. RISC-V Program Compilation

An initial compilation attempt resulted in an error because the input and output files were incorrectly specified.

This highlighted the importance of using the correct RISC-V cross-compiler and command syntax.

The program was then compiled using the RISC-V cross-compiler.

```bash
riscv64-unknown-elf-gcc -o sum1ton.o sum1ton.c
```

### Command Description

| Component | Description |
|---|---|
| `riscv64-unknown-elf-gcc` | RISC-V cross-compiler |
| `-o` | Specifies the output file |
| `sum1ton.o` | Generated output file |
| `sum1ton.c` | Input C source program |

The successful compilation generates a RISC-V compatible executable from the C source program.

<img width="1536" height="691" alt="WhatsApp Image 2026-08-30 at 11 16 21 PM" src="https://github.com/user-attachments/assets/dcc5c8a5-f725-4121-be37-1bbfacf20a4e" />

---

# 4. Binary Inspection Using objdump

After compilation, the generated binary was inspected using the `objdump` utility.

```bash
objdump -d sum1ton.o
```

The `-d` option disassembles the binary and displays the corresponding low-level instructions.

This step helps in understanding how the compiled program is represented at the instruction level.

<img width="1536" height="691" alt="WhatsApp Image 2026-08-30 at 11 16 21 PM (1)" src="https://github.com/user-attachments/assets/c32dbfd0-e07c-4a15-9f84-3ef26995f58d" />

---

# 5. Program Execution Using Spike

The compiled RISC-V program was executed using the Spike RISC-V simulator.

```bash
spike pk sum1ton.o
```

The program executed successfully and produced the expected output:

```text
Sum from 1 to 9 is 45
```

This confirms that the C program was successfully compiled for the RISC-V architecture and executed correctly in the simulation environment.

<img width="1536" height="691" alt="WhatsApp Image 2026-08-30 at 11 16 23 PM" src="https://github.com/user-attachments/assets/59ecdfaf-bff7-4a5a-8388-667e6deb2823" />

## RISC-V Execution Flow

```text
C Source Code
      ↓
RISC-V Cross Compilation
      ↓
RISC-V Executable
      ↓
Binary Inspection
      ↓
Spike Simulation
      ↓
Program Output
```

---

# 6. RTL Simulation Using Icarus Verilog

The next part of the work focused on RTL simulation using Icarus Verilog.

The Verilog design and its corresponding testbench were compiled using the following command:

```bash
iverilog -o gmux verilog_files/good_mux.v verilog_files/tb_good_mux.v
```

### Command Description

| Component | Description |
|---|---|
| `iverilog` | Verilog compiler |
| `-o gmux` | Specifies the simulation output |
| `good_mux.v` | RTL design file |
| `tb_good_mux.v` | Testbench file |

The simulation was successfully compiled and generated the waveform data required for functional verification.

<img width="1536" height="691" alt="WhatsApp Image 2026-08-30 at 11 16 22 PM" src="https://github.com/user-attachments/assets/98da1075-3677-4247-9c2c-3ae0d2b6d136" />

---

# 7. Waveform Analysis Using GTKWave

After simulation, the generated waveform file was opened using GTKWave.

GTKWave is used to visualize and analyze digital signal transitions during simulation.

The waveform displays the following signals:

- `i0`
- `i1`
- `sel`
- `y`

The signal transitions can be observed over time to verify the functional behavior of the design.

<img width="1408" height="460" alt="WhatsApp Image 2026-08-30 at 11 28 05 PM" src="https://github.com/user-attachments/assets/d0f26a85-419f-4c9e-bdc6-ef122f14e7cc" />

## Observation

The waveform demonstrates the relationship between the input signals, select signal, and output signal.

The output changes according to the selected input, confirming the expected functionality of the RTL design.

---

# 8. OpenROAD RTL-to-GDS Flow Exploration

The OpenROAD RTL-to-GDS flow was explored using the SCL180 technology platform.

The repository provides a complete environment for exploring the physical design flow and contains scripts, configurations, and supporting files required for the RTL-to-GDS process.

<img width="1536" height="691" alt="WhatsApp Image 2026-08-30 at 11 16 20 PM (1)" src="https://github.com/user-attachments/assets/ba898b66-570d-422d-a339-0e3dc585f0a2" />

## Repository Structure

The OpenROAD repository contains several directories and files used to organize the complete flow.

Important directories include:

```text
.devcontainer/
images/
orfs/
designs/
scripts/
tools/
```

Important files include:

```text
Makefile
Dockerfile
README.md
```

Each component has a specific role in supporting the design and implementation flow.

<img width="1536" height="691" alt="WhatsApp Image 2026-08-30 at 11 16 23 PM" src="https://github.com/user-attachments/assets/03e1d3cb-ea62-46f6-925f-7799e754fbd6" />

## Design Configuration

The Makefile was explored to understand how different technology platforms and design configurations are defined.

The configuration files specify parameters required for different stages of the physical design flow.

These configurations help organize the flow according to the selected technology and design.

![OpenROAD Design Configuration](images/11_openroad_configuration.jpg)

---

## Final Layout Visualization

After completing the physical design flow, the generated GDS file was opened using **KLayout** for final layout verification.

The screenshot below shows the final chip layout with multiple SKY130 technology layers visible.

### Final GDS Layout

<img width="1600" height="720" alt="WhatsApp Image 2026-08-30 at 11 25 18 PM" src="https://github.com/user-attachments/assets/24be5188-de64-436e-b803-cf7f807f0f59" />

**Observation:**
- The final GDS layout was successfully generated.
- The design was visualized using KLayout.
- Multiple SKY130 layers are visible in the layout.
- This confirms the successful completion of the physical design flow up to the final layout stage.

# 9. Overall Workflow

```text
                 ┌───────────────────────┐
                 │ GitHub Codespaces     │
                 │ Development Setup     │
                 └───────────┬───────────┘
                             │
                             ▼
                 ┌───────────────────────┐
                 │ RISC-V Sample Program │
                 └───────────┬───────────┘
                             │
                             ▼
                 ┌───────────────────────┐
                 │ RISC-V Cross Compiler │
                 └───────────┬───────────┘
                             │
                             ▼
                 ┌───────────────────────┐
                 │ Binary Inspection     │
                 │ using objdump         │
                 └───────────┬───────────┘
                             │
                             ▼
                 ┌───────────────────────┐
                 │ Spike Simulation      │
                 └───────────┬───────────┘
                             │
                             ▼
                 ┌───────────────────────┐
                 │ RTL Simulation        │
                 │ using Icarus Verilog  │
                 └───────────┬───────────┘
                             │
                             ▼
                 ┌───────────────────────┐
                 │ GTKWave Analysis      │
                 └───────────┬───────────┘
                             │
                             ▼
                 ┌───────────────────────┐
                 │ OpenROAD Exploration  │
                 │ RTL-to-GDS Flow       │
                 └───────────────────────┘
```

---

# 10. Key Learnings

Through this hands-on exploration, the following concepts were learned:

- Setting up a cloud-based development environment using GitHub Codespaces.
- Exploring a RISC-V development repository.
- Understanding RISC-V cross-compilation.
- Compiling C programs for the RISC-V architecture.
- Inspecting compiled binaries using `objdump`.
- Understanding instruction-level program representation.
- Executing RISC-V programs using Spike.
- Using Icarus Verilog for RTL compilation and simulation.
- Understanding the relationship between RTL design and testbench.
- Analyzing simulation waveforms using GTKWave.
- Exploring the OpenROAD RTL-to-GDS flow.
- Understanding repository organization for physical design flows.
- Exploring technology-specific design configurations.

---

# 11. Conclusion

This hands-on exploration provided practical exposure to different stages of computer architecture and VLSI design workflows.

The RISC-V section demonstrated the complete flow from a C source program to RISC-V cross-compilation, binary inspection, and execution using the Spike simulator.

The RTL simulation section demonstrated the use of Icarus Verilog for compiling a Verilog design and testbench, followed by functional waveform analysis using GTKWave.

Finally, the OpenROAD exploration provided an understanding of the repository structure and configuration organization used in an RTL-to-GDS physical design flow.

Overall, this work helped build practical familiarity with open-source tools used in RISC-V development, RTL verification, waveform analysis, and VLSI physical design.
