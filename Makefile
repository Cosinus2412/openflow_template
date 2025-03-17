###############################################################################
#
#  IAIK Open Flow 2024 
#  ===================
# 
#  Authors: Leo Moser, Moritz Waser
#
#  Description:
#    Targets for the open-source hardware design flow.
#    All targets depend on our docker container:
#    	extgit.isec.tugraz.at:8443/sesys/iaik-open-flow/open-flow-docker
#

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
DISPLAY = host.docker.internal:0
else
DISPLAY ?= :0
endif

XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.open-flow.xauth
DOCKER_IMAGE=extgit.isec.tugraz.at:8443/sesys/iaik-open-flow/open-flow-docker:latest

PROJECT_DIR := $(shell dirname $(abspath $(lastword $(MAKEFILE_LIST))))

# Paths for open-flow
OPEN_FLOW_DIR ?= open-flow
EX1_DIR ?= $(OPEN_FLOW_DIR)/ex1_aux
EX2_DIR ?= $(OPEN_FLOW_DIR)/ex2_aux

# Default program
# Refers to a directory in ex2/sw/
# Change here or call make like 'make <target> PROGRAM=your_program'
PROGRAM ?= hello-world

LIBGLOSS_SRC = $(wildcard ex2/sw/libgloss/**/*)
SW_SRC = $(wildcard ex2/sw/$(PROGRAM)/*.c)
SW_BIN = ex2/sw/$(PROGRAM)/build/$(PROGRAM).bin

EX1_SRCS = ex1/src/cipher_pkg.sv \
           $(filter-out ex1/src/cipher_pkg.sv, $(wildcard ex1/src/*.sv))

# Sources for ex2/, cipher_core from ex1 is included
EX2_SRCS = ex1/src/cipher_pkg.sv \
           $(wildcard ex2/src/*.sv)

ROM_GDS = $(wildcard $(OPEN_FLOW_DIR)/tapeout/rom/macro/*/*.gds)

MODULE ?= cipher_core

DOCKERCOMMAND = docker run \
                -it \
								--rm \
								-e TEST_MODULE=$(MODULE) \
                -v $(PROJECT_DIR):/foss/designs:rw \
                $(DOCKER_IMAGE)

DOCKERCOMMAND_GUI = docker run \
                    -it \
                    -e DISPLAY=$(DISPLAY) \
                    -e XAUTHORITY=$(XAUTH) \
                    -v $(XSOCK):$(XSOCK):rw \
                    -v $(XAUTH):$(XAUTH):rw \
                    -v $(PROJECT_DIR):/foss/designs:rw \
                    $(DOCKER_IMAGE)


# start interactive bash subshell with command
BASH = /bin/bash -i -c

#==============================================================================
# DOCKER TARGETS
#==============================================================================

.PHONY: interactive gtkwave klayout

#------------------------------------------------------------------------------
# Manage xauth stuff inside docker
# Thanks to https://stackoverflow.com/a/25280523
$(XAUTH):
	touch $(XAUTH)
	xauth nlist $(DISPLAY) | sed -e 's/^..../ffff/' | xauth -f $(XAUTH) nmerge -
	chmod 755 $(XAUTH)

#------------------------------------------------------------------------------
# Run docker image in interactive mode, mounting xsocket, xauth, project dir
interactive: $(XAUTH)
	$(DOCKERCOMMAND_GUI)

#------------------------------------------------------------------------------
# run gtkwave inside docker
gtkwave: $(XAUTH)
	$(DOCKERCOMMAND_GUI) \
	$(BASH) 'gtkwave'

#------------------------------------------------------------------------------
# run klayout inside docker
klayout: $(XAUTH)
	$(DOCKERCOMMAND_GUI) \
	$(BASH) 'klayout -l /foss/pdks/sky130A/libs.tech/klayout/tech/sky130A.lyp'


#==============================================================================
# EX1 TARGETS
#==============================================================================

.PHONY: ex1-lint ex1-cocotb ex1-cocotb-gl ex1-gtkwave ex1-openlane ex1-openroad ex1-klayout

#------------------------------------------------------------------------------
# lint ex1
ex1-lint:
	$(DOCKERCOMMAND) \
	$(BASH) 'verilator --lint-only ${EX1_SRCS} && echo "No errors found!" || echo "Found errors!" ' 

#------------------------------------------------------------------------------
# Simulate ex1 with cocotb

ex1-cocotb-counter:
	$(DOCKERCOMMAND) \
	$(BASH) 'cd ex1/tb/ && python3 tb_counter.py'

ex1-cocotb:
	$(DOCKERCOMMAND) \
	$(BASH) 'cd ex1/tb/ && python3 tb_cocotb.py'

#------------------------------------------------------------------------------
# Simulate EX1 gate-level netlist with cocotb
ex1-cocotb-gl:
	$(DOCKERCOMMAND) \
	$(BASH) 'cd ex1/tb/ && GL=1 python3 tb_cocotb.py'

