# Sky130 Module 3 – Design Library Cell Using Magic Layout and ngspice Characterization

## Overview

Sky130 Module 3 focuses on designing, simulating, laying out, extracting, and characterizing a CMOS standard cell using the Sky130 PDK.

The module covers CMOS inverter simulation using **ngspice**, understanding the **CMOS fabrication process**, creating standard-cell layouts using **Magic**, performing **DRC checks**, extracting SPICE netlists, and characterizing the inverter using Sky130 model files.

The overall flow covered in this module is:

**CMOS Inverter Simulation → CMOS Fabrication → Layout → DRC → SPICE Extraction → Characterization → LEF**

---

# 1. SKY130_D3_SK1 – Labs for CMOS Inverter ngspice Simulations

This section focuses on the electrical simulation and analysis of a CMOS inverter using ngspice.

## 1.1 svgSKY_L0 – IO Placer Revision

The IO placer is used to define and revise the placement of input and output ports in the design.

Proper IO placement is important for maintaining an organized physical design and ensuring that the required input and output connections are available for further stages of the design flow.

---

## 1.2 SKY_L1 – SPICE Deck Creation for CMOS Inverter

A SPICE deck is created to simulate the electrical behavior of a CMOS inverter.

A CMOS inverter consists of:

- PMOS transistor
- NMOS transistor
- VDD supply
- Ground
- Input signal
- Output node

The SPICE deck contains:

- Transistor definitions
- Model files
- Circuit connections
- Power supply
- Input stimulus
- Simulation commands
- Measurement statements

The SPICE deck provides the required information to ngspice for performing circuit-level simulation.

### Basic CMOS Inverter Structure

