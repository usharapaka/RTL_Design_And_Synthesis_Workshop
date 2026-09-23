# SKY130 Module 4 — Pre-Layout Timing Analysis & Importance of a Good Clock Tree

> **VLSI Design & Implementation Workshop**
> **Technology:** SkyWater SKY130
> **Focus:** Timing Modelling • OpenSTA • Setup/Hold Analysis • Clock Tree Synthesis • TritonCTS • Signal Integrity


##  Module Overview

This module focuses on **pre-layout timing analysis, timing modelling, static timing analysis, clock uncertainty, synthesis optimization, clock tree synthesis, signal integrity, and post-CTS timing analysis**.

The module demonstrates how standard-cell timing information is used to analyze and optimize a digital design and how the clock distribution network affects **setup timing, hold timing, skew, latency, and overall timing closure**.

The overall flow covered in this module is:

```text
Timing Libraries
       ↓
Delay Tables
       ↓
Synthesis
       ↓
Ideal Clock STA
       ↓
Setup Analysis
       ↓
Timing Optimization
       ↓
Clock Tree Synthesis
       ↓
TritonCTS
       ↓
Real Clock STA
       ↓
Setup & Hold Analysis
       ↓
Timing Closure
```


#  1. Timing Modelling Using Delay Tables

### `SKY130_D4_SK1`

This section introduces the timing information required by synthesis and static timing analysis.

### Labs Covered

| Lab      | Topic                                                                  |
| -------- | ---------------------------------------------------------------------- |
| `SKY_L1` | Convert grid information to track information                          |
| `SKY_L2` | Convert Magic layout to standard-cell LEF                              |
| `SKY_L3` | Introduction to timing libraries and including a new cell in synthesis |
| `SKY_L4` | Introduction to delay tables                                           |
| `SKY_L5` | Delay table usage — Part 1                                             |
| `SKY_L6` | Delay table usage — Part 2                                             |
| `SKY_L7` | Configure synthesis settings to fix slack and include `vsdinv`         |


## 1.1 Grid Information to Track Information

The physical layout contains geometric information that needs to be translated into routing information used by physical-design tools.

The lab covers:

* Layout grid
* Routing grid
* Track information
* Track pitch
* Metal routing directions
* Standard-cell alignment

The conversion provides the physical information required for subsequent routing and implementation stages.


#  1.2 Magic Layout to Standard Cell LEF

A standard-cell layout created using Magic is converted into a **LEF (Library Exchange Format)** representation.

LEF provides the physical abstract required by downstream physical-design tools.

The flow can be represented as:

```text
Magic Layout
     ↓
Cell Geometry
     ↓
Pin Information
     ↓
Cell Dimensions
     ↓
Routing Information
     ↓
Standard Cell LEF
```


#  1.3 Timing Libraries

Timing libraries provide the electrical and timing characteristics of standard cells.

Important timing information includes:

* Cell functionality
* Input capacitance
* Output capacitance
* Timing arcs
* Cell delay
* Transition time
* Setup time
* Hold time
* Power characteristics

These libraries are used by synthesis and STA tools to estimate circuit timing.



#  1.4 Delay Tables

Delay tables describe how the delay and output transition of a standard cell vary with different input and load conditions.

A simplified representation is:

```text
Input Transition
       +
Output Load
       ↓
Delay Table
       ↓
Cell Delay
```

The timing engine uses these tables to determine cell delay during timing analysis.


#  1.5 Synthesis Configuration & Slack Optimization

Synthesis settings are configured to improve timing and reduce slack violations.

The lab covers:

* Timing-driven synthesis
* Slack analysis
* Cell selection
* Inverter inclusion
* Timing optimization
* Synthesis configuration
* Critical-path improvement

The effect of synthesis changes on timing slack is analyzed.

