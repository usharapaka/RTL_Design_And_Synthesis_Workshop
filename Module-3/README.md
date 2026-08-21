# Day 3 – Combinational and Sequential Logic Optimization

## Introduction

Day 3 of the RTL Design Workshop focused on understanding how synthesis tools optimize digital circuits.

The experiments covered both **combinational logic** and **sequential logic**. Using Yosys, the RTL designs were synthesized and optimized, and the resulting netlists were examined using the schematic viewer. Simulation waveforms were also checked using GTKWave.

The main purpose of these experiments was to understand how unnecessary hardware can be removed while preserving the required functionality of the design.

---

## Objectives

The main objectives of this session were:

- Understand the need for logic optimization during synthesis.
- Study optimization of combinational circuits.
- Study optimization of sequential circuits.
- Understand constant propagation.
- Observe removal of redundant logic.
- Analyze synthesized gate-level netlists.
- Verify sequential circuit behavior using waveforms.
- Understand how Yosys simplifies RTL during synthesis.

---

# Combinational Logic Optimization

Combinational logic produces an output based only on the present input values.

During synthesis, Yosys analyzes the Boolean logic described in the RTL and tries to generate a simpler implementation. Redundant operations, unnecessary gates, and logic that does not contribute to the output can be removed.

### Main objectives of combinational optimization

- Reduce the number of gates.
- Reduce hardware area.
- Simplify Boolean expressions.
- Reduce unnecessary switching activity.
- Improve the efficiency of the synthesized circuit.

---

# Sequential Logic Optimization

Sequential circuits contain storage elements such as flip-flops and registers.

Optimization of sequential circuits is slightly different from combinational optimization because the synthesis tool has to preserve the required clocked behavior.

Yosys can identify constant or unnecessary sequential logic and simplify the resulting implementation.

### Important areas of sequential optimization

- Constant registers
- Redundant registers
- Unused sequential logic
- Simplification of reset logic
- Simplification of logic connected to registers

---

# Constant Propagation

Constant propagation is an optimization technique in which a signal having a known fixed value is replaced by that value during synthesis.

For example, if a signal always remains at logic `1`, there is no need to implement additional logic to generate that signal. The constant can be propagated through the circuit and unnecessary hardware can be removed.

### Advantages

- Reduces logic complexity.
- Removes unnecessary gates.
- Reduces hardware utilization.
- Can improve timing.
- Reduces unnecessary switching activity.

---

# Unused Logic Optimization

A synthesis tool only needs to generate hardware that contributes to the required outputs.

If an internal signal or logic block does not affect any final output, it can be considered unnecessary. Yosys can remove such logic during optimization.

This helps produce a cleaner and smaller synthesized netlist.

---

# State Optimization

State optimization is mainly associated with finite state machines.

An FSM may contain unnecessary or equivalent states. During synthesis, the state-related logic can be simplified to reduce hardware requirements while preserving the required behavior.

### State optimization can involve:

- Removing unnecessary states.
- Identifying equivalent states.
- Simplifying next-state logic.
- Improving state encoding.
- Reducing overall hardware complexity.

---

# Logic Cloning

Logic cloning is a technique used mainly to improve timing when a logic cell has a high fan-out.

Instead of making one cell drive a large number of destinations, multiple copies of the logic can be created. Each copy then drives fewer loads.

This can reduce loading and improve timing on critical paths.

---

# Retiming

Retiming is a sequential optimization technique in which registers are repositioned around combinational logic.

The objective is to distribute the combinational delay more evenly between pipeline stages.

Retiming can help improve the maximum operating frequency without changing the intended logical behavior of the circuit.

---

# Yosys Optimization Passes

During synthesis, Yosys performs different types of optimization to simplify the generated hardware.

| Optimization | Purpose |
|---|---|
| Constant propagation | Replaces signals with known constant values |
| Dead logic removal | Removes logic that does not affect required outputs |
| Boolean simplification | Simplifies Boolean expressions |
| Wire optimization | Removes unnecessary signal connections |
| Cell optimization | Removes or simplifies unnecessary cells |
| Expression optimization | Reduces equivalent or redundant expressions |
| Sequential optimization | Simplifies unnecessary sequential logic |

These operations help convert the RTL into an efficient gate-level implementation.

---

# Laboratory Exercises

## Lab 1 – Constant Propagation

### Objective

To understand how constant values are propagated through a circuit during synthesis.

### Theory

When a signal has a fixed value, Yosys can substitute that value directly into the logic. Once this happens, some gates may become unnecessary and can be removed.

### Procedure

