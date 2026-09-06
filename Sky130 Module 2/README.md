# Sky130 Module 2 - Good Floorplan vs Bad Floorplan and Introduction to Library Cells

## Overview

This module introduces the fundamentals of ASIC floorplanning, placement, library cells, cell characterization, and timing characterization.

The module covers floorplan quality, utilization factor, aspect ratio, pre-placed cells, decoupling capacitors, power planning, pin placement, placement blockages, OpenLANE floorplanning, Magic layout viewing, netlist binding, placement optimization, standard-cell libraries, congestion-aware placement, cell design, and timing characterization.

---

# PART 1 - CHIP FLOORPLANNING CONSIDERATIONS

# 1. SKY130_D2_SK1 - Chip Floorplanning Considerations

## Objective

To understand the important considerations involved in creating a good ASIC floorplan.

## Introduction

Floorplanning is one of the initial stages of physical design. It determines the physical organization of the chip before placement and routing.

A good floorplan is important because it directly affects:

* Area
* Timing
* Power
* Routing congestion
* Signal integrity
* Overall chip performance

## Important Floorplanning Considerations

The major factors considered during floorplanning include:

* Core utilization
* Aspect ratio
* Placement of pre-placed cells
* Power distribution
* Pin placement
* Routing resources
* Placement blockages
* Standard-cell placement

## Good Floorplan

A good floorplan provides:

* Proper utilization of available area
* Sufficient routing resources
* Efficient power distribution
* Reduced congestion
* Better timing
* Proper placement of macros and I/O pins

## Bad Floorplan

A poor floorplan may result in:

* High routing congestion
* Long interconnects
* Timing violations
* Difficult power distribution
* Increased area
* Routing failures

## Key Learning

Floorplanning should be performed carefully because decisions made at this stage influence the placement, routing, timing, power, and final quality of the chip.

---

# 2. SKY_L1 - Utilization Factor and Aspect Ratio

## Objective

To understand utilization factor and aspect ratio and their importance in floorplanning.

## Utilization Factor

The utilization factor represents the percentage of the core area occupied by the placed standard cells.

It can be expressed as:

```text
Utilization Factor = Area occupied by cells / Total core area
```

For percentage:

```text
Utilization (%) = (Cell Area / Core Area) × 100
```

Higher utilization means more cells are packed into the available core area.

However, very high utilization can reduce the available space for routing and may increase congestion.

## Aspect Ratio

Aspect ratio represents the relationship between the height and width of the core.

```text
Aspect Ratio = Height / Width
```

An aspect ratio of 1 represents a square-shaped core.

## Importance

Proper selection of utilization and aspect ratio helps achieve:

* Efficient area utilization
* Better routing
* Reduced congestion
* Proper placement
* Better overall floorplan quality

## Key Learning

Utilization factor determines how much of the core area is occupied, while aspect ratio determines the shape of the core.

## Screenshot
### Figure 1:

<img width="662" height="486" alt="Screenshot 2026-09-06 105619" src="https://github.com/user-attachments/assets/d33692c5-7dd5-4205-a6eb-bf579837bc78" />

### Figure 2:

<img width="808" height="487" alt="Screenshot 2026-09-06 111152" src="https://github.com/user-attachments/assets/caab2008-077e-4948-84d9-31f3465e8d3f" />

---

# 3. SKY_L2 - Concept of Pre-Placed Cells

## Objective

To understand the concept and importance of pre-placed cells in physical design.

## Introduction

Some cells or blocks need to be placed at fixed locations before standard-cell placement begins. These are called pre-placed cells.

Examples include:

* Memory blocks
* Analog blocks
* IP blocks
* Large macros
* Interface blocks

## Importance of Pre-Placed Cells

Pre-placed cells help:

* Maintain fixed locations for important blocks
* Reduce routing complexity
* Provide predictable connectivity
* Reserve required physical regions
* Improve overall floorplan organization

## Placement

Pre-placed blocks are positioned during floorplanning and are not moved by the normal standard-cell placement process.

```text
Floorplan
   |
   +-- Pre-placed Macro
   |
   +-- Pre-placed IP
   |
   +-- Standard-cell Region
```

## Key Learning