<img width="1917" height="1138" alt="Screenshot 2026-09-13 133152" src="https://github.com/user-attachments/assets/1853e9ed-95df-42ea-821b-15a16a9b0c73" />
<img width="1917" height="1136" alt="Screenshot 2026-09-13 140615" src="https://github.com/user-attachments/assets/4531c058-8414-4ad1-baae-185664ecf464" />
<img width="1913" height="1140" alt="Screenshot 2026-09-13 142936" src="https://github.com/user-attachments/assets/84eb5e90-9d03-46a9-9540-23bff293992c" />
<img width="1916" height="1135" alt="Screenshot 2026-09-13 150014" src="https://github.com/user-attachments/assets/a5a96d61-231f-4646-b486-ec27ca5354ba" />
<img width="1917" height="1140" alt="Screenshot 2026-09-13 150033" src="https://github.com/user-attachments/assets/bdab924e-41ce-4a80-a8c4-2d05de30f9d7" />
<img width="1917" height="1133" alt="Screenshot 2026-09-13 150329" src="https://github.com/user-attachments/assets/5b91e12c-621c-4591-851c-0d809692ff9f" />
<img width="1911" height="1132" alt="Screenshot 2026-09-13 153133" src="https://github.com/user-attachments/assets/11c911e6-0b85-49f5-9d9d-565533fa86dc" />
<img width="1917" height="1177" alt="Screenshot 2026-09-13 153809" src="https://github.com/user-attachments/assets/0052d220-4858-49dd-89f9-bfb68a928e03" />
<img width="1912" height="1138" alt="Screenshot 2026-09-13 155136" src="https://github.com/user-attachments/assets/c11eae50-5d6a-4abb-b05e-475bb0f284d8" />
<img width="1917" height="1142" alt="Screenshot 2026-09-13 162325" src="https://github.com/user-attachments/assets/b2d1b914-7258-4fea-a47b-e3cc98b2b63f" />
<img width="1917" height="1145" alt="Screenshot 2026-09-13 162433" src="https://github.com/user-attachments/assets/0f113fb2-3c61-4dcb-9a50-b66713534fa7" />
<img width="1917" height="1140" alt="Screenshot 2026-09-13 163652" src="https://github.com/user-attachments/assets/3ad14ee0-c309-4580-8393-ad9107293be2" />
<img width="1912" height="1140" alt="Screenshot 2026-09-13 164023" src="https://github.com/user-attachments/assets/3e4e1ef7-305c-4b0c-9dd6-e940d9a430bc" />
<img width="1895" height="835" alt="Screenshot 2026-09-13 164213" src="https://github.com/user-attachments/assets/3295b15b-2692-40c8-9a46-6c872f5d1b61" />
<img width="1917" height="1136" alt="Screenshot 2026-09-13 164238" src="https://github.com/user-attachments/assets/6d55e9cd-026d-49f8-94be-6f7a2230fbc1" />
<img width="1913" height="1140" alt="Screenshot 2026-09-20 120559" src="https://github.com/user-attachments/assets/896c8f60-dc4c-4fbb-b4d1-f6a83e688018" />
<img width="1917" height="1138" alt="Screenshot 2026-09-20 121744" src="https://github.com/user-attachments/assets/cd04a912-ce6c-4a00-aac5-3129b7505872" />
<img width="946" height="1142" alt="Screenshot 2026-09-20 122332" src="https://github.com/user-attachments/assets/38ef90c0-808e-470d-93c2-08560042002f" />
<img width="1917" height="1148" alt="Screenshot 2026-09-20 135045" src="https://github.com/user-attachments/assets/39a45006-3170-4c61-8867-57232137bb40" />
<img width="1917" height="1140" alt="Screenshot 2026-09-20 135237" src="https://github.com/user-attachments/assets/b0a1b735-349b-4fa9-b0f5-dacccd0e878b" />
<img width="1917" height="1142" alt="Screenshot 2026-09-20 140422" src="https://github.com/user-attachments/assets/7119bd19-b31d-4321-aab3-74d542056164" />
<img width="1917" height="1140" alt="Screenshot 2026-09-20 141054" src="https://github.com/user-attachments/assets/0d17e9c0-96b0-4def-8a6e-52e2963fc168" />

---

# 2. Timing Analysis with Ideal Clocks Using OpenSTA

### `SKY130_D4_SK2`

