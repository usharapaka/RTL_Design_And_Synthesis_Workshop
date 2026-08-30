# BabySoC Synthesis and Gate-Level Simulation (GLS)

## Overview

This section documents the complete synthesis and Gate-Level Simulation (GLS) flow performed on the BabySoC design. The RTL design was synthesized using Yosys, mapped to the SKY130 standard-cell library, and verified through post-synthesis functional simulation using Icarus Verilog and GTKWave.

The overall flow followed was:

```text
RTL Design
    ↓
Yosys Synthesis
    ↓
Technology Mapping
    ↓
Design Verification
    ↓
Gate-Level Netlist Generation
    ↓
Post-Synthesis Simulation
    ↓
Pre-Synthesis vs Post-Synthesis Comparison
```

---

## 1. Reading the RTL Design

The synthesis flow begins by launching Yosys and reading the required Verilog source files for the BabySoC design.

```bash
yosys
read_verilog src/module/vsdbabysoc.v

read_verilog -I src/include/src/module/rvmyth.v

read_verilog -I src/include/src/module/clk_gate.v
```

The `vsdbabysoc` module represents the top-level design, while `rvmyth` and `clk_gate` provide supporting functionality required for the complete design hierarchy.

### Figure 1: RTL Design Loading in Yosys


<img width="1920" height="1060" alt="image" src="https://github.com/user-attachments/assets/be80524e-5f66-49d8-bf79-24ba47af4333" />


This step confirms that the RTL source files are successfully loaded into the Yosys synthesis environment.

---

## 2. Loading Technology Libraries and Synthesizing the Design

The required Liberty files were loaded before synthesis. These libraries provide timing and functional information for the PLL, DAC, and SKY130 standard cells.

```bash
read_liberty -lib src/lib/avsdpll.lib 

read_liberty -lib src/lib/avsddac.lib 

read_liberty -lib src/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

synth -top vsdbabysoc
```

The `synth` command performs RTL synthesis using `vsdbabysoc` as the top-level module.

### Figure 2: Initial Design Hierarchy


<img width="1920" height="1060" alt="image" src="https://github.com/user-attachments/assets/08abefc6-1854-435e-b297-a831388c2553" />


The hierarchy visualization provides an initial view of the relationship between the major modules in the BabySoC design.

---

## 3. Synthesis Results and Design Statistics

After synthesis, Yosys reports information about the synthesized design, including the number of wires, ports, cells, and modules present in the hierarchy.

### Figure 3: Synthesis Statistics and Design Hierarchy


<img width="1920" height="1060" alt="image" src="https://github.com/user-attachments/assets/fca7327c-12ef-43e0-9d46-a691bdb3cbe1" />


The synthesis statistics provide an overview of the complexity and composition of the synthesized BabySoC design.

---

## 4. Design Verification Using CHECK Pass

The synthesized design was verified using the Yosys `check` pass to identify obvious structural issues.

The verification result showed:

```text
Found and reported 0 problems.
```

This confirms that no obvious structural problems were detected in the synthesized design.

### Figure 4: Successful Yosys CHECK Pass


<img width="1920" height="1060" alt="image" src="https://github.com/user-attachments/assets/f93166d7-9dc7-46ba-b4d5-47413e41932f" />


---

## 5. Technology Mapping to SKY130 Standard Cells

After synthesis, the design was mapped to the SKY130 standard-cell library.

First, sequential elements were mapped using:

```bash
dfflibmap -liberty src/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
```

Then, combinational logic optimization and technology mapping were performed using ABC:

```bash
abc -liberty src/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
```

The resulting implementation contains mapped standard cells such as AND, OR, NAND, NOR, XOR, multiplexers, and flip-flops.

### Figure 5: SKY130 Technology Mapping Results


<img width="1920" height="1060" alt="image" src="https://github.com/user-attachments/assets/804e5497-7e5b-4fcc-bb97-55c9526f8df8" />


The `ABC RESULTS` output shows the different SKY130 standard cells selected during technology mapping.

---

