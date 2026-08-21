# Module-3 – Combinational and Sequential Optimization

## Experiment Objective

The objective of this experiment is to understand optimization techniques used during RTL synthesis for combinational and sequential circuits. The experiment covers constant propagation, state optimization, cloning, and retiming. Practical Verilog examples are used to observe how synthesis tools identify redundant logic, constant values, and unnecessary hardware.

---

# 1. Constant Propagation

## Theory

Constant propagation is an optimization technique used during RTL synthesis. When a signal is known to have a fixed value, the synthesis tool can replace that signal with the constant directly.

This allows unnecessary logic to be removed from the design and can result in a smaller and more efficient circuit.

### Advantages

- Reduces redundant logic.
- Decreases hardware resource usage.
- Can improve circuit performance.
- Can reduce unnecessary switching activity.
- Helps optimize the synthesized circuit.

## Constant Propagation Example

![Constant Propagation Example](images/constant_propagation.png)

---

# 2. State Optimization

## Theory

State optimization is mainly used in Finite State Machines (FSMs). The purpose is to simplify the state machine while maintaining the same required functionality.

Different optimization techniques can be applied to an FSM.

### State Reduction

Equivalent states can be identified and combined so that the total number of states is reduced.

### State Encoding

Each state is assigned a suitable binary code. Proper encoding can help reduce the hardware required for state representation and transition logic.

### Logic Minimization

The Boolean expressions associated with state transitions and outputs can be simplified to reduce the amount of combinational logic.

### Power Optimization

Techniques such as clock gating can be used to reduce unnecessary switching activity and dynamic power consumption.

State optimization can improve the area, timing, and power characteristics of an FSM.

---

# 3. Cloning

## Theory

Cloning is a synthesis optimization technique in which a logic cell or module is duplicated to distribute the load between multiple copies.

If one cell has to drive a large number of destinations, its load can be divided among cloned cells. This can reduce fanout and improve timing.

## Cloning Process

1. Identify a critical or heavily loaded logic element.
2. Analyze the connections driven by that element.
3. Create additional copies of the required logic.
4. Distribute the loads between the copies.
5. Perform timing and power analysis to verify the improvement.

# 4. Retiming

## Theory

Retiming is a sequential circuit optimization technique in which registers or flip-flops are repositioned within the circuit without changing its overall functionality.

The main objective is to distribute combinational delays more evenly between registers. This can help reduce the critical path delay and improve the maximum operating frequency.

## Retiming Process

1. Represent the circuit as a directed graph.
2. Analyze the delays between registers.
3. Identify suitable locations for moving registers.
4. Reposition the registers while preserving functionality.
5. Verify timing and power after optimization.

Retiming is particularly useful in pipelined designs where timing performance is important.

---

# 5. Optimization Labs

The following experiments demonstrate different optimization possibilities using Verilog RTL and synthesis tools.

---

## Combinational Logic Optimization

### Verilog Code