```text
             VDD
              |
             PMOS
              |
Vin ----------|------ Vout
              |
             NMOS
              |
             GND

The gates of the PMOS and NMOS are connected together to form the input, while their drains are connected together to form the output.

1.3 SKY_L2 – SPICE Simulation Lab for CMOS Inverter

The CMOS inverter is simulated using ngspice and the appropriate Sky130 model files.

The simulation helps analyze:

Input voltage
Output voltage
Voltage transfer characteristics
Switching behavior
Current
Rise and fall behavior
Delay
Power-related characteristics

The simulation waveforms can be observed to understand how the output changes with respect to the input.

1.4 SKY_L3 – Switching Threshold Vm

The switching threshold voltage, Vm, is the input voltage at which the CMOS inverter changes its logic state.

At the switching point, the PMOS and NMOS devices operate such that the inverter is at its transition region.

The switching threshold can be obtained from the Voltage Transfer Characteristic (VTC) of the inverter.

Important parameters associated with the VTC include:

VOH – Output High Voltage
VOL – Output Low Voltage
VIH – Input High Voltage
VIL – Input Low Voltage
Vm – Switching Threshold

The switching threshold is an important parameter for understanding the logic behavior and noise margins of a CMOS inverter.

1.5 SKY_L4 – Static and Dynamic Simulation of CMOS Inverter

CMOS inverter behavior can be studied in two major ways:

Static Analysis

Static analysis studies the DC characteristics of the inverter.

Important parameters include:

VOH
VOL
VIH
VIL
Switching threshold Vm
Noise margins
DC transfer characteristics

The Voltage Transfer Characteristic (VTC) is particularly useful for understanding the static behavior of the inverter.

Dynamic Analysis

Dynamic analysis studies the time-dependent behavior of the inverter.

Important parameters include:

Propagation delay
Rise time
Fall time
Charging behavior
Discharging behavior
Dynamic power consumption

Dynamic analysis is important because standard cells must operate correctly at the required operating frequency.

1.6 SKY_L5 – Lab Steps to Git Clone vsdstdcelldesign

The standard-cell design repository is cloned using Git to obtain the required design environment and files.

A typical Git workflow is:

git clone <repository-url>
cd <repository-directory>

Git is useful for:

Obtaining the design files
Maintaining different versions
Tracking changes
Sharing the project
Managing the standard-cell design environment

The cloned repository provides the starting environment for the standard-cell layout and characterization flow.

2. SKY130_D3_SK2 – Inception of Layout – CMOS Fabrication Process

This section explains how a CMOS device is physically fabricated and how the fabrication steps relate to the physical layout of a standard cell.

The major fabrication concepts covered are:

Active region formation
N-well and P-well formation
Gate formation
LDD formation
Source and drain formation
Local interconnect formation
Higher-level metal formation

Understanding these fabrication steps helps in understanding the meaning of different layers used in a CMOS layout.

2.1 svgSKY_L1 – Create Active Regions

The active region defines the area of silicon where transistor source and drain regions are formed.

The active region is an important part of CMOS transistor formation.

For CMOS technology:

NMOS is formed in the appropriate P-type region.
PMOS is formed inside the N-well.

The active region therefore determines where the transistor can be formed and where the source and drain regions are created.

2.2 SKY_L2 – Formation of N-Well and P-Well

N-well and P-well regions are formed to provide the appropriate semiconductor environment for CMOS transistors.

N-Well

The N-well is the region in which PMOS transistors are formed.

P-Well

The P-well provides the region in which NMOS transistors are formed.

The wells are important for:

Transistor formation
Body connections
Device isolation
CMOS operation
Substrate biasing
2.3 SKY_L3 – Formation of Gate Terminal

The transistor gate is formed using polysilicon over the active region.

The intersection of the poly layer and active region forms the transistor channel.

The gate controls the flow of carriers between the source and drain.

For a CMOS inverter:

PMOS gate and NMOS gate are connected together.
This common connection forms the input.
The drains are connected together to form the output.

Therefore, the gate formation step is essential for creating the switching behavior of the transistor.

2.4 SKY_L4 – Lightly Doped Drain (LDD) Formation

Lightly Doped Drain, or LDD, regions are introduced near the source and drain regions.

The main purpose of LDD is to reduce the electric field near the drain region.

LDD helps improve:

Device reliability
Hot-carrier performance
Breakdown characteristics
Long-term transistor operation

This step is part of the transistor fabrication process before the final source and drain regions are completed.

2.5 SKY_L5 – Source–Drain Formation

The source and drain regions are formed using appropriate doping.

For NMOS:

Source is N-type.
Drain is N-type.

For PMOS:

Source is P-type.
Drain is P-type.

The source and drain provide electrical connections to the transistor channel.

The final transistor structure is determined by the relationship between:

Source
Drain
Gate
Channel
Well/substrate
2.6 SKY_L6 – Local Interconnect Formation

Local interconnect structures are used to electrically connect transistor terminals.

They provide connections between:

Source
Drain
Gate
Contacts
Metal layers

Local interconnects help create the required connectivity while maintaining the technology-specific spacing and design rules.

2.7 SKY_L7 – Higher Level Metal Formation

Higher-level metal layers are used for routing signals and power across the chip.

They are used for:

Signal routing
VDD distribution
VSS distribution
Connections between standard cells
Longer-distance routing

Using multiple metal layers allows complex circuits to be routed efficiently while reducing routing congestion.

2.8 SKY_L8 – Lab Introduction to Sky130 Basic Layers Layout and LEF Using Inverter

The Sky130 PDK provides technology-specific layers required to create physical layouts.

Important layers include:

Active / Diffusion
Poly
Contact
Metal1
Metal2
Higher metal layers
N-well
Implant layers
Tap layers

A CMOS inverter layout is created using these layers according to the Sky130 design rules.

Standard Cell Layout

A CMOS inverter standard-cell layout contains:

PMOS transistor
NMOS transistor
Input pin
Output pin
VDD connection
VSS connection
Well/tap structures
Metal routing

The layout must follow the required Sky130 design rules.

LEF

LEF stands for:

Library Exchange Format

LEF provides an abstract physical representation of a standard cell that can be used by physical-design tools.

LEF contains information such as:

Cell dimensions
Pin locations
Pin names
Routing layers
Obstructions
Placement information

The detailed transistor geometry is not represented in the same way as the complete layout database.

2.9 SKY_L9 – Lab Steps to Create Standard Cell Layout and Extract SPICE Netlist

After creating the CMOS inverter layout, the physical design can be checked and extracted.

The standard-cell layout contains:

PMOS
NMOS
Input
Output
Power connections
Ground connections
Interconnects
Well and tap structures

After layout creation, the design can be extracted into a SPICE netlist.

The extraction process identifies:

Transistors
Connections
Nodes
Device parameters
Parasitic components

The extracted SPICE netlist can then be simulated to verify whether the physical layout behaves as expected.

The overall verification flow is:

Circuit Design
      ↓
Physical Layout
      ↓
DRC Verification
      ↓
SPICE Extraction
      ↓
Extracted SPICE Netlist
      ↓
Simulation
3. SKY130_D3_SK2 – Characterization, Magic and DRC

This section focuses on characterization of the inverter using Sky130 model files and understanding the Magic layout tool and Sky130 DRC rules.

3.1 SKY_L2 – Characterize Inverter Using Sky130 Model Files

The extracted CMOS inverter is characterized using the Sky130 model files.

Characterization is used to determine the electrical and timing behavior of the standard cell.

Important characteristics include:

Cell delay
Rise delay
Fall delay
Rise transition
Fall transition
Input capacitance
Output behavior
Power characteristics

Characterization data is important for creating timing libraries that can later be used by synthesis and static timing analysis tools.

The general characterization flow is:

Standard Cell Layout
        ↓
SPICE Extraction
        ↓
Extracted Netlist
        ↓
Sky130 Model Files
        ↓
SPICE Simulation
        ↓
Timing and Power Measurements
        ↓
Cell Characterization
3.2 SKY_L3 – Lab Introduction to Magic Tool Options and DRC Rules

Magic is an open-source VLSI layout tool used for creating and verifying integrated-circuit layouts.

Magic provides features for:

Layout creation
Layout editing
Layer inspection
Design Rule Checking
SPICE extraction
Connectivity verification
Technology-rule interpretation
Design Rule Checking

DRC stands for:

Design Rule Checking

DRC verifies whether a layout follows the physical design rules defined by the technology.

Common DRC rules include:

Minimum width
Minimum spacing
Minimum enclosure
Minimum overlap
Minimum extension
Layer-specific spacing requirements

A layout must pass the required DRC checks before it can be considered physically valid.

3.3 SKY_L4 – Lab Introduction to Sky130 PDKs and Steps to Download Labs

The Sky130 PDK provides the technology information required to design circuits using the SkyWater 130 nm CMOS process.

The PDK contains technology-specific information such as:

Layer definitions
Design rules
Device models
SPICE models
Standard-cell libraries
LEF files
Liberty timing libraries
Technology files
Extraction rules

The PDK acts as the connection between the design tools and the semiconductor manufacturing technology.

The laboratory environment requires the appropriate Sky130 files and tools to be installed or downloaded before performing layout and characterization experiments.

3.4 SKY_L5 – Lab Introduction to Magic and Steps to Load Sky130 Tech-Rules

Magic requires the appropriate Sky130 technology files to correctly interpret the layout.

The technology rules provide information about:

Layer names
Layer types
Connectivity
Design rules
Extraction rules
DRC requirements

After loading the Sky130 technology rules, the layout can be opened in Magic and checked using the corresponding technology rules.

The basic flow is:

Install / Obtain Sky130 PDK
        ↓
Load Sky130 Technology
        ↓
Open Layout in Magic
        ↓
Inspect Layers
        ↓
Run DRC
        ↓
Fix Violations
        ↓
Re-run DRC
3.5 SKY_L6 – Lab Exercise to Fix poly.9 Error in Sky130 Tech-File

During layout verification, DRC violations can occur when the physical geometry does not satisfy the technology rules.

One of the exercises involves understanding and fixing a poly.9 DRC error.

The debugging process includes:

Identify the reported DRC location.
Inspect the affected geometry in Magic.
Understand the rule associated with the error.
Determine the required geometrical relationship.
Modify the layout or relevant technology rule as required.
Run DRC again.
Verify that the error has been resolved.

This exercise helps understand how Magic interprets technology-specific DRC rules.

3.6 SKY_L7 – Lab Exercise to Implement Poly Resistor Spacing to Diff and Tap

This exercise focuses on understanding the spacing requirements between:

Polysilicon resistor structures
Diffusion regions
Tap regions

Incorrect spacing can produce DRC violations.

The layout must satisfy the minimum spacing requirements specified by the Sky130 technology rules.

This exercise helps understand:

Poly geometry
Diffusion geometry
Tap structures
Minimum spacing
DRC rule interpretation
Physical layout constraints
3.7 SKY_L8 – Lab Challenge Exercise to Describe DRC Error as Geometrical Construct

A DRC error should be understood as a physical or geometrical violation rather than simply an error message.

For example, a DRC rule may specify:

Minimum width
Minimum spacing
Minimum enclosure
Minimum overlap
Minimum extension

The DRC error can therefore be analyzed by identifying:

The affected layers.
The geometrical relationship between those layers.
The required design-rule condition.
The actual layout condition.
The required correction.

This approach makes DRC debugging easier and improves understanding of physical-design rules.

3.8 SKY_L9 – Lab Challenge to Find Missing or Incorrect Rules and Fix Them

This exercise focuses on identifying missing or incorrect technology rules and understanding their effect on DRC verification.

The debugging process involves:

Identify the reported DRC violation.
Understand the intended design rule.
Locate the corresponding technology rule.
Inspect the affected layout geometry.
Compare the actual layout with the required rule.
Identify whether the issue is caused by the layout or technology rule.
Correct the appropriate rule or layout.
Run DRC again.
Verify the result.

This provides practical understanding of the relationship between:

Layout Geometry → Technology Rules → DRC Engine → Verification Result

4. Overall Sky130 Module 3 Flow

The complete Module 3 flow can be summarized as:

                    SKY130 MODULE 3
                           |
                           ↓
              CMOS Inverter Design
                           |
                           ↓
                 SPICE Deck Creation
                           |
                           ↓
                  ngspice Simulation
                           |
                           ↓
                Switching Threshold Vm
                           |
                           ↓
             Static & Dynamic Analysis
                           |
                           ↓
                 Sky130 PDK Models
                           |
                           ↓
              CMOS Fabrication Process
                           |
                           ↓
                 Magic Layout Design
                           |
                           ↓
              Standard Cell Layout
                           |
                           ↓
                 DRC Verification
                           |
                           ↓
              SPICE Netlist Extraction
                           |
                           ↓
               Inverter Characterization
                           |
                           ↓
                    LEF Generation
                           |
                           ↓
              Standard Cell Library
5. Tools and Technologies Used
Tool / Technology	Purpose
ngspice	CMOS circuit simulation and characterization
Magic	Layout creation, editing, DRC and SPICE extraction
Sky130 PDK	Technology rules, device models and design information
SPICE	Circuit-level simulation
Git	Version control and repository management
LEF	Abstract physical representation of standard cells
DRC	Physical design-rule verification
Sky130 Model Files	Device-level simulation and characterization
Standard Cell Library	Reusable digital logic cells
6. Key Concepts Learned

Through this module, the following concepts were covered:

CMOS and Circuit Simulation
CMOS inverter
SPICE deck creation
ngspice simulation
Voltage Transfer Characteristic
Switching threshold Vm
Static analysis
Dynamic analysis
Propagation delay
Rise time
Fall time
Power characteristics
CMOS Fabrication
Active region formation
N-well formation
P-well formation
Gate formation
LDD formation
Source and drain formation
Local interconnect formation
Higher-level metal formation
Physical Design
Sky130 PDK
Magic layout tool
Standard-cell layout
CMOS inverter layout
Physical layers
LEF
Layout-to-SPICE extraction
Verification
Design Rule Checking
Minimum width rules
Minimum spacing rules
Enclosure rules
Extension rules
Poly.9 DRC
DRC debugging
Technology-rule analysis
Missing or incorrect DRC rules
Characterization
Sky130 model files
SPICE-based characterization
Cell delay
Rise delay
Fall delay
Input capacitance
Rise transition
Fall transition
Timing-library concepts
7. Important Files and Formats

The Module 3 flow introduces several important file types used in VLSI design.

File / Format	Purpose
SPICE / .spice / .sp	Circuit simulation and extracted netlist
GDS	Detailed physical layout representation
LEF	Abstract physical representation of a standard cell
Liberty / .lib	Timing and power characterization data
Magic technology files	Technology and DRC information
Git repository	Version-controlled design environment
8. Learning Outcome

After completing Sky130 Module 3, the complete relationship between circuit-level design and physical implementation becomes clearer.

The module demonstrates how a simple CMOS inverter can progress from an electrical circuit to a physically implemented and characterized standard cell.

The major flow is:

Electrical Design
      ↓
SPICE Simulation
      ↓
CMOS Fabrication Understanding
      ↓
Physical Layout
      ↓
DRC Verification
      ↓
SPICE Extraction
      ↓
Characterization
      ↓
Timing / Library Data
      ↓
Reusable Standard Cell

This module provides the foundation required for understanding later VLSI physical-design stages such as:

Synthesis
Floorplanning
Placement
Clock Tree Synthesis
Routing
Parasitic Extraction
Static Timing Analysis
9. Conclusion

Sky130 Module 3 provides practical knowledge of standard-cell design using Magic Layout and ngspice characterization.

The module connects transistor-level concepts with physical layout and verification. It starts with CMOS inverter simulation, explains the CMOS fabrication process, introduces Sky130 layout layers, creates a standard-cell layout, performs DRC verification, extracts a SPICE netlist, and characterizes the cell using Sky130 model files.

The complete learning flow can be represented as:

Simulation → Fabrication Understanding → Layout → DRC → Extraction → Characterization → Standard Cell Library

This forms an important foundation for progressing toward advanced VLSI RTL-to-GDSII and physical-design flows.