## 6. Complete Synthesized Design Visualization

The synthesized design was visualized using the Yosys `show` command.

```bash
show vsdbabysoc
```

The complete visualization displays the internal connectivity of the synthesized design and demonstrates the complexity of the technology-mapped netlist.

### Figure 6: Complete Synthesized Design Visualization


<img width="1920" height="1060" alt="image" src="https://github.com/user-attachments/assets/5e189e6c-5e49-45a6-a953-3f81abe6baff" />


This visualization represents the complete synthesized circuit and its internal standard-cell-level connections.

---

## 7. Simplified BabySoC Design Connectivity

A clearer visualization of the BabySoC hierarchy shows the main functional blocks and their connectivity.

The overall signal flow can be represented as:

```text
ENb_CP ─┐
ENb_VCO ┤
REF ────┤
VCO_IN ─┘
        │
        ▼
   +------------+
   |  avsdppll  |
   |    PLL     |
   +------------+
        │ CLK
        ▼
   +------------+
   |  rvmynth   |
   | RISC-V Core|
   +------------+
        │ RV_TO_DAC
        ▼
   +------------+
   |   avsdac   |
   |    DAC     |
   +------------+
        │
        ▼
       OUT
```

## 8. Preparing the Design for Netlist Generation

Before generating the final gate-level netlist, the design was flattened and cleaned.

```bash
flatten
setundef -zero
clean -purge
rename -enumerate
```

These commands perform the following operations:

- `flatten` removes the hierarchical structure and creates a flattened representation.
- `setundef -zero` replaces undefined values with logic zero.
- `clean -purge` removes unused logic and unnecessary objects.
- `rename -enumerate` systematically renames internal signals.

The design is then prepared for gate-level netlist generation.

---

## 9. Generating the Gate-Level Netlist

The synthesized and technology-mapped design was written into a Verilog gate-level netlist.

```bash
write_verilog -noattr baby_soc_netlist3.v
```

The generated netlist contains the flattened implementation of the BabySoC design, including internal wires and mapped logic cells.

### Figure 7: Generated Gate-Level Netlist


<img width="1920" height="1060" alt="image" src="https://github.com/user-attachments/assets/8cd53d63-3940-4309-bdb7-f7e0a5365ecf" />


The generated Verilog netlist is used as the design representation for post-synthesis simulation.

---

## 10. Gate-Level Simulation Testbench

A common testbench was used to support both pre-synthesis and post-synthesis simulation.

Conditional compilation directives select the appropriate design representation.

```verilog
`ifdef PRE_SYNTH_SIM
```

For pre-synthesis simulation, the RTL modules are included.

```verilog
`elsif POST_SYNTH_SIM
```

For post-synthesis simulation, the synthesized netlist and required SKY130 models are included.

The testbench initializes important signals such as:

- `reset`
- `VREF`
- `REF`
- `ENb_CP`
- `ENb_VCO`
- `VCO_IN`

### Figure 8: Gate-Level Simulation Testbench


 <img width="1920" height="1060" alt="image" src="https://github.com/user-attachments/assets/e7cd2cc5-6f0f-4e62-8fed-d30faf6cde9e" />


The testbench generates simulation waveforms for verifying the functionality of the BabySoC design before and after synthesis.

---

## 11. Post-Synthesis Functional Simulation

For the final Gate-Level Simulation, Icarus Verilog was used with the `POST_SYNTH_SIM` and `FUNCTIONAL` attributes.

```bash
sudo iverilog -DPOST_SYNTH_SIM -DFUNCTIONAL -I src/include/ -I ../../sky130RTLDesignAndSynthesisWorkshop/my_lib/verilog_model/ -I src/module/ src/module/testbench.v
```

The command options are used as follows:

| Option | Purpose |
|---|---|
| `-DPOST_SYNTH_SIM` | Enables post-synthesis simulation |
| `-DFUNCTIONAL` | Enables functional models |
| `-I src/include/` | Includes required design files |
| `-I ../../sky130RTLDesignAndSynthesisWorkshop/my_lib/verilog_model/` | Includes SKY130 Verilog models |
| `-I src/module/` | Includes the BabySoC design modules |