Pre-placed cells and macros must be carefully positioned because their locations affect routing, congestion, timing, and power planning.

## Screenshot
### Figure 1:

<img width="666" height="487" alt="Screenshot 2026-09-06 111231" src="https://github.com/user-attachments/assets/4edfa80d-9a2c-43ad-87a6-71cb883efb57" />

### Figure 2:

<img width="718" height="487" alt="Screenshot 2026-09-06 111257" src="https://github.com/user-attachments/assets/c7dd120a-666c-4c8a-b0b7-53350ac136c5" />

---

# 4. SKY_L3 - De-coupling Capacitors

## Objective

To understand the purpose of decoupling capacitors in an ASIC power network.

## Introduction

A decoupling capacitor, commonly called a **decap**, is used to provide a local source of charge to the circuit when there are sudden changes in current demand.

During switching activity, a circuit may require a sudden amount of current. The power supply network may not respond instantaneously to this demand.

Decoupling capacitors help reduce local voltage fluctuations.

## Working

```text
Power Supply
     |
     +------ Circuit
     |
   Decap
     |
    GND
```

When the circuit requires additional current for a short period, the decap can supply charge locally.

## Benefits

Decoupling capacitors help:

* Reduce supply voltage fluctuations
* Improve power integrity
* Provide local charge
* Reduce the effect of transient current demand
* Improve stability of the power network

## Key Learning

Decoupling capacitors are important for maintaining a stable local power supply, especially during switching activity.

## Screenshot
### Figure 1:

<img width="865" height="477" alt="Screenshot 2026-09-06 111353" src="https://github.com/user-attachments/assets/526fa50d-b822-414a-ab25-a4ab0725142b" />

---

# 5. SKY_L4 - Power Planning

## Objective

To understand the importance of power planning in ASIC physical design.

## Introduction

Power planning creates the power distribution network required to deliver power and ground to all cells in the chip.

The power network distributes:

* VDD
* VSS / Ground

through the chip.

## Power Distribution

A typical power distribution network may contain:

```text
Power Pads
    |
    v
Power Rings
    |
    v
Power Straps
    |
    v
Standard Cell Rails
    |
    v
Cells
```

## Importance of Power Planning

Proper power planning helps:

* Reduce voltage drop
* Reduce power integrity problems
* Provide stable power
* Reduce ground bounce
* Support reliable operation of standard cells

## Key Learning

Power planning is essential for providing stable and reliable power to every part of the chip.

## Screenshot
### Figure 1:

<img width="665" height="490" alt="Screenshot 2026-09-06 111712" src="https://github.com/user-attachments/assets/487cf9d8-15cd-4f66-b389-c74230e64885" />

---

# 6. SKY_L5 - Pin Placement and Logical Cell Placement Blockage

## Objective

To understand I/O pin placement and placement blockages in floorplanning.

## Pin Placement

Input and output pins provide connections between the internal chip logic and the external environment.

Proper pin placement helps reduce:

* Wire length
* Routing congestion
* Timing problems

Pins should be positioned considering their connectivity with internal logic.

## Logical Cell Placement Blockage

A placement blockage prevents standard cells from being placed in a particular physical region.

Blockages may be used to:

* Reserve space
* Protect routing regions
* Prevent congestion
* Maintain space around macros
* Improve placement quality

## Example

```text
+---------------------------+
|        I/O Pins           |
|                           |
|  +-------+   +-------+    |
|  | Macro |   | Macro |    |
|  +-------+   +-------+    |
|                           |
|   Standard Cell Region    |
|                           |
+---------------------------+
```

## Key Learning

Correct pin placement and suitable placement blockages help improve routing, timing, and overall floorplan quality.

## Screenshot

### Figure 1:

<img width="830" height="480" alt="Screenshot 2026-09-06 111647" src="https://github.com/user-attachments/assets/b170939b-2ea7-4c18-92b5-378643d462b2" />


### Figure 2:

<img width="678" height="482" alt="Screenshot 2026-09-06 111950" src="https://github.com/user-attachments/assets/07b02ac5-4c1f-47d5-a18e-1b795657a54d" />

