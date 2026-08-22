# Module 3 - Combinational and Sequential Optimization

This document covers the optimization techniques applied during logic synthesis for both combinational and sequential circuits, along with the corresponding laboratory exercises performed using Yosys.

---
## Introduction

Digital circuit optimization is an important stage of the synthesis process. After converting RTL into logic gates, the synthesis tool analyzes the circuit to remove unnecessary logic, simplify Boolean expressions, and generate an implementation that consumes less area while preserving the required functionality.

This session explored the optimization techniques Yosys applies to both combinational and sequential circuits.

---

## Combinational Logic Optimization

Combinational optimization reduces unnecessary logic **without changing circuit functionality**. The synthesis tool analyzes Boolean expressions and removes redundant hardware, producing a smaller and more efficient gate-level implementation.

### Objectives

- Reduce the number of logic gates.
- Simplify Boolean expressions.
- Minimize chip area.
- Improve circuit speed.
- Reduce power consumption.

---

## Sequential Logic Optimization

Sequential optimization applies to circuits containing memory elements such as flip-flops.

Unlike combinational optimization, the synthesis tool must **preserve the behavior of sequential elements** while removing unnecessary registers and simplifying the logic connected to them.

### Typical Goals

- Removing redundant flip-flops.
- Propagating constant values through sequential logic.
- Eliminating unreachable logic.
- Improving timing while maintaining functional equivalence.

### Sequential Optimization of D Flip-Flop
### Verilog Code:

```verilog
module dff_const1(input clk, input reset, output reg q);
always @(posedge clk, posedge reset)
begin
	if(reset)
		q <= 1'b0;
	else
		q <= 1'b1;
end
endmodule
```

### Figure 1:

<img width="1920" height="1060" alt="image" src="https://github.com/user-attachments/assets/8916a2ad-bd78-46dc-92b0-bcc2c0d44270" />

The synthesized circuit removes unnecessary sequential logic while preserving the behavior of the original design.

### Figure 2: Waveform Verification

<img width="1920" height="1060" alt="image" src="https://github.com/user-attachments/assets/5494e54e-dd87-49d4-99cb-2222e878c07d" />

---

## Constant Propagation

Constant propagation replaces signals that always carry a fixed logic value **directly with that constant** during synthesis.

Instead of implementing logic to compute an already-known value, the synthesis tool substitutes the constant and removes redundant gates.

### Advantages

- Reduces logic complexity.
- Decreases hardware utilization.
- Improves timing.
- Lowers power consumption.

### Figure 3: Constant Propagation Example

<img width="958" height="930" alt="WhatsApp Image 2026-08-19 at 10 58 38 PM" src="https://github.com/user-attachments/assets/1ae08c88-3da9-4bf0-8ec4-90b25f013a22" />

The synthesized netlist shows that constant-valued signals are propagated through the logic, allowing unnecessary gates to be removed during optimization.

---

## Unused Output Optimization

If a signal or output is never used by the remaining circuit, the synthesis tool recognizes that it has no effect on final functionality and **automatically removes it** during optimization.

This reduces the total gate count and prevents unnecessary hardware from being implemented.

This demonstrates that synthesis tools generate hardware only for logic that actually contributes to the final outputs.

### Figure 4: Logic Simplification after Optimization

<img width="1600" height="783" alt="WhatsApp Image 2026-08-19 at 11 01 44 PM" src="https://github.com/user-attachments/assets/cb834402-f7e5-4199-b02d-969e03b10337" />

The optimized netlist contains fewer logic gates while maintaining the same functionality as the original RTL design.

---

## State Optimization

Finite State Machines (FSMs) can contain equivalent or unnecessary states. During optimization, these states may be **merged or removed**, reducing the required hardware while preserving the original behavior.

### State Optimization Generally Includes

- Eliminating equivalent states.
- Efficient state encoding.
- Simplifying next-state logic.
- Reducing overall hardware complexity.

---

## Logic Cloning

Logic cloning is a performance optimization where selected logic cells are **duplicated** to reduce fan-out and improve timing.

Instead of one gate driving many loads, additional copies are created so each copy drives fewer destinations. This reduces delay on critical timing paths.

---

## Retiming

Retiming is a sequential optimization technique where flip-flops are **repositioned across combinational logic** without changing circuit functionality.

Its purpose is to balance propagation delays between pipeline stages and improve the maximum operating frequency.

Unlike other optimizations, retiming modifies only **register placement** while preserving the logical behavior of the design.

---

## Optimization Passes Performed in Yosys

During synthesis, Yosys automatically performs several optimization passes to simplify the generated hardware.

| Optimization Pass | Purpose |
|---|---|
| Constant propagation | Replace known-constant signals directly |
| Dead logic elimination | Remove logic with no effect on outputs |
| Boolean simplification | Reduce Boolean expressions |
| Removal of unused wires | Remove unreferenced signals |
| Removal of unused cells | Remove unreferenced gates/cells |
| Expression simplification | Simplify equivalent expressions |
| Resource sharing | Reuse hardware across similar operations |

These optimizations collectively produce an efficient gate-level netlist.

---

# Laboratory Exercises

## Constant Propagation

A simple combinational circuit was synthesized to observe how Yosys replaces constant values directly within the logic network.

After optimization, unnecessary gates were removed, producing a simpler implementation.

### Result

The constant value was propagated through the logic, reducing redundant hardware.

---

##  Logic Simplification

A multiplexer-based design was synthesized to demonstrate how Boolean expressions simplify when one input remains constant.