After successful compilation, the simulation was executed using:

```bash
./a.out
```

The generated waveform file was opened in GTKWave:

```bash
gtkwave post_synth_sim.vcd
```

---

## 12. Pre-Synthesis vs Post-Synthesis Functional Comparison

The final verification step involved comparing the Pre-Synthesis Simulation waveform with the Post-Synthesis Gate-Level Simulation waveform.

The important signals observed include:

- `CLK`
- `reset`
- `OUT`
- `RV_TO_DAC`

### Figure 9: Pre-Synthesis and Post-Synthesis Waveform Comparison


<img width="1592" height="768" alt="post and pre" src="https://github.com/user-attachments/assets/2c49be38-d656-429b-9763-c303e018534f" />


The waveforms were compared using GTKWave to verify that the synthesized implementation maintains the intended functional behavior of the RTL design.

---

# Results

The BabySoC design successfully completed the synthesis and Gate-Level Simulation flow.

The following tasks were performed:

- RTL source files were loaded into Yosys.
- Required Liberty libraries were included.
- The BabySoC design was synthesized with `vsdbabysoc` as the top module.
- Design statistics and hierarchy were analyzed.
- The synthesized design passed the Yosys CHECK pass with **0 reported problems**.
- Sequential and combinational logic were mapped to SKY130 standard cells.
- The synthesized design was visualized.
- The design hierarchy was flattened and cleaned.
- A gate-level Verilog netlist was generated.
- The design was compiled for post-synthesis functional simulation.
- The `-DFUNCTIONAL` attribute was used for correct GLS behavior.
- Post-synthesis waveforms were generated and viewed in GTKWave.
- Pre-synthesis and post-synthesis outputs were compared.

---

# Conclusion

The BabySoC RTL design was successfully synthesized and mapped to the SKY130 standard-cell library using Yosys. The synthesized design passed structural verification, and a gate-level netlist was generated for post-synthesis simulation.

The final Gate-Level Simulation was performed using Icarus Verilog with the `POST_SYNTH_SIM` and `FUNCTIONAL` compilation attributes. The generated post-synthesis waveform was compared with the pre-synthesis waveform using GTKWave to verify functional consistency.

This flow demonstrates the complete progression from:

**RTL Design → Synthesis → Technology Mapping → Gate-Level Netlist Generation → Post-Synthesis Simulation → Functional Verification**

---

# Assignment 

# Sequence Detector – RTL Design, Synthesis and Gate Level Simulation

## Objective

The objective of this experiment is to design and verify a sequence detector for the bit sequence:

```text
1111001
```

The complete flow includes RTL design, functional simulation, synthesis using Yosys, gate-level netlist generation, and Gate Level Simulation (GLS). The generated waveforms are analyzed using GTKWave.

---

# 1. Design Description

The sequence detector is implemented using a Finite State Machine (FSM). The FSM monitors the serial input `din` on every clock cycle.

The design progresses through different states as matching bits are received. When the complete sequence `1111001` is detected, the output `detected` becomes high.

### Input and Output Signals

| Signal | Type | Description |
|---|---|---|
| `clk` | Input | Clock signal |
| `reset` | Input | Reset signal |
| `din` | Input | Serial input data |
| `detected` | Output | Indicates successful sequence detection |

### Target Sequence

```text
1111001
```

---

# 2. RTL Design Code

The following Verilog code implements the sequence detector.

```verilog
`timescale 1ns/1ps

module sequence_detector (
input  wire clk,
input  wire reset,
input  wire din,
output reg  detected
);

localparam integer STATE_W = 3;
localparam integer NUM_STATES = 7;
// Target sequence: 1111001

reg [STATE_W-1:0] state;
reg [STATE_W-1:0] next_state;
reg next_detected;

