
---

#  `GLS/README.md`

```markdown
# Gate-Level Simulation (GLS)

This directory contains the files and scripts used to perform Gate-Level Simulation (GLS) of the synthesized UART design.

## Objective

Gate-Level Simulation is performed after synthesis to verify the behavior of the synthesized UART gate-level netlist.

Unlike RTL simulation, GLS uses the actual synthesized standard cells and gate-level netlist.

## GLS Flow

```text
UART Testbench
      |
      v
Synthesized UART Netlist
      |
      +---- Standard-Cell Verilog Libraries
      |
      +---- SDF Timing File
      |
      v
Gate-Level Simulation
      |
      v
Verify UART Functionality