# Generic Makefile for Ibex applications
# Specify program name with PROG, object files with OBJ

SW_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

PYTHON := python3
RISCV_CC   := riscv64-unknown-elf-gcc
RISCV_DUMP := riscv64-unknown-elf-objdump
RISCV_OBJCOPY := riscv64-unknown-elf-objcopy

LD_SCRIPT := $(SW_DIR)/link.ld

CFLAGS = -march=rv32im_zicsr -mabi=ilp32 -static -mcmodel=medany \
         -fvisibility=hidden -nostdlib -nostartfiles -Wall \
         -I$(SW_DIR)/lib/

PROG ?= program
OBJ ?= main.o lib/uart.o

# add crt0 to object files
RISCV_OBJ := $(SW_DIR)/crt0.o $(OBJ)

all: $(PROG).vmem

dump: $(PROG).elf
	$(RISCV_DUMP) -D $<

$(PROG).elf: $(RISCV_OBJ) $(LD_SCRIPT)
	$(RISCV_CC) $(CFLAGS) -T $(LD_SCRIPT) $(RISCV_OBJ) -o $@

%.o: %.c
	$(RISCV_CC) $(CFLAGS) -c -o $@ $<

%.o: %.S
	$(RISCV_CC) $(CFLAGS) -c -o $@ $<

%.bin: %.elf
	$(RISCV_OBJCOPY) -O binary $^ $@

program0.vmem: program.bin makehex.py
	$(PYTHON) makehex.py $< $@ 1024

program1.vmem: program.bin makehex.py
	$(PYTHON) makehex.py $< $@ 1024 1024

clean:
	rm -f *.o *.elf *.bin *.vmem