1. Write the required RTL design.
2. Load the design into Yosys.
3. Perform synthesis.
4. Apply the required optimization.
5. Generate the synthesized netlist.
6. Open the netlist using the schematic viewer.
7. Observe the optimized circuit.

### Verilog Code

> **Use the exact Verilog code from the workshop screenshot here.**
>
> Do not modify the code.

### Yosys Commands

> **Paste the exact Yosys commands from your screenshot here without changing them.**

### Observation

The synthesized circuit becomes simpler after the constant value is propagated through the logic.

### Result

Constant propagation successfully removed unnecessary logic from the synthesized circuit.

---

# Lab 2 – Logic Simplification

### Objective

To observe how Yosys simplifies combinational logic during synthesis.

### Theory

A Boolean expression may contain operations that become unnecessary when one or more inputs have fixed values.

During synthesis, Yosys analyzes the expression and generates only the logic required for the final output.

### Procedure

1. Load the RTL design into Yosys.
2. Synthesize the design.
3. Run the required optimization commands.
4. Generate the netlist.
5. View the synthesized circuit.
6. Compare the simplified structure with the original RTL.

### Verilog Code

> **Paste the exact Verilog code from the workshop here.**

### Yosys Commands

> **Paste the exact commands from the workshop here.**

### Observation

The optimized netlist contains fewer unnecessary logic elements.

### Result

The Boolean logic was simplified successfully without changing the intended functionality.

---

# Lab 3 – Expression Optimization

### Objective

To understand how equivalent or redundant expressions are optimized during synthesis.

### Theory

Different RTL expressions can sometimes produce the same logical result.

Yosys analyzes these expressions during synthesis and can remove redundant hardware when the same functionality can be achieved with a simpler implementation.

### Procedure

1. Load the RTL source into Yosys.
2. Synthesize the design.
3. Apply the optimization process.
4. Generate the gate-level netlist.
5. Examine the synthesized schematic.

### Verilog Code

> **Paste the exact Verilog code from the workshop here.**

### Yosys Commands

> **Paste the exact commands from the workshop here.**

### Observation

Equivalent or unnecessary logic is reduced in the synthesized representation.

### Result

Expression optimization reduced redundant hardware while maintaining the required functionality.

---

# Lab 4 – Boolean Reduction

### Objective

To study how Yosys reduces complex Boolean and conditional logic.

### Theory

Nested conditions can result in more hardware than necessary.

During synthesis, Boolean expressions are analyzed and simplified. Redundant operations can be removed when they do not affect the final output.

### Procedure

1. Load the RTL design.
2. Run synthesis.
3. Apply the optimization commands.
4. Generate the netlist.
5. Open the synthesized circuit.
6. Observe the simplified Boolean implementation.

### Verilog Code

> **Paste the exact Verilog code from the workshop here.**

### Yosys Commands

> **Paste the exact commands from the workshop here.**

### Observation

The synthesized circuit represents the required Boolean function using simplified logic.

### Result

The Boolean expression was successfully reduced during synthesis.

---

# Lab 5 – Sequential Optimization

## D Flip-Flop Optimization

### Objective

To observe how Yosys handles a D flip-flop containing reset and constant logic.

### Theory

A D flip-flop stores information according to the clock. When constant values are used in sequential logic, the synthesis tool can identify opportunities to simplify the resulting circuit.

The important requirement is that the required sequential behavior must be preserved.

### Verilog Code

> **Paste the exact Verilog code from your workshop screenshot here.**
>
> **Do not change even a single line.**

### Yosys Commands

> **Paste the exact Yosys commands from your workshop screenshot here.**

### Synthesized Netlist

![D Flip-Flop Synthesized Netlist](dff_const1_netlist.jpeg)

### Observation

The synthesized schematic shows the flip-flop, clock, reset and constant data connections.

The schematic provides a gate-level view of how the RTL description has been mapped during synthesis.

### Result

The D flip-flop design was successfully synthesized and its optimized structure was examined.

---

# Lab 6 – Constant Register Optimization

### Objective

To understand how a register with a constant output can be optimized.

### Theory

If the output of a register always remains at a fixed logic value, keeping a complete sequential data path may not be necessary.

The synthesis tool can recognize this constant behavior and replace unnecessary logic with a constant value wherever possible.

### Verilog Code

> **Paste the exact Verilog code from your workshop screenshot here.**

### Yosys Commands

> **Paste the exact commands from your workshop screenshot here.**

### Synthesized Netlist

![Constant Register Netlist](dff_const2_netlist.jpeg)

### Observation

The synthesized circuit shows the constant output behavior of the register.

The output is maintained at logic `1`, demonstrating the effect of constant-register optimization.

### Result