This section introduces **Static Timing Analysis (STA)** using ideal clock assumptions.

### Labs Covered

| Lab      | Topic                                                          |
| -------- | -------------------------------------------------------------- |
| `SKY_L1` | Setup timing analysis and introduction to flip-flop setup time |
| `SKY_L2` | Introduction to clock jitter and uncertainty                   |
| `SKY_L3` | Configure OpenSTA for post-synthesis timing analysis           |
| `SKY_L4` | Optimize synthesis to reduce setup violations                  |
| `SKY_L5` | Basic timing ECO                                               |

---

# 2.1 Setup Timing Analysis

Setup timing verifies whether data reaches the capture flip-flop sufficiently before the active clock edge.

A typical timing path is:

```text
Launch Flip-Flop
       ↓
Combinational Logic
       ↓
Data Path
       ↓
Capture Flip-Flop
```

Setup analysis considers:

* Clock period
* Data-path delay
* Setup time
* Clock arrival
* Clock uncertainty
* Timing slack

---

# 2.2 Clock Jitter & Uncertainty

Ideal clocks do not represent all real-world clock variations.

Clock uncertainty provides timing margin for effects such as:

* Clock jitter
* Clock variation
* Clock skew assumptions
* Other timing uncertainties

These concepts are important for realistic timing analysis.

---

#  2.3 OpenSTA Post-Synthesis Timing Analysis

OpenSTA is configured to analyze the synthesized design using the appropriate timing libraries and constraints.

The analysis flow is:

```text
Synthesized Netlist
       +
Timing Library
       +
SDC Constraints
       ↓
     OpenSTA
       ↓
Timing Reports
       ↓
Slack Analysis
```

The generated reports are used to identify critical paths and timing violations.

---

#  2.4 Synthesis Optimization for Setup Violations

When setup violations occur, synthesis can be optimized to reduce critical-path delay.

The optimization process can involve:

* Cell selection
* Cell resizing
* Buffer insertion
* Logic optimization
* Timing-driven synthesis
* Critical-path optimization

The resulting timing slack is then analyzed using OpenSTA.

---

# 2.5 Basic Timing ECO

A timing ECO introduces targeted changes to improve the timing of specific paths without completely redesigning the logic.

The lab introduces:

* Timing ECO concepts
* Critical-path modification
* Cell-level changes
* Timing verification after ECO

<img width="1917" height="1136" alt="Screenshot 2026-09-20 141647" src="https://github.com/user-attachments/assets/db309a48-6447-4190-93be-4ca2ce6635a6" />
<img width="957" height="1135" alt="Screenshot 2026-09-20 215729" src="https://github.com/user-attachments/assets/60456558-530d-453d-af5b-ea55c2bf7227" />
<img width="1917" height="1140" alt="Screenshot 2026-09-20 220101" src="https://github.com/user-attachments/assets/57c9fd11-8d9d-486b-99b3-147ea15ef66a" />
<img width="1917" height="1136" alt="Screenshot 2026-09-20 222800" src="https://github.com/user-attachments/assets/04a603fe-40e2-4d4e-84ba-ed55159a1ec3" />
<img width="1917" height="1142" alt="Screenshot 2026-09-20 222826" src="https://github.com/user-attachments/assets/72fc9d27-c57d-4a80-b16c-53a61bbe947e" />
<img width="1917" height="1141" alt="Screenshot 2026-09-20 222841" src="https://github.com/user-attachments/assets/54eb5a12-2d94-42b2-973c-2df614b6caa9" />
<img width="1917" height="1141" alt="Screenshot 2026-09-20 222841" src="https://github.com/user-attachments/assets/717881fe-f1c2-4c61-81d9-725379147ea8" />

---

#  3. Clock Tree Synthesis — TritonCTS & Signal Integrity

### `SKY130_D4_SK3`

This section focuses on **Clock Tree Synthesis (CTS)** and the importance of a balanced clock distribution network.

### Labs Covered

