
# Ibex Verilog

This repository contains the setup to convert the ![Ibex core](https://github.com/lowRISC/ibex) into Verilog.

## Prerequisites

Make sure to clone with submodules!

Install `python-requirements.txt` from ibex!

### Conversion

- ![FuseSoC](https://github.com/olofk/fusesoc)
- ![Synlig](https://github.com/chipsalliance/synlig)
- ![sv2v](https://github.com/zachjs/sv2v)

### Simulation

- Install a RISC-V compiler (e.g. `sudo apt install riscv64-unknown-elf-gcc`)
- ![cocotb](https://github.com/cocotb/cocotb)
- ![Verilator](https://github.com/verilator/verilator)
- ![GTKWave](https://github.com/gtkwave/gtkwave)

## Build the Ibex core

To convert the Ibex core into Verilog, call:

	> make ibex.v

This will export the necessary files via fusesoc and read them in via Yosys and the Synlig plugin. Yosys will process the SystemVerilog and write it as plain Verilog `ibex.v`.

## Build the Ibex SoC

To convert the Ibex SoC into Verilog, call:

	> make ibex_soc.v

This will process the SoC via sv2v and write the resulting Verilog file as `ibex_soc.v`.

## Run the Simulation

To run a simple simulation, call:

	> EMPTY=1 make simulation

This invokes cocotb with verilator as the underlying simulator to simulate the SoC with the Ibex core executing the program under `sw/`.

The resulting waveform will be stored under `sim_build/dump.fst` and can be viewed with GTKWave.