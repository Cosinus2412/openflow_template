# ISEC Open Template

This repository contains everything you need to design your own cipher and integrate it into a chip using open source tools.

# Prerequisites

First, make sure to initialize all submodules:

	git submodule update --init

Next, install docker:

* [Docker](https://docs.docker.com/engine/install/)

Finally, fetch the docker container with all the tools:

	docker pull extgit.isec.tugraz.at:8443/sesys/iaik-open-flow/open-flow-docker

### Linux

Linux is the recommended operating system for running the open source flow. Any distribution with docker installed should be able to run the flow.

### macOS

To be able to display the GUI applications under macOS, make sure to install [XQuartz](https://www.xquartz.org/).

### Windows

It is recommended to run the docker container from inside Windows Subsystem for Linux [(WSL)](https://learn.microsoft.com/en-us/windows/wsl/install).

# Exercise 1

Make targets:

- `ex1-lint` - Run the linter over your design files. It is recommended to fix all issues.
- `ex1-openlane` - Harden `cipher_core` with OpenLane 2
- `ex1-openroad` - View your hardened design with OpenROAD
- `ex1-klayout` - View your hardened design with KLayout
- `ex1-cocotb` - Run the RTL simulation for your design
- `ex1-cocotb-gl` - Run the GL simulation for your design (must be hardened)
- `ex1-gtkwave` - Open the simulation results after running an RTL or GL simulation

# Exercise 2

- `ex2-lint` - Run the linter over your design files. It is recommended to fix all issues.
- `ex2-openlane` - Harden `cipher_peripheral` with OpenLane 2
- `ex2-openroad` - View your hardened design with OpenROAD
- `ex2-klayout` - View your hardened design with KLayout
- `ex2-cocotb` - Run the RTL simulation for your design
- `ex2-cocotb-gl` - Run the GL simulation for your design (must be hardened)
- `ex2-gtkwave` - Open the simulation results after running an RTL or GL simulation

Note: To choose a different program than `hello-world`, set the `PROGRAM` environment variable.

- e.g. `PROGRAM=cipher-test make ex2-cocotb`
- e.g. `PROGRAM=cipher-test make ex2-cocotb-gl`

# Tapeout

To prepare your design for tapeout, a few things need to be performed. First the cipher peripheral will be integrated into the chip.

- `tapeout-chip_art` - Generate the chip art from the png image
- `tapeout-rom` - Generate the two ROMs using OpenRAM for the specified program
- `tapeout-final` - Replaces the empty cipher, the two ROMs and the chip art in the template chip with your macros.
- `tapeout-klayout` - View your final chip with KLayout

Note: To choose a different program than `hello-world`, set the `PROGRAM` environment variable.

- e.g. `PROGRAM=cipher-test make tapeout-rom`
