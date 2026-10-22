# Design and Physical Implementation of a Sequential Lithium-Ion Battery Safety Controller for E-Waste Collection Systems

![Technology](https://img.shields.io/badge/Technology-SKY130%20HD-blue)
![Design](https://img.shields.io/badge/Design-RTL%20to%20GDSII-green)
![Verification](https://img.shields.io/badge/DRC-0%20Violations-brightgreen)
![LVS](https://img.shields.io/badge/LVS-0%20Errors-brightgreen)
![STA](https://img.shields.io/badge/STA-16%20PVT%20Corners-orange)

## 1. Project Overview

Lithium-ion batteries are widely used in electronic devices, electric vehicles, and portable energy storage systems. However, damaged, overheated, or electrically faulty batteries can create safety risks during handling, transportation, storage, and electronic-waste (e-waste) collection.

This project presents the **RTL design, synthesis, physical implementation, and timing verification of a Sequential Lithium-Ion Battery Safety Controller** using Verilog HDL and an open-source ASIC implementation flow.

The controller monitors battery presence, temperature faults, voltage faults, and physical damage indications. Based on these inputs, a finite-state machine (FSM) moves through different safety states and generates control signals for warning, isolation, and alert indication.

The design is implemented using the **SkyWater SKY130 HD standard-cell library** through an OpenLane-based RTL-to-GDSII flow. Static Timing Analysis (STA) is also evaluated across 16 process-voltage-temperature (PVT) corners.

## 2. Problem Statement

Lithium-ion batteries entering e-waste collection systems may have faults that require prompt detection and safe handling. A hardware controller can provide deterministic state-based responses to fault signals.

The main problem addressed by this project is the design and implementation of a sequential digital controller that:

- Monitors battery presence and fault indications.
- Tracks persistent fault conditions using a counter.
- Progresses through defined safety states.
- Generates warning and isolation-related outputs.
- Can be synthesized and physically implemented as an ASIC design.
- Can be evaluated for timing and physical-design rule compliance.

## 3. Project Objectives

1. Develop a synthesizable Verilog RTL module for battery safety control.
2. Implement a finite-state machine with four operating states.
3. Combine temperature, voltage, and physical-damage fault indications.
4. Use a parameterized threshold for fault-state progression.
5. Verify the design through RTL simulation.
6. Synthesize the RTL into SKY130 HD standard cells.
7. Complete floorplanning, placement, clock-tree synthesis, routing, and GDSII generation.
8. Evaluate setup and hold timing across 16 PVT corners.
9. Review final physical verification results, including Design Rule Checking (DRC) and Layout Versus Schematic (LVS).

## 4. System Architecture

The following functional block diagram illustrates the controller's inputs,
fault-detection logic, sequential control, fault counter, and safety outputs.

<img width="1672" height="940" alt="Sequential Lithium-Ion Safety Controller Diagram" src="https://github.com/user-attachments/assets/f6883f24-d5bd-4a5e-8e1b-5670dde08ae4" />

1. **Input Signals:** The controller receives battery presence, temperature fault,
   voltage fault, damage detection, clock, and reset signals.
2. **Fault Detection:** The fault logic combines temperature, voltage, and damage
   signals using OR logic.
3. **Fault Counter:** A 4-bit counter tracks persistent faults using a configurable
   threshold.
4. **Finite State Machine:** The controller uses SAFE, MONITORING, WARNING, and
   ISOLATE states to manage the safety response.
5. **Output Signals:** The controller generates `safe`, `warning`, `isolate`,
   and `alert` outputs.
   
### 4.1 Input Signals

| Signal | Description |
|---|---|
| `clk` | Clock input for sequential state updates |
| `reset` | Active-high asynchronous reset |
| `battery_present` | Indicates whether a battery is present |
| `temp_fault` | Temperature fault indication from an external monitor |
| `voltage_fault` | Voltage fault indication from an external monitor |
| `damage_detected` | Indicates detected physical damage |

### 4.2 Output Signals

| Signal | Description |
|---|---|
| `safe` | Asserted in the SAFE and MONITORING states |
| `warning` | Asserted in the WARNING state |
| `isolate` | Asserted in the ISOLATE state |
| `alert` | Asserted in the ISOLATE state |

### 4.3 Functional Block Diagram

The following diagram summarizes the major functional blocks. Keep the image at the specified path in the repository.

<img width="1911" height="1135" alt="Screenshot 2026-10-21 121001" src="https://github.com/user-attachments/assets/63828207-ece5-4e6a-a65b-16c854925a30" />

The fault inputs are combined using OR logic. The sequential controller evaluates the combined fault indication and battery-presence signal, updates the FSM state and fault counter, and produces the corresponding output signals.

## 5. Finite-State Machine (FSM)

The design uses a four-state FSM with two-bit state encoding.

| State | Encoding | Function |
|---|---|---|
| SAFE | `2'b00` | Default safe-state behavior |
| MONITORING | `2'b01` | Evaluates persistent fault conditions |
| WARNING | `2'b10` | Indicates a warning condition |
| ISOLATE | `2'b11` | Asserts isolation and alert outputs |

### 5.1 State Operation

**SAFE**
- The fault counter is cleared.
- If a battery is present and at least one fault input is active, the controller transitions to MONITORING.

**MONITORING**
- The controller checks whether the battery remains present and a fault remains active.
- If the battery is removed or the combined fault indication clears, the controller returns to SAFE and clears the counter.
- If the counter reaches the configured threshold condition, the controller transitions to WARNING.

**WARNING**
- The controller continues evaluating the battery-presence and fault signals.
- If the battery is removed or the fault indication clears, it returns to SAFE.
- Otherwise, it can transition to ISOLATE when the counter condition is satisfied.

**ISOLATE**
- The `isolate` and `alert` outputs are asserted.
- The controller returns to SAFE when the battery is absent or the combined fault indication clears.

The exact cycle-by-cycle transition behavior depends on the RTL's nonblocking assignments and counter conditions. The supplied RTL and simulation waveform should be used when documenting exact transition cycles.

## 6. Fault Detection and Counter Logic

The combined fault signal is defined as:

```verilog
wire fault_detected = temp_fault |
                      voltage_fault |
                      damage_detected;
```

Therefore, `fault_detected` becomes high when any one of the three fault inputs is high.

The controller uses a parameterized threshold:

```verilog
parameter FAULT_THRESHOLD = 3;
```

A four-bit counter tracks fault progression in the MONITORING and WARNING states. The default threshold is 3, but it can be changed through parameter override during module instantiation.

The counter is not a substitute for analog battery sensing. It processes the digital fault indications supplied to the controller.

## 7. Hardware and Software Tools

| Tool / Technology | Purpose |
|---|---|
| Verilog HDL | RTL description |
| Icarus Verilog | RTL compilation and simulation |
| GTKWave | Waveform inspection |
| Yosys | Logic synthesis and synthesis statistics |
| OpenLane | Automated RTL-to-GDSII implementation flow |
| OpenROAD | Physical-design implementation and timing-related stages |
| SKY130 HD PDK | Standard-cell technology library and physical-design rules |
| OpenSTA / timing-analysis flow | Static timing analysis |
| Magic | Layout inspection and physical verification |
| Netgen / LVS flow | Layout-versus-schematic comparison |
| KLayout | Layout viewing and inspection |
| Graphviz | Functional and synthesis diagram generation |
| Git and GitHub | Version control and project documentation |

## 8. Complete RTL-to-GDSII Implementation Flow

The project follows a standard digital ASIC implementation sequence:

```text
Verilog RTL
    |
    v
RTL Simulation
    |
    v
Logic Synthesis
    |
    v
Floorplanning
    |
    v
Placement
    |
    v
Clock-Tree Synthesis
    |
    v
Global and Detailed Routing
    |
    v
Parasitic Extraction and Timing Analysis
    |
    v
Physical Verification
    |
    v
GDSII Layout
```

## 8.1 RTL Design

The controller is described in Verilog HDL using:
- A two-bit state register.
- A four-bit fault counter.
- Combinational fault-detection logic.
- Sequential state-transition logic.
- Combinational output decoding.

The asynchronous reset is active-high and initializes the state to SAFE and the counter to zero.

**RTL source:** `src/battery_safety_controller.v`

## 8.2 RTL Simulation

The testbench applies clock, reset, battery-presence, and fault-input sequences to exercise the controller.

Icarus Verilog is used to compile and run the design, and GTKWave can be used to inspect the generated VCD waveform.

## Simulation

<img width="1600" height="950" alt="WhatsApp Image 2026-10-10 at 12 12 43 AM" src="https://github.com/user-attachments/assets/a7422d58-2aff-496d-9245-0a8789ac16f7" />

Example commands, when run from the source directory:

```bash
iverilog -g2012 -Wall -o battery_sim \
  battery_safety_controller.v \
  battery_safety_controller_tb.v

vvp battery_sim
```
 ## RTL Code 
 
<img width="1600" height="950" alt="WhatsApp Image 2026-10-12 at 2 49 22 PM" src="https://github.com/user-attachments/assets/b4296b72-2c18-4347-89cf-f48083dc9a2c" />
<img width="1600" height="949" alt="WhatsApp Image 2026-10-12 at 2 50 12 PM" src="https://github.com/user-attachments/assets/1b91ab8f-3e59-4217-b453-e79d85f93936" />

## Testbench Code

<img width="1600" height="947" alt="WhatsApp Image 2026-10-12 at 3 25 53 PM (1)" src="https://github.com/user-attachments/assets/765c24c2-821a-4bd5-a8e1-92909d491b77" />
<img width="1600" height="949" alt="WhatsApp Image 2026-10-12 at 3 25 53 PM" src="https://github.com/user-attachments/assets/37f1fda0-e3ce-4435-8ee0-63eae53b0659" />

Open the VCD waveform with GTKWave if the simulation generates `battery_safety_controller.vcd`:

```bash
gtkwave battery_safety_controller.vcd
```
## Waveform 

<img width="1600" height="949" alt="WhatsApp Image 2026-10-10 at 12 24 22 AM" src="https://github.com/user-attachments/assets/1c7fd316-2566-45d4-8aa7-300cc0582cba" />

## 8.3 Logic Synthesis

Yosys converts the RTL into a gate-level representation and maps the logic to standard cells from the SKY130 HD library.

The synthesis report provides information about:
- Logic cells used.
- Flip-flops and combinational cells.
- Wire and bit counts in the synthesized design.
- Synthesis area estimate.

## Synthesized Gate-Level Schematic

<img width="1910" height="1130" alt="Screenshot 2026-10-21 121927" src="https://github.com/user-attachments/assets/beb25b3a-2459-4543-95e0-f7db7c419442" />

The recorded Yosys statistics for this design report **50 cells** and a Yosys-reported module area of **496.7264** in the units used by that synthesis report.

## Synthesis Report

<img width="1600" height="949" alt="WhatsApp Image 2026-10-10 at 12 27 34 AM" src="https://github.com/user-attachments/assets/67ce89a5-fe72-4452-b876-9fa1e0339da7" />

The cell-level schematic represents the synthesized logic network. The functional block diagram is more suitable for understanding the controller architecture at a high level.

## 8.4 Floorplanning

Floorplanning establishes the initial physical layout region and the organization of the design within the chip boundary.

Typical tasks include:
- Defining the core and die areas.
- Establishing placement rows.
- Planning power-distribution structures.
- Preparing the design for standard-cell placement.

##  Floorplaning Core Area

<img width="1600" height="947" alt="WhatsApp Image 2026-10-11 at 11 50 04 PM" src="https://github.com/user-attachments/assets/9e21c754-ce36-4436-a9fb-b6271f3c6d11" />

## Floorplaning Die Area

<img width="1600" height="952" alt="WhatsApp Image 2026-10-11 at 11 51 34 PM" src="https://github.com/user-attachments/assets/ec6533c7-7092-4cad-a4b5-fcfc7b4b5b2a" />

## 8.5 Placement

Placement assigns physical locations to standard cells within the floorplan.

## Placement Layout
<img width="1600" height="947" alt="WhatsApp Image 2026-10-11 at 11 55 42 PM" src="https://github.com/user-attachments/assets/16222b0f-f75a-4e62-aa8a-72ff061d5891" />

The implementation flow places the synthesized cells while considering timing, congestion, and physical constraints. Placement results provide the starting point for clock-tree construction and routing.

## 8.6 Clock-Tree Synthesis (CTS)

Clock-tree synthesis builds the clock distribution network for sequential cells.

## CTS Layout

<img width="1600" height="951" alt="WhatsApp Image 2026-10-11 at 11 58 37 PM" src="https://github.com/user-attachments/assets/a1a5fe67-0939-4938-87d8-5f013253a08f" />

Its purpose is to distribute the clock to the relevant flip-flops while controlling clock insertion delay and skew. The post-CTS design is subsequently evaluated through timing analysis and routing stages.

## 8.7 Routing

Routing creates the physical metal interconnections between standard cells and design ports.

## Routing Layout

<img width="1600" height="953" alt="WhatsApp Image 2026-10-12 at 12 03 13 AM" src="https://github.com/user-attachments/assets/65d7a33b-c0ba-44b1-9e28-c19d89b29922" />

The flow includes global routing and detailed routing. The final routing stage must be evaluated using the corresponding reports rather than assuming that successful placement alone means the design is complete.

## 8.8 Parasitic Extraction and Static Timing Analysis

After physical implementation, timing analysis evaluates signal paths using timing constraints and cell/interconnect timing information.

The analysis considers:
- Clock period and clock definition.
- Input and output delays.
- Setup timing.
- Hold timing.
- Clock and data path delays.
- Process, voltage, and temperature variations.

The project includes a separate 16-corner STA evaluation.

## 9. SDC Timing Constraints

The project uses an SDC (Synopsys Design Constraints) file to define the clock and external timing assumptions.

The provided constraints include:

```tcl
create_clock -name clk -period 20 [get_ports clk]

set_input_delay 4 -clock clk \
  [get_ports {reset battery_present temp_fault voltage_fault damage_detected}]

set_output_delay 4 -clock clk [all_outputs]

set_driving_cell -lib_cell sky130_fd_sc_hd__inv_8 -pin Y [all_inputs]

set_load 0.01765 [all_outputs]
```
<img width="1600" height="948" alt="WhatsApp Image 2026-10-12 at 1 09 16 AM" src="https://github.com/user-attachments/assets/1dc9e32c-0ef4-495d-ac25-01e8b159570e" />

### Constraint Explanation

| Constraint | Meaning |
|---|---|
| `create_clock` | Defines a clock with a 20 ns period |
| `set_input_delay` | Models an external input delay of 4 ns relative to the clock |
| `set_output_delay` | Applies a 4 ns output-delay requirement relative to the clock |
| `set_driving_cell` | Models the external input driver |
| `set_load` | Models the load applied to output ports |

The 20 ns clock period corresponds to a nominal clock frequency 
These constraints represent the assumptions used for timing evaluation; they do not by themselves establish that the design meets every possible real-world interface requirement.

## 10. 16-Corner Static Timing Analysis (STA)

## 10.1 Why Multi-Corner STA Is Important

Standard-cell delay varies with process conditions, supply voltage, and temperature. Static Timing Analysis across PVT corners evaluates whether the design's timing behavior remains acceptable under different library conditions.

This project evaluates 16 PVT corners, including fast-fast (FF), typical-typical (TT), and slow-slow (SS) conditions.

## FF Cornner result 
<img width="1600" height="951" alt="WhatsApp Image 2026-10-10 at 2 32 16 PM" src="https://github.com/user-attachments/assets/ae983c07-fb3d-4059-9a45-ad14e7865975" />

## TT Cornner result
<img width="1600" height="948" alt="WhatsApp Image 2026-10-10 at 2 33 18 PM" src="https://github.com/user-attachments/assets/a6307de2-a6b5-4658-9099-444179506166" />

## SS Cornner result
<img width="1600" height="952" alt="WhatsApp Image 2026-10-10 at 2 30 56 PM" src="https://github.com/user-attachments/assets/14f9478a-8d66-4003-a5ab-14367d819e46" />

# STA 16 Conners Results
<img width="1600" height="557" alt="WhatsApp Image 2026-10-12 at 12 32 18 AM" src="https://github.com/user-attachments/assets/2c5c5745-f2f6-431e-a39d-4d9f1a374d77" />

## 10.2 Setup Slack Results

The supplied 16-corner setup-slack plot reports the following range:

- **Minimum setup slack:** 5.79 ns
- **Maximum setup slack:** 15.29 ns

All 16 setup-slack values shown in the supplied plot are positive.

Positive setup slack means the reported setup checks have timing margin under the specific constraints and models used for that analysis.

## 10.3 Hold Slack Results

The supplied 16-corner hold-slack plot reports:

- **Minimum hold slack:** 0.32 ns
- **Maximum hold slack:** 2.77 ns

All 16 hold-slack values shown in the supplied plot are positive.

Positive hold slack means the reported hold checks have margin under the corresponding analysis conditions.

## 10.4 Timing Reports

<img width="1600" height="951" alt="WhatsApp Image 2026-10-09 at 11 29 55 PM (3)" src="https://github.com/user-attachments/assets/a0fae47e-32ce-4fa6-bdbf-e7d6efd30e39" />

<img width="1600" height="947" alt="WhatsApp Image 2026-10-09 at 11 29 55 PM (1)" src="https://github.com/user-attachments/assets/f3470d66-896c-42ce-bc59-519ff3e4b83a" />

<img width="1600" height="949" alt="WhatsApp Image 2026-10-09 at 11 29 55 PM (2)" src="https://github.com/user-attachments/assets/c9e81ba0-9a1b-4fc0-85fd-f3a737bc6322" />

<img width="1600" height="958" alt="WhatsApp Image 2026-10-09 at 11 29 55 PM" src="https://github.com/user-attachments/assets/f1cf7577-240d-4cda-a490-0befefd384b3" />

## 10.5 Timing Graphs

Include the actual generated plots in the repository and link them below. Use these filenames if you save the corresponding images under `documentation/sta/`.

## Setup slack across 16 PVT corners

<img width="1600" height="944" alt="WhatsApp Image 2026-10-12 at 12 54 42 AM" src="https://github.com/user-attachments/assets/9f729563-477c-4f76-9c54-f784b6a50b93" />

## Hold slack across 16 PVT corners

<img width="1600" height="951" alt="WhatsApp Image 2026-10-12 at 12 55 12 AM" src="https://github.com/user-attachments/assets/3f783f8c-5d1a-446a-a2cb-c792c4bf0975" />

## Setup and hold slack comparison

<img width="1917" height="1137" alt="Screenshot 2026-10-12 005924" src="https://github.com/user-attachments/assets/e8151abd-c558-4e2d-abbf-1ce1de83f52f" />

## 10.6 Interpretation
ZAW
The supplied plots show positive setup and hold slack for all 16 evaluated corners. The smallest displayed margins occur at the slow-slow, low-voltage, low-temperature corner labeled `SS -40C 1.28V`:

- Setup slack: 5.79 ns
- Hold slack: 2.77 ns

These values are results for the provided timing setup and reported checks. A complete timing sign-off should also review the underlying reports, all relevant path groups, unconstrained paths, clock definitions, and any warnings from the STA tool.

## 11. Physical Verification: DRC and LVS

## 11.1 Design Rule Checking (DRC)

Design Rule Checking verifies the layout against the physical design rules defined by the technology and verification deck.

The final OpenLane/Magic report in the supplied evidence states:

```text
Magic DRC Summary
Total Magic DRC violations is 0
```
<img width="1600" height="951" alt="WhatsApp Image 2026-10-12 at 1 16 08 AM" src="https://github.com/user-attachments/assets/f6613ea5-7151-47cd-9a89-ada0694ea960" />

**Result: 0 Magic DRC violations reported.**

This result applies to the specific final layout and verification deck used in the recorded run.

## 11.2 Layout Versus Schematic (LVS)

LVS compares the extracted layout connectivity and devices against the reference netlist.

The final run reports:

```text
LVS Summary
LVS reports no net, device, pin, or property mismatches.
Total errors = 0
```
<img width="1600" height="948" alt="WhatsApp Image 2026-10-12 at 1 29 13 AM" src="https://github.com/user-attachments/assets/518d7bce-d918-4437-8aa6-d8209f387fb0" />

<img width="1600" height="953" alt="WhatsApp Image 2026-10-12 at 1 29 13 AM (1)" src="https://github.com/user-attachments/assets/dc8b2818-e543-488c-b249-4de2f20995a6" />

**Result: 0 LVS errors reported.**

This indicates that the reported LVS comparison found no net, device, pin, or property mismatches.

## 11.3 Verification Scope

DRC and LVS are separate checks:
- DRC evaluates layout geometry against design rules.
- LVS evaluates layout-to-netlist correspondence.
- STA evaluates timing under the specified constraints and analysis conditions.

Passing one category does not automatically prove that every other category has passed.

## 12. Final Physical Layout and GDSII

The final GDSII database contains the physical layout generated by the implementation flow. KLayout and Magic can be used to inspect the layout.

Add a screenshot of the final routed layout at:

`documentation/layout/final_layout.png`

## Final GDS Layout

<img width="1600" height="951" alt="WhatsApp Image 2026-10-12 at 12 09 23 AM" src="https://github.com/user-attachments/assets/1abd5415-4781-4eca-8c1f-d3dcb5d6473d" />

## 13. Repository Structure

A clear repository structure helps reviewers find the RTL, simulation, implementation evidence, and reports.

```text
battery-safety-controller/
├── README.md
├── src/
│   ├── battery_safety_controller.v
│   ├── battery_safety_controller_tb.v
│   └── battery_safety_controller.vcd
├── documentation/
│   ├── synthesis/
│   │   ├── README.md
│   │   ├── 1-yosys.log
│   │   ├── 1-yosys_4.stat.rpt
│   │   ├── battery_safety_controller.synthesis.v
│   │   ├── battery_safety_controller_schematic.png
│   │   ├── battery_safety_controller_schematic.svg
│   │   └── battery_safety_controller_block_diagram.png
│   ├── sta/
│   │   ├── README.md
│   │   ├── setup_slack_16_corners.png
│   │   ├── hold_slack_16_corners.png
│   │   └── setup_hold_slack_comparison.png
│   ├── layout/
│   │   ├── README.md
│   │   └── final_layout.png
│   └── physical_verification/
│       └── README.md
└── .gitignore
```

## 14. Final Results Summary

| Item | Reported result |
|---|---|
| RTL design | Verilog sequential controller |
| FSM | 4 states |
| Default fault threshold | 3 |
| Clock period in SDC | 20 ns |
| Nominal clock frequency | 50 MHz |
| Synthesis cell count | 50 cells in the recorded Yosys statistics |
| Yosys synthesis area | 496.7264 in the report's area units |
| STA corners | 16 |
| Minimum setup slack in supplied plot | 5.79 ns |
| Maximum setup slack in supplied plot | 15.29 ns |
| Minimum hold slack in supplied plot | 0.32 ns |
| Maximum hold slack in supplied plot | 2.77 ns |
| Magic DRC | 0 violations reported |
| LVS | 0 errors reported |

## 15. Conclusion

This project demonstrates the implementation of a sequential battery safety controller from Verilog RTL through synthesis and physical ASIC implementation using an open-source tool flow and the SKY130 HD technology library.

The design includes a four-state FSM, combined fault detection, a configurable fault threshold, and safety-related output signals. The supplied evidence reports positive setup and hold slack across the 16 evaluated PVT corners, zero Magic DRC violations, and zero LVS errors.

The project brings together RTL design, simulation, logic synthesis, physical implementation, timing analysis, and layout verification in a single documented hardware-design workflow.

**Project:** Design and Physical Implementation of a Sequential Lithium-Ion Battery Safety Controller for E-Waste Collection Systems  
**HDL:** Verilog  
**Technology:** SKY130 HD  
**Implementation flow:** OpenLane / OpenROAD  
**Verification:** RTL simulation, multi-corner STA, Magic DRC, and LVS

##  Final Project Video

**Project Title:** Design and Physical Implementation of a Sequential Lithium-Ion Battery Safety Controller for E-Waste Collection Systems

[ Watch the Final Project Video](https://drive.google.com/file/d/1W8lPGMB56Bty3wNoag1tFB9unA-a7V8x/view?usp=sharing)