always @(*) begin
    next_state = 'd0;
    next_detected = 1'b0;

    case (state)

        0: begin
            if (din == 1'b0) begin
                next_state = 0;
                next_detected = 1'b0;
            end else begin
                next_state = 1;
                next_detected = 1'b0;
            end
        end

        1: begin
            if (din == 1'b0) begin
                next_state = 0;
                next_detected = 1'b0;
            end else begin
                next_state = 2;
                next_detected = 1'b0;
            end
        end

        2: begin
            if (din == 1'b0) begin
                next_state = 0;
                next_detected = 1'b0;
            end else begin
                next_state = 3;
                next_detected = 1'b0;
            end
        end

        3: begin
            if (din == 1'b0) begin
                next_state = 0;
                next_detected = 1'b0;
            end else begin
                next_state = 4;
                next_detected = 1'b0;
            end
        end

        4: begin
            if (din == 1'b0) begin
                next_state = 5;
                next_detected = 1'b0;
            end else begin
                next_state = 4;
                next_detected = 1'b0;
            end
        end

        5: begin
            if (din == 1'b0) begin
                next_state = 6;
                next_detected = 1'b0;
            end else begin
                next_state = 1;
                next_detected = 1'b0;
            end
        end

        6: begin
            if (din == 1'b0) begin
                next_state = 0;
                next_detected = 1'b0;
            end else begin
                next_state = 1;
                next_detected = 1'b1;
            end
        end

        default: begin
            next_state = 'd0;
            next_detected = 1'b0;
        end

    endcase
end

always @(posedge clk) begin
    if (reset) begin
        state <= 'd0;
        detected <= 1'b0;
    end
    else begin
        state <= next_state;
        detected <= next_detected;
    end
end

endmodule
```

---

# 3. Testbench Code

The following testbench generates the clock, applies reset, provides the input bit sequence, counts detections, and generates a VCD waveform file.

```verilog
`timescale 1ns/1ps

module tb;

reg clk = 1'b0;
reg reset = 1'b1;
reg din = 1'b0;
wire detected;

sequence_detector dut (
    .clk(clk),
    .reset(reset),
    .din(din),
    .detected(detected)
);

always #6 clk = ~clk;

// Assessment instance: 24eg104d18

task drive_bit(input reg b);
    begin
        @(negedge clk);
        din = b;
        @(posedge clk);
        #1;
        $display("TIME=%0t NS DIN=%b DETECTED=%b", $time, din, detected);
    end
endtask

integer detection_count = 0;

always @(negedge clk) begin
    if (!reset && detected)
        detection_count = detection_count + 1;
end

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    // Initial reset.
    reset = 1'b1;
    repeat (4) @(posedge clk);
    @(negedge clk);
    reset = 1'b0;

    drive_bit(1'b0);
    drive_bit(1'b0);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b0);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b0);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b0);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b0);
    drive_bit(1'b0);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b0);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b0);
    drive_bit(1'b0);
    drive_bit(1'b0);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b0);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b0);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b0);
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b0);

    // Final reset.
    @(negedge clk);
    reset = 1'b1;
    repeat (2) @(posedge clk);

    #1;
    $display("FINAL_DETECTION_COUNT=%0d", detection_count);
    $finish;
end

endmodule
```

---

# 4. RTL Simulation

Before synthesis, the RTL design is simulated using the testbench.

## Compile the RTL Design

```bash
iverilog -o tb.out sequence_detector.v tb.v
```

## Run Simulation

```bash
vvp tb.out
```

The simulation generates the following VCD file:

```text
dump.vcd
```

## Open the Waveform

```bash
gtkwave dump.vcd
```

---

## RTL Simulation Waveform

The RTL waveform is used to verify the behavior of the sequence detector before synthesis.

Signals observed:

- `clk`
- `reset`
- `din`
- `detected`


<img width="1600" height="852" alt="WhatsApp Image 2026-08-29 at 11 08 44 AM" src="https://github.com/user-attachments/assets/602b4b39-b33b-48d2-8e41-5b6c96f1339c" />

---

# 5. RTL Synthesis Using Yosys

The Verilog RTL design is synthesized using Yosys.

## Start Yosys

```bash
yosys
```

## Read the Verilog Design

```tcl
read_verilog sequence_detector.v
```

## Set the Top Module

```tcl
hierarchy -top sequence_detector
```

## Perform Synthesis

```tcl
synth -top sequence_detector
```

## Display Statistics

```tcl
stat
```

## Generate the Gate-Level Netlist

```tcl
write_verilog sequence_detector_netlist.v
```

## Exit Yosys

```tcl
exit
```

---

# 6. Synthesis Result

The RTL design was successfully synthesized using Yosys.

The synthesis process converts the behavioral RTL description into a gate-level implementation consisting of combinational logic and sequential elements.

## Yosys Synthesis Output

<img width="1920" height="1060" alt="image" src="https://github.com/user-attachments/assets/182d1fd9-9246-44e9-b7e0-4dc2545de3fe" />


# 7. Gate-Level Schematic

The synthesized schematic can be generated using the Yosys `show` command.

```bash
yosys
```

Inside Yosys:

```tcl
read_verilog sequence_detector.v
hierarchy -top sequence_detector
synth -top sequence_detector
show
```

The schematic displays the logic generated after synthesis.

## Synthesized Schematic Output


<img width="720" height="1600" alt="WhatsApp Image 2026-08-29 at 11 43 02 AM" src="https://github.com/user-attachments/assets/b40099b0-3664-4510-bcbb-febc0ac4024b" />


# 8. Gate Level Simulation (GLS)

After synthesis, Gate Level Simulation is performed using the synthesized netlist.

For correct functional GLS using the SKY130 simulation models, compile using the `POST_SYNTH_SIM` and `FUNCTIONAL` definitions.

## GLS Compilation Command

```bash
sudo iverilog -DPOST_SYNTH_SIM -DFUNCTIONAL -I src/include/ -I ../../sky130RTLDesignAndSynthesisWorkshop/my_lib/verilog_model/ -I src/module/ src/module/testbench.v
```

## Run Gate-Level Simulation

```bash
./a.out
```

## Open the Generated VCD Waveform

```bash
gtkwave dump.vcd
```

---

# 9. Gate Level Simulation Waveform

The GTKWave output is used to verify the behavior of the synthesized sequence detector.

The following signals are observed:

| Signal | Description |
|---|---|
| `clk` | System clock |
| `reset` | Resets the FSM |
| `din` | Serial input data |
| `detected` | Indicates successful detection |

When the input sequence matches the target sequence `1111001`, the `detected` signal is asserted.

## GLS Waveform Output


<img width="1920" height="1060" alt="image" src="https://github.com/user-attachments/assets/cdadac9c-382e-482d-92f7-bd5eb1cf1541" />


# 10. Waveform Verification

The waveform verifies the operation of the sequence detector.

The verification process includes:

1. Applying reset to initialize the FSM.
2. Providing the input data stream through `din`.
3. Monitoring state progression indirectly through the output behavior.
4. Checking the `detected` signal when the target sequence is received.
5. Comparing the synthesized design behavior through Gate Level Simulation.

The waveform confirms that the synthesized netlist responds to the applied input sequence.

---

# Results

The following tasks were successfully completed:

- RTL design of the sequence detector
- Testbench development
- RTL functional simulation
- VCD waveform generation
- Waveform analysis using GTKWave
- RTL synthesis using Yosys
- Gate-level netlist generation
- Gate-level schematic generation
- Gate Level Simulation (GLS)
- Verification of synthesized design behavior

---

# Conclusion

A sequence detector for the target sequence `1111001` was successfully implemented using Verilog HDL.

The design was first verified at the RTL level using the developed testbench. The RTL was then synthesized using Yosys to generate a gate-level representation.

Finally, Gate Level Simulation was performed using the synthesized design and the functional simulation models. The generated waveform was analyzed using GTKWave to verify the behavior of the `clk`, `reset`, `din`, and `detected` signals.

Thus, the complete RTL design, synthesis, and Gate Level Simulation flow was successfully completed.

