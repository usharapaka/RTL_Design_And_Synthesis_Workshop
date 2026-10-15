# VSDBabySoC Static Timing Analysis (STA)
## Multi-Corner Timing Analysis Across 18 SKY130 HD Timing Corners

![Technology](https://img.shields.io/badge/Technology-SKY130%20HD-blue)
![Tool](https://img.shields.io/badge/STA-OpenSTA-orange)
![Timing Corners](https://img.shields.io/badge/Timing%20Corners-18-green)
![Analysis](https://img.shields.io/badge/Analysis-Setup%20%26%20Hold-informational)

## 1. Project Overview

This project presents Static Timing Analysis (STA) of the synthesized VSDBabySoC design using OpenSTA and SKY130 HD standard-cell timing libraries.

The analysis evaluates minimum-delay and maximum-delay timing paths across 18 process, voltage, and temperature (PVT) timing corners. The generated timing reports are used to examine hold slack, setup slack, Worst Negative Slack (WNS), and Total Negative Slack (TNS).

The purpose is to identify timing-critical operating conditions and understand how process, voltage, and temperature affect the timing behavior of the design.

### Project Information

| Parameter | Details |
|---|---|
| Design | VSDBabySoC |
| Top module | `vsdbabysoc` |
| Assessment date | 19/09/2026 |
| Timing analysis tool | OpenSTA |
| Technology | SKY130 HD |
| Number of timing corners | 18 |
| Analysis type | Static Timing Analysis |
| Timing checks | Setup and hold |
| Main results | Minimum slack, maximum slack, WNS and TNS |

## 2. Introduction

Static Timing Analysis is a method used to verify the timing performance of a digital design without applying functional simulation vectors.

STA examines timing paths between sequential and combinational elements and determines whether the required setup and hold timing conditions are satisfied.

In this project, OpenSTA was used to analyze the synthesized VSDBabySoC netlist with SKY130 HD standard-cell timing libraries.

The analysis was performed across multiple PVT corners to evaluate timing behavior under different operating conditions.

## 3. Design and STA Files

The following files and directories are identified in the report.

| Item | Path |
|---|---|
| Synthesized netlist | `/home/vsduser/OpenSTA/BabySoC_Simulation/src/vsdbabysoc.synth.v` |
| SDC timing constraints | `/home/vsduser/Desktop/VSDBabySoC/src/sdc/vsdbabysoc_synthesis.sdc` |
| PLL library | `/home/vsduser/Desktop/VSDBabySoC/src/lib/avsdpll.lib` |
| DAC library | `/home/vsduser/Desktop/VSDBabySoC/src/lib/avsddac.lib` |
| SKY130 HD timing libraries | `/home/vsduser/Desktop/skywater-pdk-libs-sky130_fd_sc_hd/timing/` |

### 3.1 Synthesized Netlist

The synthesized netlist contains the design representation used for timing analysis.

**File:** `vsdbabysoc.synth.v`

### 3.2 SDC Timing Constraints

The Synopsys Design Constraints (SDC) file specifies timing requirements used by the STA flow.

**File:** `vsdbabysoc_synthesis.sdc`

### 3.3 PLL and DAC Libraries

The report identifies separate Liberty libraries for the PLL and DAC:

- `avsdpll.lib`
- `avsddac.lib`

These files are included in the design's timing-library setup.

### 3.4 SKY130 HD Timing Libraries

The SKY130 HD timing directory contains the characterized timing libraries used for multi-corner analysis.

Different libraries represent different process, voltage, and temperature conditions.

## 4. Understanding the 18 Timing Corners

A PVT corner represents a particular combination of semiconductor process behavior, operating voltage, and temperature.

The report uses FF, SS, and TT process designations:

- **FF (Fast-Fast):** Fast process behavior for the modeled device types.
- **SS (Slow-Slow):** Slow process behavior for the modeled device types.
- **TT (Typical-Typical):** Typical process behavior for the modeled device types.

Voltage and temperature also influence timing behavior.

### 4.1 Complete Timing-Corner List

The following 18 corners are listed in the supplied report.

| No. | Timing corner | Process | Temperature | Voltage |
|---:|---|---|---:|---:|
| 1 | `ff_100C_1v65` | Fast-Fast | 100°C | 1.65 V |
| 2 | `ff_100C_1v95` | Fast-Fast | 100°C | 1.95 V |
| 3 | `ff_n40C_1v56` | Fast-Fast | -40°C | 1.56 V |
| 4 | `ff_n40C_1v65` | Fast-Fast | -40°C | 1.65 V |
| 5 | `ff_n40C_1v76` | Fast-Fast | -40°C | 1.76 V |
| 6 | `ff_n40C_1v95` | Fast-Fast | -40°C | 1.95 V |
| 7 | `ff_n40C_1v95_ccsnoise` | Fast-Fast + CCS noise | -40°C | 1.95 V |
| 8 | `ss_100C_1v40` | Slow-Slow | 100°C | 1.40 V |
| 9 | `ss_100C_1v60` | Slow-Slow | 100°C | 1.60 V |
| 10 | `ss_n40C_1v28` | Slow-Slow | -40°C | 1.28 V |
| 11 | `ss_n40C_1v35` | Slow-Slow | -40°C | 1.35 V |
| 12 | `ss_n40C_1v40` | Slow-Slow | -40°C | 1.40 V |
| 13 | `ss_n40C_1v44` | Slow-Slow | -40°C | 1.44 V |
| 14 | `ss_n40C_1v60` | Slow-Slow | -40°C | 1.60 V |
| 15 | `ss_n40C_1v60_ccsnoise` | Slow-Slow + CCS noise | -40°C | 1.60 V |
| 16 | `ss_n40C_1v76` | Slow-Slow | -40°C | 1.76 V |
| 17 | `tt_025C_1v80` | Typical-Typical | 25°C | 1.80 V |
| 18 | `tt_100C_1v80` | Typical-Typical | 100°C | 1.80 V |

### 4.2 Importance of Multi-Corner Analysis

A design's timing behavior can vary across operating conditions. Analyzing multiple corners helps identify conditions in which timing requirements are met and conditions in which setup timing violations occur.

In this project, the reported FF and TT corners meet the listed setup and hold checks, while several SS corners exhibit negative maximum slack.

## 5. Static Timing Analysis Results

The following table reproduces the minimum slack, maximum slack, hold status, and setup status reported in the PDF.

| Timing corner | Min slack (ns) | Max slack (ns) | Hold | Setup |
|---|---:|---:|---|---|
| `ff_100C_1v65` | 0.25 | 4.05 | MET | MET |
| `ff_100C_1v95` | 0.20 | 5.57 | MET | MET |
| `ff_n40C_1v56` | 0.29 | 2.28 | MET | MET |
| `ff_n40C_1v65` | 0.26 | 3.41 | MET | MET |
| `ff_n40C_1v76` | 0.22 | 4.43 | MET | MET |
| `ff_n40C_1v95` | 0.19 | 5.59 | MET | MET |
| `ff_n40C_1v95_ccsnoise` | 0.19 | 5.59 | MET | MET |
| `ss_100C_1v40` | 0.91 | -17.12 | MET | VIOLATED |
| `ss_100C_1v60` | 0.64 | -7.87 | MET | VIOLATED |
| `ss_n40C_1v28` | 1.83 | -62.56 | MET | VIOLATED |
| `ss_n40C_1v35` | 1.35 | -39.70 | MET | VIOLATED |
| `ss_n40C_1v40` | 1.12 | -29.69 | MET | VIOLATED |
| `ss_n40C_1v44` | 0.99 | -23.91 | MET | VIOLATED |
| `ss_n40C_1v60` | 0.66 | -10.61 | MET | VIOLATED |
| `ss_n40C_1v60_ccsnoise` | 0.66 | -10.61 | MET | VIOLATED |
| `ss_n40C_1v76` | 0.50 | -4.38 | MET | VIOLATED |
| `tt_025C_1v80` | 0.31 | 1.94 | MET | MET |
| `tt_100C_1v80` | 0.31 | 2.09 | MET | MET |

**Key result:** All listed hold checks are reported as MET. Setup timing is MET at the listed FF and TT corners, while all listed SS corners show setup violations.

## 6. STA Analysis Methodology

The report describes the following analysis process:

1. Load the required Liberty timing libraries.
2. Read and link the synthesized VSDBabySoC netlist.
3. Apply the SDC timing constraints.
4. Execute OpenSTA timing checks for each configured timing corner.
5. Generate corner-specific timing reports.
6. Extract WNS, TNS, and minimum slack values.
7. Archive the generated reports.
8. Generate timing plots to compare results across corners.

The corner-specific reports provide the basis for comparing setup and hold timing behavior under different operating conditions.

## 7. Setup and Hold Timing Analysis

### 7.1 Hold Timing Analysis

Hold timing checks minimum-delay paths.

A hold requirement ensures that data does not change too soon after the relevant active clock edge.

The report shows positive minimum slack for all 18 listed corners.

The minimum reported slack is **0.19 ns**, occurring at:

- `ff_n40C_1v95`
- `ff_n40C_1v95_ccsnoise`

The maximum reported minimum slack is **1.83 ns**, occurring at `ss_n40C_1v28`.

These results indicate non-negative slack for the reported hold paths.

### 7.2 Setup Timing Analysis

Setup timing checks maximum-delay paths.

A setup requirement ensures that data arrives early enough before the relevant active clock edge.

The most negative reported maximum slack is **-62.56 ns** at `ss_n40C_1v28`.

The other listed SS corners also exhibit negative maximum slack.

The FF and TT corners in the supplied results show setup status as MET.

The negative setup slack at SS corners indicates that further investigation of the critical timing paths is required.

## 8. Worst Negative Slack (WNS)

Worst Negative Slack represents the worst timing slack identified for the relevant timing analysis.

The report includes automated WNS extraction and a graph comparing worst setup slack across the 18 timing corners.

### Key WNS Result

| Metric | Reported result |
|---|---|
| Worst setup slack | -62.56 ns |
| Critical corner | `ss_n40C_1v28` |
| Timing status at this corner | Setup VIOLATED |

The most severe setup result occurs at the SS, -40°C, 1.28 V corner.

The WNS graph shows a pronounced negative slack value at this corner compared with the other reported conditions.

## 9. Total Negative Slack (TNS)

Total Negative Slack summarizes the negative slack contributions across violating timing paths, as reported by the analysis.

The report includes automated TNS extraction and a graph showing the variation across 18 timing corners.

### Key TNS Result

| Metric | Reported result |
|---|---|
| Most negative reported TNS | Approximately -13,555.8 ns |
| Critical corner | `ss_n40C_1v28` |

The reported TNS graph shows its most negative value at `ss_n40C_1v28`.

This result indicates a significant setup-timing problem under that reported operating condition. Further investigation of the timing paths and constraints is needed to determine the causes and required optimizations.

## 10. Timing Quality Plots

The PDF includes graphs generated from the extracted timing metrics.

### 10.1 WNS Across 18 Timing Corners

The worst setup slack plot compares maximum-path slack across the configured corners.

The graph reaches approximately -62.6 ns at `ss_n40C_1v28`.

This identifies the corner with the most severe reported setup timing result.

### 10.2 TNS Across 18 Timing Corners

The TNS graph compares total negative slack across the configured corners.

The most negative reported value is approximately -13,555.8 ns at `ss_n40C_1v28`.

### 10.3 WNS and Minimum Hold Slack

The report also contains a graph comparing WNS and minimum hold slack across the timing corners.

The displayed hold slack values remain positive, while the setup results show negative values at the SS corners.

These plots provide a visual comparison of timing behavior across operating conditions.

## 11. Screenshot Evidence and Figure Descriptions

The STA flow, library setup, report generation, and timing results.

The figure descriptions below preserve the purpose of each screenshot.

### Figure 1 — OpenSTA Timing Analysis

Shows an OpenSTA timing path analysis.

<img width="448" height="471" alt="image" src="https://github.com/user-attachments/assets/9aab51f9-cf10-45a8-b3aa-fd61ba1e232b" />

The timing information includes arrival time, required time, and slack.

### Figure 2 — SDC Timing Constraint File

Shows the SDC clock and timing constraints used in the VSDBabySoC STA flow.

<img width="443" height="472" alt="image" src="https://github.com/user-attachments/assets/ffa73d90-c1d2-4ffc-b1c9-946a331ec709" />


### Figure 3 — OpenSTA Multi-Library Run Script

Shows the multi-library setup used to load libraries, the synthesized netlist, and SDC constraints before timing checks.

<img width="502" height="474" alt="image" src="https://github.com/user-attachments/assets/937fa352-8786-4207-92f9-41988af283bb" />

### Figure 4 — SKY130 HD Timing Library Files

Shows the SKY130 HD characterized timing libraries used for multi-corner analysis.

<img width="715" height="474" alt="image" src="https://github.com/user-attachments/assets/63b85cbc-d32b-40c1-b68b-c1c6dad346af" />

### Figure 5 — Multi-Corner STA Report Generation

Shows automated generation of individual STA reports for the configured timing corners.

<img width="780" height="438" alt="image" src="https://github.com/user-attachments/assets/53ff68f6-d4e0-4d40-8f23-29607628034f" />

### Figure 6 — Liberty File Inspection

Shows inspection of custom Liberty library pin and timing definitions.

<img width="780" height="440" alt="image" src="https://github.com/user-attachments/assets/aea8d6d6-408d-4f5d-b31f-031785746616" />

### Figure 7 — Hold Timing Analysis

Shows a minimum-delay timing path with positive hold slack and a MET result.

<img width="780" height="438" alt="image" src="https://github.com/user-attachments/assets/b66da847-b7e1-42f9-8772-6e85c429be93" />

### Figure 8 — Setup Timing Analysis

Shows a maximum-delay timing path used for setup timing and slack calculation.

<img width="780" height="439" alt="image" src="https://github.com/user-attachments/assets/4eb70b0a-0b89-4a16-913c-891c36bc3954" />

### Figure 9 — Slack Extraction Across 18 Corners

Shows corner-wise extraction of slack values from the generated timing reports.

<img width="780" height="439" alt="image" src="https://github.com/user-attachments/assets/b33257d2-db32-4d0d-8db4-1acfdf49ddcd" />

### Figure 10 — STA Report Archiving and Plot Generation

Shows the STA report archive and successful generation of timing plot files.

<img width="780" height="439" alt="image" src="https://github.com/user-attachments/assets/7354fdf1-bd05-4ff1-991c-c34f06192f76" />

### Figure 11 — Multi-Corner TNS/WNS Report Generation

Shows automated extraction of WNS and TNS across all 18 timing corners.

<img width="780" height="441" alt="image" src="https://github.com/user-attachments/assets/bf92b4d2-70bd-4a8e-90ef-022cc3346136" />

### Figure 12 — TNS and WNS Value Extraction

Shows extracted WNS and TNS values illustrating differences between fast and slow corners.

<img width="567" height="472" alt="image" src="https://github.com/user-attachments/assets/f9e9b2ee-3151-4c3a-b6cb-8a487e249be3" />

### Figure 13 — Completion of WNS/TNS Extraction

Shows completion of timing-metric extraction for the full 18-corner set.

<img width="780" height="430" alt="image" src="https://github.com/user-attachments/assets/3d3af7fd-7fcf-4d10-8bf8-ea676873a78d" />

### Figure 14 — Timing Quality Plot Generation

Shows the generated timing-quality plots used to compare WNS, TNS, and hold slack.

<img width="780" height="439" alt="image" src="https://github.com/user-attachments/assets/f5637ae0-e1ef-46ac-bc5c-186bf9520c52" />

### Figure 15 — Worst Setup Slack Across 18 SKY130 HD Corners

Shows the worst setup slack plot. The reported analysis reaches approximately -62.6 ns at `ss_n40C_1v28`.

<img width="780" height="439" alt="image" src="https://github.com/user-attachments/assets/63f74498-f768-403b-a7a1-28ff9f546318" />

### Figure 16 — Total Negative Slack Across 18 Corners

Shows the TNS plot, which reaches approximately -13,555.8 ns at `ss_n40C_1v28`.

<img width="780" height="443" alt="image" src="https://github.com/user-attachments/assets/e5873992-f00c-418e-a5aa-093ad4ca6412" />

### Figure 17 — WNS and Minimum Hold Slack Across 18 Corners

Shows the WNS and minimum-hold-slack views. The displayed hold slack values remain positive.

<img width="780" height="439" alt="image" src="https://github.com/user-attachments/assets/c09b6624-8ef4-4d77-9b19-26c2383cbdd6" />

## 12. Observations

The following observations are taken from the report's results and conclusion.

1. Minimum-delay checks are positive for all listed corners, indicating non-negative slack for the reported hold paths.
2. Maximum-delay results show positive slack for the FF and TT corners in the generated reports.
3. The SS corners contain negative maximum-path slack values, indicating setup timing violations under those conditions.
4. The most negative maximum-path slack occurs at the SS, -40°C, 1.28 V corner.
5. The reported WNS reaches -62.56 ns at `ss_n40C_1v28`.
6. The reported TNS reaches approximately -13,555.8 ns at the same corner.
7. Multi-corner STA reveals significant differences in timing behavior across operating conditions.
8. The generated reports and graphs provide information for identifying timing-critical corners and paths for further optimization.

## 13. Conclusion

Static Timing Analysis of the synthesized VSDBabySoC design was performed using OpenSTA and SKY130 HD timing libraries across 18 timing corners.

The analysis examined minimum-delay and maximum-delay paths and generated corner-specific timing reports and comparison plots.

The reported minimum slack values are positive across all listed corners, and the hold checks are reported as MET.

However, setup timing is violated at several SS corners. The worst reported setup slack is -62.56 ns at `ss_n40C_1v28`, where the reported TNS is approximately -13,555.8 ns.

These results demonstrate the importance of multi-corner STA in identifying timing-critical operating conditions. The detailed reports and graphs can be used to investigate critical paths and guide further timing optimization.

**Overall, the reported hold checks pass, but setup timing requires further investigation at the affected SS corners.**

## 14. Tools and Technologies

The following tools, files, and technologies are identified in the supplied report:

- OpenSTA for static timing analysis.
- SKY130 HD standard-cell timing libraries.
- Synthesized VSDBabySoC netlist.
- SDC timing constraints.
- PLL Liberty library.
- DAC Liberty library.
- Multi-corner STA run scripts.
- Corner-specific timing reports.
- WNS and TNS extraction.
- Timing quality plots for cross-corner comparison.