| Lab      | Topic                                                   |
| -------- | ------------------------------------------------------- |
| `SKY_L1` | Clock tree routing and buffering using H-Tree algorithm |
| `SKY_L2` | Crosstalk and clock-net shielding                       |
| `SKY_L3` | Run CTS using TritonCTS                                 |
| `SKY_L4` | Verify CTS runs                                         |

---

# 3.1 Clock Tree Routing & H-Tree

The clock signal must be distributed from its source to multiple sequential elements.

An H-Tree provides a structured clock distribution architecture intended to maintain balanced clock paths.

Simplified representation:

```text
                 Clock Source
                      │
              ────────┼────────
              │                 │
           ───┼───           ───┼───
           │     │             │     │
          FF    FF            FF    FF
```

Clock-tree design focuses on controlling:

* Clock skew
* Clock latency
* Clock transition
* Clock fanout
* Clock routing

---

#  3.2 Crosstalk & Clock-Net Shielding

Clock signals can be affected by coupling from nearby signal nets.

This section introduces:

* Crosstalk
* Capacitive coupling
* Clock-net noise
* Signal integrity
* Clock shielding
* Routing considerations

Shielding can reduce unwanted coupling between sensitive clock nets and neighboring signal routes.

---

#  3.3 Clock Tree Synthesis Using TritonCTS

TritonCTS is used to construct the clock distribution network.

The basic flow is:

```text
Clock Source
     ↓
Clock Tree Construction
     ↓
Clock Buffer Insertion
     ↓
Clock Routing
     ↓
CTS Verification
```

Important CTS characteristics include:

* Clock skew
* Clock latency
* Clock fanout
* Buffer count
* Clock transition
* Clock connectivity

---

# 3.4 CTS Verification

After CTS, the generated clock tree is analyzed to verify its physical and timing characteristics.

Important checks include:

* Clock connectivity
* Clock buffers
* Clock fanout
* Clock latency
* Clock skew
* Clock routing
* Clock transition


---

#  4. Timing Analysis with Real Clocks Using OpenSTA

### `SKY130_D4_SK4`

This section performs timing analysis using the **real clock network generated after CTS**.

### Labs Covered

| Lab      | Topic                                                             |
| -------- | ----------------------------------------------------------------- |
| `SKY_L1` | Setup timing analysis using real clocks                           |
| `SKY_L2` | Hold timing analysis using real clocks                            |
| `SKY_L3` | Analyze timing with real clocks using OpenSTA                     |
| `SKY_L4` | Execute OpenSTA with correct timing libraries and CTS assignment  |
| `SKY_L5` | Observe the impact of larger CTS buffers on setup and hold timing |

---

# 4.1 Setup Timing with Real Clocks

After CTS, the clock is no longer treated as an ideal signal.

The timing path now includes the physical clock network:

```text
Clock Source
     ↓
Clock Tree
     ↓
Launch Flip-Flop
     ↓
Combinational Logic
     ↓
Capture Flip-Flop
     ↑
Clock Tree
```

Clock arrival differences can therefore influence setup timing and slack.

---

#  4.2 Hold Timing with Real Clocks

Hold timing verifies that data does not arrive too early at the capture flip-flop after the active clock edge.

Hold timing is affected by:

* Minimum data-path delay
* Clock skew
* Clock latency
* Cell delay
* Routing delay
* Clock-tree implementation

---

# 4.3 Real-Clock Timing Analysis Using OpenSTA

Post-CTS timing analysis combines the routed clock network with the design timing constraints.

The flow is:

```text
Post-CTS Netlist
       +
Timing Libraries
       +
SDC Constraints
       +
CTS Clock Network
       ↓
     OpenSTA
       ↓
Setup Analysis
       +
Hold Analysis
       ↓
Timing Reports
```

---

# 4.4 Correct Timing Libraries & CTS Assignment

OpenSTA must use the appropriate timing libraries and clock definitions for accurate analysis.

The lab covers:

* Timing-library selection
* Clock definitions
* CTS clock assignment
* SDC constraints
* Post-CTS timing analysis
* Setup and hold reports

---

#  4.5 Impact of Larger CTS Buffers

The effect of increasing CTS buffer sizes is studied by observing changes in the clock network and timing results.

