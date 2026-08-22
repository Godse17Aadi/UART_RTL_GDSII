# UART Simulation

This folder contains the testbench and simulation files used to verify the functionality of the UART controller.

## Files Included
* `uart_tb.v` - The main testbench file.
* `uart_top_design.v` - Top-level module linking the transmitter and receiver.
* `filelist.f` - List of source files for the simulator compilation.

## How to Run the Simulation
This project was simulated using Cadence Xcelium (`xrun`). To run the simulation, execute:
```bash
xrun -gui -access -rwc+ -f filelist.f &
```
