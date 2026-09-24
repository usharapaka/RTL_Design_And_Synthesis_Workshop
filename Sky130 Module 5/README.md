# SKY130 Module 5 — Final Steps for RTL-to-GDSII Using TritonRoute & OpenSTA

> **VLSI Design & Implementation Workshop**
> **Focus:** Routing • DRC • Power Distribution Network • TritonRoute • RTL-to-GDSII



#  Module Overview

This module focuses on the final stages of the **RTL-to-GDSII physical design flow**, with emphasis on **routing, Design Rule Checking (DRC), Power Distribution Network (PDN) implementation, global routing, detailed routing, and TritonRoute**.

The module demonstrates how a placed design is transformed into a routed physical implementation while maintaining connectivity and satisfying physical design rules.

The overall flow covered is:

```text
Placed Design
     ↓
Power Distribution Network
     ↓
Global Routing
     ↓
Detailed Routing
     ↓
TritonRoute
     ↓
Design Rule Check
     ↓
Post-Route Verification
     ↓
Final Routed Design
```



# 1. Routing & Design Rule Check

### `SKY130_D5_SK1`

This section introduces the fundamentals of routing and physical verification after placement.

### Labs Covered

| Lab      | Topic                                          |
| -------- | ---------------------------------------------- |
| `SKY_L1` | Introduction to Maze Routing — Lee's Algorithm |
| `SKY_L2` | Lee's Algorithm — Conclusion                   |
| `SKY_L3` | Design Rule Check                              |



## 1.1 Maze Routing — Lee's Algorithm

Lee's algorithm is introduced as a fundamental **grid-based maze-routing algorithm** used to find a valid path between two points while avoiding obstacles.

The basic routing process can be represented as:

```text
Source
  ↓
Grid Expansion
  ↓
Obstacle Avoidance
  ↓
Target Reached
  ↓
Backtracking
  ↓
Final Route
```

The algorithm explores available routing locations systematically until the destination is reached.

### Key Concepts

* Routing grid
* Source and destination
* Obstacles
* Wave propagation
* Path finding
* Backtracking
* Route generation

## Figure 1:

<img width="1637" height="801" alt="Screenshot 2026-09-23 212855" src="https://github.com/user-attachments/assets/18a4e712-8774-45f3-b410-588decd048ee" />

## Figure 2:

<img width="1447" height="790" alt="Screenshot 2026-09-23 212948" src="https://github.com/user-attachments/assets/3b81063e-7e00-440b-97a9-e249edb2502a" />


## 1.2 Lee's Algorithm — Conclusion

The limitations and characteristics of maze routing are studied.

Important observations include:

* Systematic path exploration
* Guaranteed path discovery when a valid path exists
* Ability to avoid routing obstacles
* Computational cost for large routing grids
* Relationship between routing algorithms and physical design

The concepts provide a foundation for understanding modern routing engines used in physical design.

## Figure 1:

<img width="1538" height="767" alt="Screenshot 2026-09-23 213117" src="https://github.com/user-attachments/assets/bbce778c-5157-4564-91f5-5f3f2a13f2a7" />

## Figure 2:

<img width="1592" height="777" alt="Screenshot 2026-09-23 213213" src="https://github.com/user-attachments/assets/d278f1d3-e751-4632-ab01-0a8341ad932c" />

## 1.3 Design Rule Check — DRC

After routing, the physical design must be checked against the technology-specific design rules.

DRC verifies that the layout satisfies manufacturing constraints.

Typical checks include:

* Minimum metal width
* Minimum metal spacing
* Via spacing
* Via enclosure
* Layer connectivity
* Routing geometry
* Design-rule violations

The verification flow can be represented as:

```text
Routed Layout
      ↓
Physical Design Rules
      ↓
DRC Engine
      ↓
Violation Detection
      ↓
Debugging
      ↓
Corrected Layout
```

DRC is an essential step before the design can proceed toward final physical verification.

## Figure 1:

<img width="1750" height="777" alt="Screenshot 2026-09-23 213327" src="https://github.com/user-attachments/assets/ecf4dde3-047f-4527-a1e6-8334b5068271" />

## Figure 2:

<img width="1680" height="780" alt="Screenshot 2026-09-23 213401" src="https://github.com/user-attachments/assets/fc980407-5e43-40dc-aaf8-eec7ceae6acf" />

---

# 2. Power Distribution Network & Routing

### `SKY130_D5_SK2`

This section focuses on building the **Power Distribution Network (PDN)** and understanding the transition from power straps to standard-cell power connections.

### Labs Covered

| Lab      | Topic                                                             |
| -------- | ----------------------------------------------------------------- |
| `SKY_L1` | Lab steps to build Power Distribution Network                     |
| `SKY_L2` | From power straps to standard-cell power                          |
| `SKY_L3` | Basics of global and detailed routing and configuring TritonRoute |



## 2.1 Power Distribution Network

The **Power Distribution Network (PDN)** distributes supply power and ground throughout the physical design.

A simplified PDN hierarchy is:

```text
Power Source
     ↓
Power Ring
     ↓
Power Straps
     ↓
Power Rails
     ↓
Standard Cells
```

The PDN provides reliable electrical connectivity between the power source and the individual standard cells.

## 2.2 From Power Straps to Standard-Cell Power

The connection between the higher-level power distribution network and the standard-cell power rails is studied.

The flow can be represented as:

```text
Power Straps
     ↓
Power Rails
     ↓
Standard Cell VDD
     ↓
Standard Cell GND
```

This ensures that standard cells placed throughout the design receive the required power and ground connections.



## 2.3 Global Routing & Detailed Routing

Routing is divided into two major stages:

### Global Routing

Global routing determines the general paths and routing resources that signals should use.

```text
Nets
 ↓
Routing Resources
 ↓
Global Routing
 ↓
Route Guides
```

### Detailed Routing

Detailed routing converts the global routing information into actual physical routes while satisfying design rules.

```text
Global Route
     ↓
Track Assignment
     ↓
Detailed Routing
     ↓
Physical Wires & Vias
```

## Figure 1: Timing report showing a setup slack violation and OpenROAD routing activity

<img width="1916" height="1145" alt="Screenshot 2026-09-23 144723" src="https://github.com/user-attachments/assets/45391458-7b9e-4d13-92e5-34887d4a2e91" />

## Figure 2: OpenROAD detailed-routing initialization, LEF/DEF reading and design information

<img width="1917" height="1143" alt="Screenshot 2026-09-23 144755" src="https://github.com/user-attachments/assets/19a52e9b-1fd0-4a2d-8bce-f46d62b5b7b6" />

## Figure 3: Track assignment and routing guide processing

<img width="1917" height="1137" alt="Screenshot 2026-09-23 144823" src="https://github.com/user-attachments/assets/93fc87fb-c004-41d3-8d9a-09b2ecdeaa8e" />

## Figure 4: Detailed-routing optimization iterations and violation reduction

<img width="1917" height="1140" alt="Screenshot 2026-09-23 144839" src="https://github.com/user-attachments/assets/72daa02b-9120-471b-8460-0811cd41563d" />

## Figure 5: Final detailed-routing summary with wire length, vias, runtime and routing statistics

<img width="1913" height="1137" alt="Screenshot 2026-09-23 144943" src="https://github.com/user-attachments/assets/1820a3fa-4353-4b7f-bc5b-2a23e3f4d757" />

---

# 3. TritonRoute Features

### `SKY130_D5_SK3`

This section explores the internal routing concepts and important features of **TritonRoute**, the detailed-routing engine used in the physical-design flow.

### Labs Covered

| Lab      | Topic                                                                                |
| -------- | ------------------------------------------------------------------------------------ |
| `SKY_L1` | TritonRoute Feature 1 — Honors pre-processed route guides                            |
| `SKY_L2` | TritonRoute Features 2 & 3 — Inter-guide connectivity and intra-/inter-layer routing |
| `SKY_L3` | TritonRoute method to handle connectivity                                            |
| `SKY_L4` | Routing topology algorithm and final files after routing                             |



## 3.1 TritonRoute — Pre-Processed Route Guides

TritonRoute uses the information provided by the routing stage to guide detailed routing.

The route guides define the expected routing regions for different nets.

```text
Global Routing
      ↓
Route Guides
      ↓
TritonRoute
      ↓
Detailed Routing
```

The routing engine uses these guides while generating the final physical routes.