The synthesized circuit contained fewer logic gates while maintaining identical functionality.

### Result

The multiplexer logic was simplified because one of its inputs was fixed to a constant value.

---

## Expression Optimization

Additional combinational logic examples were analyzed to observe how the synthesis tool recognizes equivalent expressions and minimizes redundant hardware.

### Result

Equivalent expressions were simplified and redundant logic was reduced.

---

## Boolean Reduction

Nested conditional expressions were synthesized and optimized.

Yosys simplified the resulting Boolean equation, removing unnecessary logic while preserving the expected output.

### Result

The optimized design required less hardware while maintaining the same logical behavior.

---

## Sequential Optimization 

A D flip-flop with an asynchronous reset and constant assignment was synthesized.

Since the output eventually settled to a constant value, the synthesis tool simplified portions of the sequential logic.

### Result

Unnecessary sequential logic was identified and optimized while maintaining the expected behavior.

---

## Constant Register Optimization

A flip-flop whose output always remained at logic `1` was synthesized.

Since the register never changed state, Yosys optimized the circuit by removing unnecessary sequential elements and replacing them with constant logic wherever applicable.

### Constant Register Optimization
### Verilog Code:

```verilog
module dff_const2(input clk, input reset, output reg q);
always @(posedge clk, posedge reset)
begin
	if(reset)
		q <= 1'b1;
	else
		q <= 1'b1;
end
endmodule
```

### Figure 5:

<img width="1600" height="783" alt="WhatsApp Image 2026-08-19 at 10 34 06 PM" src="https://github.com/user-attachments/assets/941b30a1-73ee-4ff3-a1f9-0a981be9ce41" />

Since the register output always remains at logic `1`, Yosys replaces the flip-flop with constant logic, reducing hardware complexity.

### Figure 6: Waveform Verification

<img width="1600" height="783" alt="WhatsApp Image 2026-08-19 at 10 49 19 PM" src="https://github.com/user-attachments/assets/0cee48d6-648c-4fe6-836a-e2f47551204e" />

The waveform confirms that the optimized circuit produces the expected output behavior after synthesis.

### Figure 7: Final Optimized Netlist

<img width="958" height="930" alt="WhatsApp Image 2026-08-19 at 10 35 55 PM" src="https://github.com/user-attachments/assets/6472bf3d-d167-499c-b398-46f6800c2eba" />

The final synthesized netlist reflects the cumulative effect of multiple optimization passes performed by Yosys.

### Figure 8: Waveform Verification

<img width="1600" height="783" alt="WhatsApp Image 2026-08-19 at 10 52 37 PM" src="https://github.com/user-attachments/assets/fe487ce1-9cab-451c-a58e-4298d594cb44" />

---

# Verification of Optimization Results

## Optimization Check 1
## Verilog Code:

```verilog
module opt_check (input a , input b , output y);
	assign y = a?b:0;
endmodule
```

## Figure 9: 
<img width="1600" height="783" alt="WhatsApp Image 2026-08-19 at 10 31 16 PM" src="https://github.com/user-attachments/assets/408fe59e-644a-4478-a4d5-3935fd51b8ac" />


The generated netlist confirms that unnecessary logic has been removed.

---

## Optimization Check 2
Verilog Code:

```verilog
module opt_check2 (input a , input b , output y);
	assign y = a?1:b;
endmodule
```

## Figure 10:
<img width="1600" height="783" alt="WhatsApp Image 2026-08-19 at 10 32 20 PM" src="https://github.com/user-attachments/assets/a911e952-89c8-4968-9c0c-23168b4a900d" />


The optimized circuit preserves the original functionality while reducing hardware.

---

## Optimization Check 3
Verilog Code:

```verilog
module opt_check2 (input a , input b , output y);
	assign y = a?1:b;
endmodule
```

## Figure 11:

<img width="958" height="930" alt="WhatsApp Image 2026-08-19 at 10 45 37 PM" src="https://github.com/user-attachments/assets/f4822fc7-13bf-4e4f-adef-b81623edfc6e" />

This netlist demonstrates additional logic simplifications performed by Yosys.

---


## Laboratory Summary

| Lab | Focus | Key Result |
|---|---|---|
| 1 | Constant propagation | Redundant gates removed via constant substitution |
| 2 | Logic simplification | MUX simplified when one input was held constant |
| 3 | Expression optimization | Equivalent expressions merged/minimized |
| 4 | Boolean reduction | Nested conditionals reduced to simpler Boolean logic |
| 5 | Sequential optimization | D-FF with async reset simplified to constant-driven logic |
| 6 | Constant register optimization | Always-`1` flip-flop replaced with constant logic |

---

# Key Learning Outcomes

- Understood the difference between combinational and sequential optimization.
- Learned how constant propagation simplifies digital circuits.
- Observed removal of unused outputs and redundant logic during synthesis.
- Explored optimization techniques such as state optimization, logic cloning, and retiming.
- Analyzed how Yosys automatically performs multiple optimization passes to generate an efficient gate-level implementation.
- Verified optimization results using synthesized netlists and schematic visualization.

---

# Conclusion

Module 3 provided practical understanding of how synthesis tools optimize RTL designs.

The laboratory exercises demonstrated that Yosys can simplify combinational logic, remove redundant hardware, propagate constants, optimize sequential elements, and reduce unnecessary logic while preserving the intended functionality of the design.

These optimization techniques are important for achieving efficient **area, timing, and power** characteristics in digital hardware designs.
