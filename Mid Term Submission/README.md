BabySoC Synthesis and Gate-Level Simulation (GLS)
Overview

This section documents the complete synthesis and Gate-Level Simulation (GLS) flow performed on the BabySoC design. The RTL design was synthesized using Yosys, mapped to the SKY130 standard-cell library, and verified through post-synthesis functional simulation using Icarus Verilog and GTKWave.

The overall flow followed was:
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
1. Reading the RTL Design

The synthesis flow begins by launching Yosys and reading the required Verilog source files for the BabySoC design.

yosys
read_verilog src/module/vsdbabysoc.v

read_verilog -I src/include/src/module/rvmyth.v

read_verilog -I src/include/src/module/clk_gate.v

The vsdbabysoc module represents the top-level design, while rvmyth and clk_gate provide supporting functionality required for the complete design hierarchy.

Figure 1: RTL Design Loading in Yosys

📸 Place Screenshot 1 here

This step confirms that the RTL source files are successfully loaded into the Yosys synthesis environment.

2. Loading Technology Libraries and Synthesizing the Design

The required Liberty files were loaded before synthesis. These libraries provide timing and functional information for the PLL, DAC, and SKY130 standard cells.

read_liberty -lib src/lib/avsdpll.lib 

read_liberty -lib src/lib/avsddac.lib 

read_liberty -lib src/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

synth -top vsdbabysoc

The synth command performs RTL synthesis using vsdbabysoc as the top-level module.

Figure 2: Initial Design Hierarchy

📸 Place Screenshot 2 here

The hierarchy visualization provides an initial view of the relationship between the major modules in the BabySoC design.

3. Synthesis Results and Design Statistics

After synthesis, Yosys reports information about the synthesized design, including the number of wires, ports, cells, and modules present in the hierarchy.

Figure 3: Synthesis Statistics and Design Hierarchy

📸 Place Screenshot 3 here

The synthesis statistics provide an overview of the complexity and composition of the synthesized BabySoC design.

4. Design Verification Using CHECK Pass

The synthesized design was verified using the Yosys check pass to identify obvious structural issues.

The verification result showed:

Found and reported 0 problems.

This confirms that no obvious structural problems were detected in the synthesized design.

Figure 4: Successful Yosys CHECK Pass

📸 Place Screenshot 4 here

5. Technology Mapping to SKY130 Standard Cells

After synthesis, the design was mapped to the SKY130 standard-cell library.

First, sequential elements were mapped using:

dfflibmap -liberty src/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

Then, combinational logic optimization and technology mapping were performed using ABC:

abc -liberty src/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

The resulting implementation contains mapped standard cells such as AND, OR, NAND, NOR, XOR, multiplexers, and flip-flops.

Figure 5: SKY130 Technology Mapping Results

📸 Place Screenshot 5 here

The ABC RESULTS output shows the different SKY130 standard cells selected during technology mapping.

6. Complete Synthesized Design Visualization

The synthesized design was visualized using the Yosys show command.

show vsdbabysoc

The complete visualization displays the internal connectivity of the synthesized design and demonstrates the complexity of the technology-mapped netlist.

Figure 6: Complete Synthesized Design Visualization

📸 Place Screenshot 6 here

This visualization represents the complete synthesized circuit and its internal standard-cell-level connections.

7. Simplified BabySoC Design Connectivity

A clearer visualization of the BabySoC hierarchy shows the main functional blocks and their connectivity.

The overall signal flow can be represented as:

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
Figure 7: Synthesized BabySoC Block Connectivity

📸 Place Screenshot 7 here

This view clearly shows the connection between the PLL, RISC-V core, and DAC blocks.

8. Preparing the Design for Netlist Generation

Before generating the final gate-level netlist, the design was flattened and cleaned.

flatten
setundef -zero
clean -purge
rename -enumerate

These commands perform the following operations:

flatten removes the hierarchical structure and creates a flattened representation.
setundef -zero replaces undefined values with logic zero.
clean -purge removes unused logic and unnecessary objects.
rename -enumerate systematically renames internal signals.