#------------------------------------------------------------------------------
# View EX1 simulation traces in GTKwave
ex1-gtkwave: $(XAUTH)
	$(DOCKERCOMMAND_GUI) \
	$(BASH) 'gtkwave ex1/tb/sim_build/dump.vcd'

#------------------------------------------------------------------------------
# Convert ex1 files to standard verilog for synthesis using 'sv2v'
ex1/src/cipher_core.v: $(EX1_SRCS)
	$(DOCKERCOMMAND) \
	$(BASH) 'sv2v $^ -v --top=cipher_core -w ex1/src/cipher_core.v'

#------------------------------------------------------------------------------
# Run OpenLane flow (empty target to avoid rerunning openlane everytime)
ex1-openlane: ex1/src/cipher_core.v
	$(DOCKERCOMMAND) \
	$(BASH) 'openlane --design-dir results/ex1_runs/ --manual-pdk --pdk-root $$PDK_ROOT $(EX1_DIR)/config.json --save-views-to results/ex1_macro'

#------------------------------------------------------------------------------
# Run OpenROAD
ex1-openroad: $(XAUTH)
	$(DOCKERCOMMAND_GUI) \
	$(BASH) 'openlane --design-dir results/ex1_runs/ --manual-pdk --pdk-root $$PDK_ROOT --flow openinopenroad --last-run $(EX1_DIR)/config.json'

#------------------------------------------------------------------------------
# View finished design with klayout
ex1-klayout: $(XAUTH)
	$(DOCKERCOMMAND_GUI) \
	$(BASH) 'openlane --design-dir results/ex1_runs/ --manual-pdk --pdk-root $$PDK_ROOT --flow OpenInKLayout --last-run $(EX1_DIR)/config.json'

#==============================================================================
# EX2 TARGETS
#==============================================================================

.PHONY: ex2-lint ex2-sw ex2-cocotb ex2-cocotb-gl ex2-gtkwave ex2-openlane ex2-openroad ex2-klayout

#------------------------------------------------------------------------------
# lint ex2
ex2-lint:
	$(DOCKERCOMMAND) \
	$(BASH) 'verilator --lint-only ${EX2_SRCS} && echo "No errors found!" || echo "Found errors!" ' 

#------------------------------------------------------------------------------
# libgloss build
ex2/sw/libgloss/build: $(LIBGLOSS_SRC)
	$(DOCKERCOMMAND) \
	$(BASH) 'mkdir -p ex2/sw/libgloss/build && cd ex2/sw/libgloss/build && cmake .. -DCMAKE_TOOLCHAIN_FILE=../../common/riscv32.cmake && cmake --build . && cmake --build . --target install'

#------------------------------------------------------------------------------
# user program build
$(SW_BIN): $(SW_SRC) ex2/sw/libgloss/build
	$(DOCKERCOMMAND) \
	$(BASH) 'mkdir -p ex2/sw/$(PROGRAM)/build && cd ex2/sw/$(PROGRAM)/build && cmake .. -DCMAKE_TOOLCHAIN_FILE=../../common/riscv32-ibex-newlib-nano.cmake && cmake --build . && riscv32-unknown-elf-objcopy -O binary $(PROGRAM) $(PROGRAM).bin'

#------------------------------------------------------------------------------
# build baremetal software for ibex
ex2-sw: $(SW_BIN)
	$(DOCKERCOMMAND) \
	$(BASH) 'python3 ex2/sw/makehex.py $< ex2/sw/program0.vmem 1024 && python3 ex2/sw/makehex.py $< ex2/sw/program1.vmem 1024 1024 && \cp -f ex2/sw/program0.vmem.bin $(OPEN_FLOW_DIR)/tapeout/rom/rom_4kbyte_inst0.bin && \cp -f ex2/sw/program1.vmem.bin $(OPEN_FLOW_DIR)/tapeout/rom/rom_4kbyte_inst1.bin'

#------------------------------------------------------------------------------
# Convert ex2 files to standard verilog for synthesis using 'sv2v'
ex2/src/cipher_wrapper_ex2.v: $(EX2_SRCS)
	$(DOCKERCOMMAND) \
	$(BASH) 'sv2v $^ -v --top=cipher_wrapper_ex2 -w ex2/src/cipher_wrapper_ex2.v'

#------------------------------------------------------------------------------
# Simulate ex2 with cocotb
ex2-cocotb: ex2-sw
	$(DOCKERCOMMAND) \
	$(BASH) 'cd ex2/tb/ && python3 tb_cocotb.py'

#------------------------------------------------------------------------------
# View EX1 simulation traces in GTKwave
ex2-gtkwave: $(XAUTH)
	$(DOCKERCOMMAND_GUI) \
	$(BASH) 'gtkwave ex2/tb/sim_build/dump.fst'