Changing CTS buffer characteristics can affect:

* Clock latency
* Clock transition
* Clock skew
* Setup slack
* Hold slack
* Clock-tree power

This demonstrates the trade-offs involved in clock-tree optimization.

---

#  Timing Concepts Covered

| Concept               | Description                                                       |
| --------------------- | ----------------------------------------------------------------- |
| **Setup Time**        | Minimum time data must be stable before the capture clock edge    |
| **Hold Time**         | Minimum time data must remain stable after the capture clock edge |
| **Slack**             | Difference between required and actual timing                     |
| **Clock Jitter**      | Variation in clock arrival over time                              |
| **Clock Uncertainty** | Timing margin representing clock variations                       |
| **Clock Skew**        | Difference in clock arrival times                                 |
| **Clock Latency**     | Time taken for a clock signal to reach a sequential element       |
| **Clock Tree**        | Network used to distribute the clock                              |
| **CTS**               | Clock Tree Synthesis                                              |
| **Crosstalk**         | Coupling between nearby signal nets                               |
| **Shielding**         | Technique used to reduce unwanted coupling                        |
| **ECO**               | Engineering Change Order for targeted design modification         |

---

#  Complete Module 4 Flow

```text
                         STANDARD CELLS
                              │
                              ▼
                       LAYOUT / LEF
                              │
                              ▼
                       TIMING LIBRARY
                              │
                              ▼
                         DELAY TABLES
                              │
                              ▼
                          SYNTHESIS
                              │
                              ▼
                   ┌────────────────────┐
                   │   IDEAL CLOCK STA  │
                   │                    │
                   │ Setup / Uncertainty│
                   └─────────┬──────────┘
                             │
                             ▼
                    SYNTHESIS OPTIMIZATION
                             │
                             ▼
                            CTS
                             │
                             ▼
                         TritonCTS
                             │
                             ▼
                    CLOCK TREE NETWORK
                             │
                             ▼
                   ┌────────────────────┐
                   │   REAL CLOCK STA   │
                   │                    │
                   │ Setup + Hold       │
                   └─────────┬──────────┘
                             │
                             ▼
                     TIMING OPTIMIZATION
                             │
                             ▼
                       TIMING CLOSURE
```

---

# Key Concepts Learned

### Timing Modelling

* Standard-cell LEF
* Timing libraries
* Liberty files
* Timing arcs
* Delay tables
* Cell delay
* Input transition
* Output load

### Static Timing Analysis

* Setup timing
* Hold timing
* Timing slack
* Critical paths
* Clock jitter
* Clock uncertainty
* Ideal-clock analysis
* Real-clock analysis
* Timing optimization
* Timing ECO

### Clock Tree Synthesis

* Clock distribution
* H-Tree
* Clock buffers
* Clock fanout
* Clock latency
* Clock skew
* Clock routing
* Crosstalk
* Clock shielding
* TritonCTS

### Post-CTS Timing

* Real-clock timing
* Setup analysis
* Hold analysis
* CTS-aware OpenSTA
* Timing-library selection
* CTS clock assignment
* CTS buffer impact
* Timing closure

---

#  Key Takeaway

This module demonstrates the importance of **timing analysis and clock-tree design in physical design**.

The transition from ideal-clock analysis to real-clock analysis shows how the physical implementation of the clock network can affect:

```text
Clock Distribution
       ↓
Clock Latency & Skew
       ↓
Setup / Hold Timing
       ↓
Timing Slack
       ↓
Timing Closure
```

A well-controlled clock network is therefore an important part of achieving reliable timing in a physical implementation.

---

# Conclusion

**SKY130 Module 4** provides practical exposure to the timing-analysis stage of the VLSI physical-design flow.

The module progresses from **timing libraries and delay tables** through **ideal-clock STA, synthesis optimization, timing ECOs, clock tree synthesis using TritonCTS, and real-clock setup/hold analysis using OpenSTA**.

The labs provide hands-on understanding of how **standard-cell timing, clock distribution, clock uncertainty, CTS, signal integrity, and physical implementation interact during timing closure**.