The design is then prepared for gate-level netlist generation.

9. Generating the Gate-Level Netlist

The synthesized and technology-mapped design was written into a Verilog gate-level netlist.

write_verilog -noattr baby_soc_netlist3.v

The generated netlist contains the flattened implementation of the BabySoC design, including internal wires and mapped logic cells.

Figure 8: Generated Gate-Level Netlist

📸 Place Screenshot 8 here

The generated Verilog netlist is used as the design representation for post-synthesis simulation.

10. Gate-Level Simulation Testbench

A common testbench was used to support both pre-synthesis and post-synthesis simulation.

Conditional compilation directives select the appropriate design representation.

`ifdef PRE_SYNTH_SIM

For pre-synthesis simulation, the RTL modules are included.

`elsif POST_SYNTH_SIM

For post-synthesis simulation, the synthesized netlist and required SKY130 models are included.

The testbench initializes important signals such as:

reset
VREF
REF
ENb_CP
ENb_VCO
VCO_IN
Figure 9: Gate-Level Simulation Testbench

📸 Place Screenshot 9 here

The testbench generates simulation waveforms for verifying the functionality of the BabySoC design before and after synthesis.

11. Post-Synthesis Functional Simulation

For the final Gate-Level Simulation, Icarus Verilog was used with the POST_SYNTH_SIM and FUNCTIONAL attributes.

sudo iverilog -DPOST_SYNTH_SIM -DFUNCTIONAL -I src/include/ -I ../../sky130RTLDesignAndSynthesisWorkshop/my_lib/verilog_model/ -I src/module/ src/module/testbench.v

The command options are used as follows:

Option	Purpose
-DPOST_SYNTH_SIM	Enables post-synthesis simulation
-DFUNCTIONAL	Enables functional models
-I src/include/	Includes required design files
-I ../../sky130RTLDesignAndSynthesisWorkshop/my_lib/verilog_model/	Includes SKY130 Verilog models
-I src/module/	Includes the BabySoC design modules

After successful compilation, the simulation was executed using:

./a.out

The generated waveform file was opened in GTKWave:

gtkwave post_synth_sim.vcd
12. Pre-Synthesis vs Post-Synthesis Functional Comparison

The final verification step involved comparing the Pre-Synthesis Simulation waveform with the Post-Synthesis Gate-Level Simulation waveform.

The important signals observed include:

CLK
reset
OUT
RV_TO_DAC
Figure 10: Pre-Synthesis and Post-Synthesis Waveform Comparison

📸 Place Screenshot 10 here

The waveforms were compared using GTKWave to verify that the synthesized implementation maintains the intended functional behavior of the RTL design.

Results

The BabySoC design successfully completed the synthesis and Gate-Level Simulation flow.

The following tasks were performed:

RTL source files were loaded into Yosys.
Required Liberty libraries were included.
The BabySoC design was synthesized with vsdbabysoc as the top module.
Design statistics and hierarchy were analyzed.
The synthesized design passed the Yosys CHECK pass with 0 reported problems.
Sequential and combinational logic were mapped to SKY130 standard cells.
The synthesized design was visualized.
The design hierarchy was flattened and cleaned.
A gate-level Verilog netlist was generated.
The design was compiled for post-synthesis functional simulation.
The -DFUNCTIONAL attribute was used for correct GLS behavior.
Post-synthesis waveforms were generated and viewed in GTKWave.
Pre-synthesis and post-synthesis outputs were compared.
Conclusion

The BabySoC RTL design was successfully synthesized and mapped to the SKY130 standard-cell library using Yosys. The synthesized design passed structural verification, and a gate-level netlist was generated for post-synthesis simulation.

The final Gate-Level Simulation was performed using Icarus Verilog with the POST_SYNTH_SIM and FUNCTIONAL compilation attributes. The generated post-synthesis waveform was compared with the pre-synthesis waveform using GTKWave to verify functional consistency.

This flow demonstrates the complete progression from RTL design → synthesis → technology mapping → gate-level netlist generation → post-synthesis functional verification.