### Figure 3:
<img width="586" height="495" alt="Screenshot 2026-09-06 112011" src="https://github.com/user-attachments/assets/a334898f-376d-4df3-9498-14fb73261f05" />

---

# 7. SKY_L6 - Steps to Run Floorplan Using OpenLANE

## Objective

To understand the steps required to run the floorplanning stage using OpenLANE.

## Procedure

### Step 1 - Prepare the Design

Ensure that the required RTL files, configuration files, libraries, and constraints are available.

### Step 2 - Start OpenLANE

Launch the OpenLANE flow using the available environment.

### Step 3 - Load the Design

The required design and configuration are loaded into OpenLANE.

### Step 4 - Run the Floorplan

The floorplanning stage is executed as part of the OpenLANE flow.

The floorplan stage determines:

* Core dimensions
* Die dimensions
* I/O pin positions
* Placement regions
* Initial physical organization

### Step 5 - Review the Results

The generated floorplan files and reports are checked after execution.

## Basic Flow

```text
Design Preparation
        |
        v
OpenLANE
        |
        v
Floorplanning
        |
        v
Floorplan Database
        |
        v
Review Results
```

## Key Learning

OpenLANE automates the floorplanning process and generates the required physical design files for subsequent placement stages.

## Screenshot
### Figure 1:

<img width="822" height="458" alt="Screenshot 2026-09-06 104349" src="https://github.com/user-attachments/assets/1ca04591-cdbc-4509-ac33-3a8b096aa4aa" />

### Figure 2:

<img width="880" height="483" alt="Screenshot 2026-09-06 104418" src="https://github.com/user-attachments/assets/d5a90b3e-fd54-43a6-a1b5-53b98d923d18" />

### Figure 3:

<img width="896" height="492" alt="Screenshot 2026-09-06 104505" src="https://github.com/user-attachments/assets/461f913f-6840-4985-99cc-1fac17330c70" />

---

# 8. SKY_L7 - Review Floorplan Files and Steps to View Floorplan

## Objective

To review the files generated after floorplanning and understand how to visualize the floorplan.

## Floorplan Results

After the floorplan stage, OpenLANE generates several files and reports.

These may include:

* Floorplan DEF
* LEF files
* Configuration information
* Reports
* Logs
* Generated layout data

## Viewing the Floorplan

The generated physical design information can be viewed using layout tools.

A floorplan can be examined to check:

* Core boundary
* Die boundary
* I/O pins
* Macros
* Standard-cell regions
* Placement blockages

## Key Learning

Reviewing the floorplan helps identify problems early, before proceeding to placement and routing.

## Screenshot
### Figure 1:

<img width="880" height="487" alt="Screenshot 2026-09-06 104644" src="https://github.com/user-attachments/assets/2352562d-8f6c-48da-9897-691f2ea73b77" />

### Figure 2:

<img width="885" height="488" alt="Screenshot 2026-09-06 104710" src="https://github.com/user-attachments/assets/677488e6-ca18-4e2c-abb8-ece402c6b389" />

### Figure 3:

<img width="887" height="482" alt="Screenshot 2026-09-06 104729" src="https://github.com/user-attachments/assets/aa1cf489-f53f-4513-95d4-3d80c2ba4a5f" />

---

# 9. SKY_L8 - Review Floorplan Layout in Magic

## Objective

To visualize and inspect the generated floorplan using Magic.

## Magic

Magic is an open-source VLSI layout tool that can be used to view and inspect physical layouts.

The generated layout information can be loaded into Magic for visual inspection.

## Floorplan Inspection

Using Magic, important physical structures can be examined, including:

* Die boundary
* Core boundary
* Standard cells
* Pins
* Metal layers
* Power connections
* Macros

## Importance

Viewing the floorplan helps verify whether the physical implementation matches the expected design structure.

## Key Learning

Magic provides a graphical representation of the physical layout, making it easier to inspect the floorplan and identify physical design issues.

## Screenshot
### Figure 1:

<img width="882" height="487" alt="Screenshot 2026-09-06 104750" src="https://github.com/user-attachments/assets/254e9d66-03fb-4f84-891c-62b4fe33d441" />

### Figure 2:

<img width="891" height="487" alt="Screenshot 2026-09-06 104815" src="https://github.com/user-attachments/assets/1e21ebe8-246a-48d1-bf17-d70656af3bb9" />

### Figure 3:

<img width="891" height="491" alt="Screenshot 2026-09-06 104838" src="https://github.com/user-attachments/assets/460115f5-a740-4f00-ba52-635881684e34" />

---

# PART 2 - LIBRARY BINDING AND PLACEMENT

# 10. SKY_L1 - Netlist Binding and Initial Place Design

## Objective

To understand how the synthesized netlist is mapped to physical library cells and how initial placement is performed.

## Netlist Binding

After synthesis, the logical netlist contains instances of standard cells.

These logical cells need to be associated with physical library cells that contain information such as:

* Cell dimensions
* Pin locations
* Physical geometry
* Timing information

This process is known as netlist binding or library binding.

## Initial Placement

After binding the logical cells to physical cells, the cells are initially placed within the core area.

The placement process attempts to position cells while considering their connectivity.

```text
Synthesized Netlist
        |
        v
Library Binding
        |
        v
Physical Standard Cells
        |
        v
Initial Placement
```

## Key Learning

Library binding connects the logical representation of cells to their physical library definitions, enabling physical placement.

## Screenshot
### Figure 1:

<img width="808" height="505" alt="Screenshot 2026-09-06 121349" src="https://github.com/user-attachments/assets/5108d167-2aab-4657-9537-f3f8fabe2925" />

### Figure 2:

<img width="900" height="457" alt="Screenshot 2026-09-06 121730" src="https://github.com/user-attachments/assets/cddf8c1a-b49d-40fd-9526-18ef81f0be6e" />

---

# 11. SKY_L2 - Optimize Placement Using Estimated Wire-Length and Capacitance

## Objective

To understand how placement can be optimized using estimated wire length and capacitance.

## Wire Length

The physical distance between connected cells affects the length of the interconnect.

Longer wires can result in:

* Higher resistance
* Higher capacitance
* Increased delay
* Higher power consumption

Therefore, placement algorithms attempt to reduce unnecessary wire length.

## Capacitance

Interconnect capacitance depends on physical properties such as wire length and surrounding structures.

Higher capacitance can increase signal delay and affect timing.

## Placement Optimization

The placement process attempts to find cell locations that provide a good balance between:

* Wire length
* Timing
* Congestion
* Cell density

```text
Cell Placement
      |
      +---- Wire Length
      |
      +---- Capacitance
      |
      +---- Timing
      |
      +---- Congestion
      |
      v
Optimized Placement
```

## Key Learning

Optimizing cell placement helps reduce interconnect delay and congestion while improving the timing characteristics of the design.

## Screenshot
### Figure 1:

<img width="891" height="472" alt="Screenshot 2026-09-06 121048" src="https://github.com/user-attachments/assets/3d4c2b7c-267b-4408-865a-60865bbfb947" />

### Figure 2:

<img width="880" height="477" alt="Screenshot 2026-09-06 122156" src="https://github.com/user-attachments/assets/922b5463-4d64-40e8-abe3-a06cb09ce245" />

---

# 12. SKY_L3 - Final Placement Optimization

## Objective

To understand the final optimization performed after initial placement.

## Introduction

Initial placement provides approximate locations for standard cells. Further optimization is required to obtain a placement that satisfies physical and timing requirements.

## Optimization Goals

Final placement optimization considers:

* Timing
* Wire length
* Congestion
* Cell density
* Placement legality

The cells may be moved to improve the overall quality of the placement.

## Placement Flow

```text
Initial Placement
       |
       v
Estimate Wire Length
       |
       v
Estimate Timing
       |
       v
Analyze Congestion
       |
       v
Optimize Placement
       |
       v
Final Placement
```

## Key Learning

Final placement optimization improves the quality of the placement before the design proceeds to clock tree synthesis and routing.

## Screenshot
### Figure 1:

<img width="908" height="497" alt="Screenshot 2026-09-06 122433" src="https://github.com/user-attachments/assets/429ec707-d231-4360-87cf-d9c21f205110" />

---

# 13. SKY_L4 - Need for Libraries and Characterization

## Objective