#------------------------------------------------------------------------------
# Simulate EX2 gate-level netlist with cocotb
ex2-cocotb-gl: ex2-sw
	$(DOCKERCOMMAND) \
	$(BASH) 'cd ex2/tb/ && GL=1 python3 tb_cocotb.py'

#------------------------------------------------------------------------------
# Run OpenLane flow
ex2-openlane: ex2/src/cipher_wrapper_ex2.v ex1/src/cipher_core.v
	$(DOCKERCOMMAND) \
	$(BASH) 'openlane --design-dir results/ex2_runs/ --manual-pdk --pdk-root $$PDK_ROOT $(EX2_DIR)/config.json --save-views-to results/ex2_macro'

#------------------------------------------------------------------------------
# Run OpenROAD
ex2-openroad: $(XAUTH)
	$(DOCKERCOMMAND_GUI) \
	$(BASH) 'openlane --design-dir results/ex2_runs/ --manual-pdk --pdk-root $$PDK_ROOT --flow openinopenroad --last-run $(EX2_DIR)/config.json'

#------------------------------------------------------------------------------
# View finished design with klayout
ex2-klayout: $(XAUTH)
	$(DOCKERCOMMAND_GUI) \
	$(BASH) 'openlane --design-dir results/ex2_runs/ --manual-pdk --pdk-root $$PDK_ROOT --flow OpenInKLayout --last-run $(EX2_DIR)/config.json'

#------------------------------------------------------------------------------
# unused - output file is already part of template
#.PHONY: ex2-def-openlane
#ex2-def-openlane: ex2/src/cipher_wrapper_ex2.v
#	$(DOCKERCOMMAND) \
#	$(BASH) 'cd open-flow/ex2_aux && python3 build.py'

#==============================================================================
# TAPEOUT
#==============================================================================

.PHONY: tapeout-chip_art tapeout-rom tapeout-final tapeout-klayout

#------------------------------------------------------------------------------
# process chip artwork for final tapeout
tapeout-chip_art:
	$(DOCKERCOMMAND) \
	$(BASH) 'cd open-flow/tapeout/chip_art/ && python3 chip_art.py && magic -noc -dnull -rcfile $$PDK_ROOT/$$PDK/libs.tech/magic/$$PDK.magicrc gds2lef.tcl'

#------------------------------------------------------------------------------
# create ROM macros for tapeout
tapeout-rom: ex2-sw
	$(DOCKERCOMMAND) \
	$(BASH) 'cd open-flow/tapeout/rom/ && python3 /usr/local/lib/python3.10/dist-packages/openram/rom_compiler.py sky130_rom_4kbyte_32_inst0.py && python3 /usr/local/lib/python3.10/dist-packages/openram/rom_compiler.py sky130_rom_4kbyte_32_inst1.py'

#------------------------------------------------------------------------------
tapeout-final:
	$(DOCKERCOMMAND) \
	$(BASH) 'python3 $(OPEN_FLOW_DIR)/tapeout/replace_cells.py $(OPEN_FLOW_DIR)/tapeout/caravel_openframe.gds.gz results/ex2_macro/gds/cipher_wrapper_ex2.gds HB_cipher_wrapper_ex2 $(OPEN_FLOW_DIR)/tapeout/rom/macro/sky130_rom_4kbyte_32_inst0/sky130_rom_4kbyte_32_inst0.gds HB_sky130_rom_4kbyte_32_inst0 $(OPEN_FLOW_DIR)/tapeout/rom/macro/sky130_rom_4kbyte_32_inst1/sky130_rom_4kbyte_32_inst1.gds HB_sky130_rom_4kbyte_32_inst1 $(OPEN_FLOW_DIR)/tapeout/chip_art/chip_art.gds HB_chip_art'
	@echo "\n\n********************************************\n Congratulations! Your tapeout is complete! \n********************************************\n\n"

#------------------------------------------------------------------------------
tapeout-klayout: $(XAUTH)
	$(DOCKERCOMMAND_GUI) \
	$(BASH) 'klayout chip_tapeout.gds -l /foss/pdks/sky130A/libs.tech/klayout/tech/sky130A.lyp'

.PHONY: clean
clean: 
	rm -rf ex1/src/*.v
	rm -rf ex2/src/*.v
	rm -rf ex1/tb/sim_build
	rm -rf ex1/tb/__pycache__
	rm -rf ex2/tb/sim_build
	rm -rf ex2/tb/__pycache__
	rm -rf ex2/sw/*/build
	rm -rf ex2/sw/*.vmem
	rm -rf ex2/sw/*.bin
	rm -rf open-flow/tapeout/rom/*.bin
	rm -rf sysroot
	rm -rf results/ex1_runs/runs/
	rm -rf results/ex2_runs/runs/
	rm -rf results/ex1_macro/
	rm -rf results/ex2_macro/
	rm -rf dump.vcd