The constant register was successfully optimized and unnecessary sequential hardware was reduced.

---

# Verification of Optimization

The synthesized netlists were examined to understand how RTL Boolean operations are mapped into gate-level cells.

## Optimization Check 1

![Optimization Check 1](opt_check_netlist.jpeg)

The synthesized design shows the required logic implemented using a standard-cell gate.

The inputs are combined according to the Boolean operation specified in the RTL.

### Observation

The RTL operation is represented by an appropriate gate-level cell in the synthesized netlist.

---

## Optimization Check 2

![Optimization Check 2](opt_check2_netlist.jpeg)

This synthesized circuit demonstrates another Boolean operation mapped into a standard-cell implementation.

### Observation

The required logical relationship between the inputs and output is maintained after synthesis.

---

## Optimization Check 3

![Optimization Check 3](opt_check3_netlist.jpeg)

The schematic contains multiple inputs connected to the corresponding synthesized logic.

### Observation

The synthesized netlist represents the multi-input Boolean operation using an appropriate standard cell.

---

# Sequential Netlist Verification

## DFF Constant 1

![DFF Constant 1](dff_const1_netlist.jpeg)

The schematic represents the synthesized D flip-flop design with clock, reset and constant data connections.

This helps visualize the relationship between the RTL description and the synthesized sequential hardware.

---

## DFF Constant 3

![DFF Constant 3](dff_const3_netlist.jpeg)

The synthesized structure contains sequential elements together with the required control logic.

### Observation

The netlist demonstrates how sequential RTL is converted into standard-cell based hardware.

---

# Waveform Verification

After synthesis and simulation, the output waveforms were examined using GTKWave.

Waveform verification is important because the optimized circuit should still provide the expected behavior.

---

## DFF Constant 1 Waveform

![DFF Constant 1 Waveform](tb_dff_const1_waveform.jpeg)

The waveform displays the clock, reset and output signals.

The output behavior can be compared with the expected operation of the D flip-flop.

### Observation

The output follows the expected sequential behavior for the applied clock and reset conditions.

---

## DFF Constant 2 Waveform

![DFF Constant 2 Waveform](tb_dff_const2_waveform.jpeg)

The waveform contains the clock, reset and output signal.

### Observation

The output remains at the expected constant value during the displayed simulation.

This agrees with the constant-register optimization observed in the synthesized netlist.

---

## DFF Constant 3 Waveform

![DFF Constant 3 Waveform](tb_dff_const3_waveform.jpeg)

The waveform contains the clock, reset and sequential output signals.

### Observation

The waveform shows the sequential response of the circuit according to the applied clock and reset conditions.

---

# Counter Optimization

The synthesized counter design was also examined to understand how sequential and combinational logic appears after synthesis.

![Counter Optimization](counter_opt_netlist.jpeg)

### Observation

The synthesized netlist contains flip-flop based sequential elements together with the combinational logic required for the counter operation.

This demonstrates that optimization does not simply remove all hardware. Instead, the synthesis tool keeps the logic that is necessary to maintain the required functionality.

---

# Laboratory Summary

| Lab | Topic | Main Observation |
|---|---|---|
| 1 | Constant Propagation | Fixed values can remove unnecessary logic |
| 2 | Logic Simplification | Boolean logic can be represented using simpler hardware |
| 3 | Expression Optimization | Redundant or equivalent expressions can be simplified |
| 4 | Boolean Reduction | Complex conditions can be reduced during synthesis |
| 5 | Sequential Optimization | Constant sequential logic can be simplified |
| 6 | Constant Register Optimization | Constant register outputs can be replaced with simpler logic |

---

# Key Learning Outcomes

After completing Day 3, I was able to:

- Understand why optimization is required during synthesis.
- Differentiate between combinational and sequential optimization.
- Understand the concept of constant propagation.
- Identify redundant and unused logic.
- Analyze synthesized gate-level netlists.
- Understand how Boolean operations are mapped to standard cells.
- Observe optimization of constant registers.
- Examine D flip-flop synthesis.
- Verify sequential behavior using GTKWave.
- Relate RTL code to the synthesized hardware structure.
- Understand how Yosys improves the efficiency of a synthesized design.

---

# Conclusion

Day 3 provided practical experience with optimization techniques used during RTL synthesis.

The experiments showed how Yosys can simplify Boolean logic, propagate constant values, remove unnecessary hardware and optimize sequential circuits.

The synthesized schematics provided a clear view of the resulting gate-level implementation, while GTKWave was used to verify the behavior of the sequential designs.

Overall, the session helped in understanding how an RTL description is transformed into a simpler and more efficient hardware implementation while preserving the required functionality.