To understand why standard-cell libraries are required and why cells must be characterized.

## Need for Libraries

Physical design tools require information about standard cells to perform synthesis, placement, timing analysis, and routing.

A standard-cell library provides information such as:

* Cell functionality
* Cell dimensions
* Pin information
* Timing characteristics
* Power characteristics
* Physical layout information

## Cell Characterization

Cell characterization determines the electrical and timing behavior of a cell under different operating conditions.

The characterized information is stored in library files and used by EDA tools.

## Example

A standard cell may have different timing behavior depending on:

* Input transition
* Output capacitance
* Supply voltage
* Operating conditions

## Key Learning

Accurate library information and characterization are essential for making correct synthesis, timing, placement, and optimization decisions.

## Screenshot
### Figure 1:

<img width="867" height="497" alt="Screenshot 2026-09-06 122636" src="https://github.com/user-attachments/assets/abf6d227-0d2a-41d4-8f8b-453f30f60a36" />

---

# 14. SKY_L5 - Congestion Aware Placement Using RePlAce

## Objective

To understand congestion-aware placement using RePlAce.

## RePlAce

RePlAce is a placement engine used in the OpenLANE flow for standard-cell placement.

The placement process aims to distribute cells efficiently while considering routing congestion.

## Congestion

Routing congestion occurs when too many connections compete for limited routing resources in a particular region.

High congestion can lead to:

* Routing difficulties
* Longer wires
* Timing degradation
* Routing failures

## Congestion-Aware Placement

The placement engine attempts to distribute cells in a way that reduces high-density regions and provides sufficient routing resources.

```text
Netlist
   |
   v
Initial Placement
   |
   v
Estimate Congestion
   |
   v
Optimize Cell Distribution
   |
   v
Congestion-Aware Placement
```

## Key Learning

Congestion-aware placement is important because a placement that looks good based only on cell density may still create routing problems.

## Screenshot
### Figure 1:

<img width="886" height="487" alt="Screenshot 2026-09-06 104914" src="https://github.com/user-attachments/assets/4f0f1132-f003-4183-be60-47115a820509" />

### Figure 2:

<img width="883" height="487" alt="Screenshot 2026-09-06 105000" src="https://github.com/user-attachments/assets/8f6886a9-daa8-42a3-b271-91e23e6d275b" />

### Figure 3:

<img width="887" height="492" alt="Screenshot 2026-09-06 105019" src="https://github.com/user-attachments/assets/9f6a7f5d-6b39-4c92-bfd5-b013b6e5f1cb" />

---

# PART 3 - CELL DESIGN AND CHARACTERIZATION FLOWS

# 15. SKY130_D2_SK3 - Cell Design and Characterization Flows

## Objective

To understand the basic flow used to design and characterize standard cells.

## Introduction

Standard cells are reusable building blocks used during digital ASIC implementation.

Examples include:

* Inverters
* NAND gates
* NOR gates
* Flip-flops
* Buffers
* Multiplexers

A standard-cell design flow converts the circuit specification into a physical layout and then characterizes its electrical and timing behavior.

## General Flow

```text
Circuit Design
      |
      v
Layout Design
      |
      v
Parasitic Extraction
      |
      v
Characterization
      |
      v
Library Model
```

## Key Learning

Cell design and characterization provide the physical and electrical information required by digital ASIC design tools.

---

# 16. SKY_L1 - Inputs for Cell Design Flow

## Objective

To understand the inputs required before starting the standard-cell design flow.

## Important Inputs

The cell design flow requires information such as:

* Cell functionality
* Circuit specification
* Technology information
* Transistor models
* Design rules
* Power supply information
* Input/output requirements
* Library requirements

## Technology Information

The technology defines physical manufacturing-related constraints such as:

* Minimum dimensions
* Metal layers
* Design rules
* Device characteristics

## Cell Specification

The required logic function must be clearly defined before transistor-level design begins.

For example:

```text
Logic Function
     |
     v
Transistor-Level Circuit
```

## Key Learning

Correct input information is necessary to design a cell that meets the required functional, physical, and electrical specifications.

## Screenshot
### Figure 1:

<img width="1352" height="802" alt="Screenshot 2026-09-05 175629" src="https://github.com/user-attachments/assets/4e25e1f2-f549-454f-bbb7-d3496165d85d" />

### Figure 2:

<img width="1412" height="806" alt="Screenshot 2026-09-05 175759" src="https://github.com/user-attachments/assets/0e7d7a19-c151-4214-93fd-836628a5bdcf" />

---

# 17. SKY_L2 - Circuit Design Step

## Objective

To understand the circuit design stage of standard-cell development.

## Introduction

In the circuit design stage, the required logic function is implemented using transistors.

For example, a digital logic gate can be designed using suitable combinations of PMOS and NMOS transistors.

## Circuit Design Process

```text
Logic Specification
       |
       v
Transistor Selection
       |
       v
Circuit Schematic
       |
       v
Simulation
       |
       v
Verify Functionality
```

## Circuit Verification

The circuit is simulated to verify:

* Logic functionality
* Delay
* Power
* Signal transitions
* Operating behavior

## Key Learning

The circuit design stage converts the required logic function into a transistor-level implementation and verifies its behavior before layout.

## Screenshot
### Figure 1:

<img width="846" height="497" alt="Screenshot 2026-09-06 123757" src="https://github.com/user-attachments/assets/9d3fda31-b9f8-408b-8c48-a692a47f1e2b" />

---

# 18. SKY_L3 - Layout Design Step

## Objective

To understand how the transistor-level circuit is converted into a physical layout.

## Introduction

After the circuit schematic is verified, the circuit is physically implemented using layout geometries.

The layout defines the physical shapes and connections of:

* Transistors
* Diffusion
* Polysilicon
* Metal layers
* Contacts
* Vias

## Layout Flow

```text
Circuit Schematic
       |
       v
Physical Layout
       |
       v
Design Rule Check
       |
       v
Layout Verification
```

## Important Considerations

The layout should satisfy:

* Design rules
* Cell dimensions
* Pin accessibility
* Routing requirements
* Power connections
* Electrical connectivity

## Key Learning

The layout design step converts the circuit schematic into a physical representation that can be used in the ASIC layout flow.

## Screenshot
### Figure 1:

<img width="1301" height="767" alt="Screenshot 2026-09-05 180123" src="https://github.com/user-attachments/assets/6f709aa5-e0b7-4faf-8869-4bd76dd23911" />

### Figure 2:

<img width="1327" height="747" alt="Screenshot 2026-09-05 180146" src="https://github.com/user-attachments/assets/88dcacca-3e0d-4c54-a63e-80a883d71dd4" />

---

# 19. SKY_L4 - Typical Characterization Flow

## Objective

To understand the typical process used to characterize a standard cell.

## Introduction

Characterization determines the timing and power behavior of a cell under different input and output conditions.

## Characterization Flow

```text
Cell Layout
     |
     v
Parasitic Extraction
     |
     v
Circuit Simulation
     |
     v
Generate Timing/Power Data
     |
     v
Characterized Library
```

## Important Characterization Data

Characterization can provide:

* Propagation delay
* Transition time
* Setup time
* Hold time
* Power information

The results are stored in library models used by EDA tools.

## Key Learning

Cell characterization provides accurate timing and power information required for synthesis and physical design.

## Screenshot
### Figure 1:

<img width="1440" height="817" alt="Screenshot 2026-09-05 180403" src="https://github.com/user-attachments/assets/7ae32576-86f7-49de-946d-0e7a61c9820d" />

### Figure 2:

<img width="1417" height="810" alt="Screenshot 2026-09-05 180456" src="https://github.com/user-attachments/assets/30ff454b-59a7-4312-8035-fe0c0a2e6996" />

### Figure 3:

<img width="1377" height="796" alt="Screenshot 2026-09-05 180603" src="https://github.com/user-attachments/assets/904f9cbd-e406-4146-b4f3-5a29a8bb58e9" />

---

# PART 4 - GENERAL TIMING CHARACTERIZATION PARAMETERS

# 20. SKY130_D2_SK4 - General Timing Characterization Parameters

## Objective

To understand the basic timing parameters used during standard-cell characterization.

## Introduction

Timing characterization determines how quickly a standard cell responds to changes at its inputs and produces changes at its outputs.