## 3.2 Inter-Guide Connectivity

Inter-guide connectivity deals with connecting routing segments that belong to the same net across different routing guides.

The routing engine must ensure that the final route forms a continuous electrical connection.

```text
Guide A
   │
   │ Connectivity
   ↓
Guide B
   │
   ↓
Complete Net
```



## 3.3 Intra-Layer & Inter-Layer Routing

Routing can occur both within the same metal layer and between different metal layers.

### Intra-Layer Routing

Connections are created within the same routing layer.

```text
Metal Layer
───────────────
     Route
───────────────
```

### Inter-Layer Routing

Connections transition between different metal layers using vias.

```text
Metal Layer 2
───────────────
       │
      VIA
       │
───────────────
Metal Layer 1
```

These routing mechanisms allow complex nets to be connected across multiple routing layers.



## 3.4 TritonRoute Connectivity Handling

TritonRoute must maintain complete electrical connectivity for every routed net.

The routing process involves:

```text
Netlist Connectivity
       ↓
Routing Guides
       ↓
Routing Topology
       ↓
Wire & Via Generation
       ↓
Connectivity Verification
```

The objective is to ensure that all required source and destination pins belonging to a net are physically connected.



## 3.5 Routing Topology Algorithm

Routing topology determines how multiple terminals belonging to a net are connected.

For multi-terminal nets, the routing topology must provide a connected structure while considering:

* Routing resources
* Obstacles
* Metal layers
* Vias
* Design rules
* Route guides
* Connectivity

The final routing topology is converted into physical wires and vias.



## 3.6 Final Files After Routing

After successful detailed routing, several physical-design files are generated for further analysis and verification.

Typical post-route information includes:

* Routed DEF
* Routed netlist
* Routing information
* Physical connectivity
* Reports
* DRC-related information
* Final routing database/files

These files represent the physical implementation after the routing stage.

## Figure 1: Routing complete ayyaka OpenSTA run, RC extraction and timing analysis

<img width="1917" height="1141" alt="Screenshot 2026-09-23 145001" src="https://github.com/user-attachments/assets/72cb65ec-3385-4a5d-9ce0-cc49ef3ef9d1" />

## Figure 2: 35-fastroute.guide routing guide file contents

<img width="1917" height="1140" alt="Screenshot 2026-09-23 151609" src="https://github.com/user-attachments/assets/55e0c50c-447a-4909-a91a-5912c2cbd1bc" />

## Figure 3: SPEF_EXTRACTOR GitHub repository clone and files

<img width="1917" height="1137" alt="Screenshot 2026-09-23 151935" src="https://github.com/user-attachments/assets/e3145c4d-1681-489f-bb1f-4e73c45d75af" />

## Figure 4: OpenLane tmp directory lo routing-related intermediate files

<img width="951" height="595" alt="Screenshot 2026-09-23 154659" src="https://github.com/user-attachments/assets/07b67dd6-17b2-43f7-a9c9-15d402857ad5" />

## Figure 5: Final results/routing directory with DEF, SPEF and routed design files

<img width="1917" height="1142" alt="Screenshot 2026-09-23 175528" src="https://github.com/user-attachments/assets/821fe5ad-8edb-4a1a-92ba-9b169f15a997" />

## Figure 6: spef_extraction_setup_and_results

<img width="1917" height="1142" alt="Screenshot 2026-09-23 175758" src="https://github.com/user-attachments/assets/a9fbabed-4e3e-42f6-a3a0-84132a45b532" />

## Figure 7: openlane_synthesis_and_routing_results

<img width="1912" height="1137" alt="Screenshot 2026-09-23 175822" src="https://github.com/user-attachments/assets/bcb8c050-7cc3-43ff-8124-0db1205d3c62" />

#  Conclusion

**SKY130 Module 5** provides practical exposure to the final routing stages of the physical-design flow.

The module covers the fundamentals of **maze routing, Lee's algorithm, Design Rule Checking, Power Distribution Network generation, global and detailed routing, and TritonRoute features**.

By completing these labs, the routing stage of the **RTL-to-GDSII flow** is understood from both algorithmic and practical perspectives, including how routing guides, connectivity, metal layers, vias, power networks, and design rules contribute to the final physical implementation.