```verilog
module opt_check (input a , input b , output y);
	assign y = a?b:0;
endmodule
Working

Working

The output y is controlled by the input a.

When a = 1, the output follows the value of b.

When a = 0, the output is assigned the constant value 0.

Therefore, the circuit selects between input b and the constant value 0.

The synthesis tool can analyze this logic and remove unnecessary hardware wherever possible.

Synthesis Command

Follow the synthesis procedure used in the Day 1 experiment.

Add the following command between abc -liberty and synth -top:

opt_clean -purge

The opt_clean -purge command helps remove unused and unnecessary logic from the design.

Lab 1 Output

Lab 2 – Constant Logic Optimization
Verilog Code
module opt_check2 (input a , input b , output y);
	assign y = a?1:b;
endmodule
Working

The input a determines which value is passed to the output.

When a = 1, the output y becomes 1.

When a = 0, the output y follows the value of b.

The circuit behaves like a 2-to-1 multiplexer where one input is permanently connected to logic 1.

Since one input has a fixed value, the synthesis tool can recognize the constant and simplify the resulting hardware.

Lab 2 Output

Lab 3 – Conditional Logic Optimization
Verilog Code
module opt_check2 (input a , input b , output y);
	assign y = a?1:b;
endmodule
Working

This experiment uses a conditional operator to determine the output.

The input a works as the selection signal.

When a = 1, the output y is assigned 1.

When a = 0, the output y takes the value of b.

The example demonstrates how constant values present in combinational logic can be recognized during synthesis and used for optimization.

Lab 3 Output

Lab 4 – Nested Conditional Logic Optimization
Verilog Code
module opt_check4 (input a , input b , input c , output y);
 assign y = a?(b?(a & c ):c):(!c);
 endmodule
Working

The module contains three inputs a, b, and c, and one output y.

The output is generated using nested conditional expressions. Some conditions in the original expression do not affect the final result and can therefore be simplified during synthesis.

The effective simplified expression is:

y = a ? c : !c

Therefore:

When a = 1, the output is c.
When a = 0, the output is !c.

This experiment demonstrates how redundant logic can be identified and removed during synthesis.

Lab 4 Output

Lab 5 – Sequential Logic with Constant Data
Verilog Code
module dff_const1(input clk, input reset, output reg q);
always @(posedge clk, posedge reset)
begin
	if(reset)
		q <= 1'b0;
	else
		q <= 1'b1;
end
endmodule
Working

This module represents a D flip-flop with an asynchronous reset.

When reset is active, the output q is immediately assigned 0.

When a positive edge of clk occurs while reset is inactive, the output q is assigned 1.

Thus, during normal operation, the flip-flop stores the constant value 1.

This experiment demonstrates sequential logic in which the stored data value is fixed.

Lab 5 Output

Lab 6 – Sequential Logic with Constant Output
Verilog Code
module dff_const2(input clk, input reset, output reg q);
always @(posedge clk, posedge reset)
begin
	if(reset)
		q <= 1'b1;
	else
		q <= 1'b1;
end
endmodule
Working

Both branches of the conditional statement assign the same value to q.

When reset = 1, the output q becomes 1.

When a positive edge of clk occurs while reset is inactive, q is also assigned 1.

Therefore, the output always receives the constant value 1.

This demonstrates how synthesis can identify redundant sequential logic when all possible conditions produce the same result.

Lab 6 Output

6. Summary

This experiment covered important optimization techniques used during RTL design and synthesis.

The main concepts studied were:

Constant Propagation: Replacing known signal values with constants to simplify the circuit.
State Optimization: Reducing FSM complexity by optimizing states, encoding, and associated logic.
Cloning: Duplicating logic to distribute loads and reduce fanout-related timing problems.
Retiming: Repositioning registers to distribute combinational delays more effectively.
Combinational Optimization: Simplifying conditional and redundant logic.
Sequential Optimization: Identifying constant and unnecessary sequential logic.

Six practical Verilog experiments were performed to understand these optimization concepts.

7. Result
Studied the concept of constant propagation.
Understood how fixed values can simplify RTL logic.
Learned the basic methods used for FSM state optimization.
Understood how cloning can distribute the load of logic cells.
Studied the purpose of retiming in sequential circuits.
Implemented combinational optimization examples using Verilog.
Observed constant-based optimization in conditional logic.
Implemented sequential circuits containing constant values.
Analyzed redundant sequential logic.
Successfully completed all six optimization experiments.
Conclusion

This experiment provided practical understanding of important optimization techniques used in RTL design and synthesis.

Constant propagation demonstrated how fixed values can simplify combinational logic. State optimization showed how FSM implementations can be reduced and made more efficient. Cloning demonstrated how duplicated logic can distribute loads and improve timing, while retiming showed how register placement can be adjusted to balance delays.

The six Verilog experiments provided practical exposure to both combinational and sequential optimization. These techniques are useful for developing digital circuits with improved area, timing, power consumption, and overall hardware efficiency.