Important parameters include:

* Input transition
* Output transition
* Propagation delay
* Setup time
* Hold time
* Output load

## Timing Dependency

Cell delay is affected by factors such as:

* Input signal transition
* Output capacitance
* Load
* Process conditions
* Voltage
* Temperature

## Key Learning

Timing characterization allows EDA tools to accurately estimate the timing behavior of standard cells during synthesis and physical design.

---

# 21. SKY_L1 - Timing Threshold Definitions

## Objective

To understand the threshold definitions used for measuring signal transitions and delays.

## Introduction

Digital signals do not transition instantaneously between logic LOW and logic HIGH. Timing measurements therefore use defined voltage thresholds.

Typical timing measurements consider specific percentages of the signal voltage range.

```text
Logic HIGH
   |
   |---------
   |        /
   |       /
   |      /
   |     /
   |----/
   |
Logic LOW
```

The selected threshold levels are used consistently to measure:

* Input transition
* Output transition
* Propagation delay

## Importance

Correct threshold definitions are necessary to obtain consistent and comparable timing measurements during characterization.

## Key Learning

Timing thresholds provide reference points for measuring signal transitions and propagation delays.

## Screenshot
### Figure 1:

<img width="1397" height="818" alt="Screenshot 2026-09-05 180734" src="https://github.com/user-attachments/assets/a0630b67-fa45-4f4c-87d2-81a41ff297bc" />

### Figure 2:

<img width="1372" height="817" alt="Screenshot 2026-09-05 180713" src="https://github.com/user-attachments/assets/8d6a9004-7ea7-4c37-b421-80fca26bf92e" />

---

# 22. SKY_L2 - Propagation Delay and Transition Time

## Objective

To understand propagation delay and transition time in digital standard cells.

## Propagation Delay

Propagation delay is the time required for a change at the input of a cell to produce the corresponding change at its output.

It can be represented as:

```text
Input Change
     |
     |------ Delay ------|
                         |
                         v
                    Output Change
```

Propagation delay is an important parameter for determining the maximum operating speed of a digital circuit.

## Transition Time

Transition time represents how quickly a signal changes between logic levels.

It is commonly measured between defined voltage thresholds.

A faster transition means the signal changes state more quickly.

## Factors Affecting Delay

Propagation delay and transition time depend on:

* Input transition
* Output capacitance
* Load
* Cell design
* Process
* Supply voltage
* Temperature

## Key Learning

Propagation delay determines how long a signal takes to propagate through a cell, while transition time describes the speed of the signal transition itself.

## Screenshot
### Figure 1:

<img width="1472" height="806" alt="Screenshot 2026-09-05 180851" src="https://github.com/user-attachments/assets/ae168e48-2469-4bdd-b2fa-3d330305e187" />

### Figure 2:

<img width="1482" height="810" alt="Screenshot 2026-09-05 181048" src="https://github.com/user-attachments/assets/5861cee9-f4d7-41c1-a395-91952f8f4dca" />

---

# Module 2 - Overall Learning

Through this module, I learned the fundamentals of ASIC floorplanning, placement, library cells, cell characterization, and timing characterization.

The major concepts covered in this module include:

* Chip floorplanning considerations
* Utilization factor
* Aspect ratio
* Pre-placed cells
* Decoupling capacitors
* Power planning
* Pin placement
* Placement blockages
* OpenLANE floorplanning
* Floorplan file review
* Magic layout viewing
* Netlist binding
* Initial placement
* Placement optimization
* Wire-length and capacitance estimation
* Final placement optimization
* Standard-cell libraries
* Cell characterization
* Congestion-aware placement
* RePlAce
* Cell design flow
* Circuit design
* Layout design
* Characterization flow
* Timing characterization
* Timing thresholds
* Propagation delay
* Transition time

## Conclusion

This module provided a practical understanding of how floorplanning and placement decisions influence the quality of an ASIC implementation.

It also introduced standard-cell libraries and characterization, which provide the physical, timing, and power information required by EDA tools.

The concepts learned in this module form an important foundation for understanding placement, routing, timing analysis, and subsequent stages of the Sky130 ASIC physical design flow.
