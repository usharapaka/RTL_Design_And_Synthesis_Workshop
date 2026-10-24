# Yosys Synthesis

## Overview
The battery safety controller RTL was synthesized using Yosys as part of the OpenLane ASIC design flow with the SKY130 standard-cell library.

## Synthesis Results

| Parameter | Result |
|---|---:|
| Total wires | 56 |
| Public wires | 17 |
| Total cells | 50 |
| Memories | 0 |
| Processes | 0 |
| Yosys-reported chip area | 496.726400 |

## Files

- `1-yosys.log` — Yosys synthesis log.
- `1-yosys_4.stat.rpt` — Yosys cell statistics report.
- `battery_safety_controller.synthesis.v` — Synthesized Verilog netlist.

## Notes

The synthesis report lists 50 mapped standard cells from the SKY130 HD library. The reported chip area is the Yosys synthesis area value, not the final physical die area.

Refer to the log and statistics report for the detailed synthesis results.
