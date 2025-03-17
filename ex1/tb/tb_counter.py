# SPDX-FileCopyrightText: © 2024 Leo Moser <leo.moser@pm.me>
# SPDX-License-Identifier: GPL-3.0-or-later

import os
import glob
import random
from pathlib import Path

import cocotb
from cocotb.clock import Clock
from cocotb.runner import get_runner
from cocotb.triggers import Timer, RisingEdge, FallingEdge
from cocotb.types import LogicArray

# Reset coroutine
async def reset_dut(rst_ni, duration_ns):
    rst_ni.value = 1
    await Timer(duration_ns, units="ns")
    rst_ni.value = 0
    rst_ni._log.info("Reset complete")


async def monitor_counter(dut):
    while 1:
        await FallingEdge(dut.clk_i)
        dut._log.info("=================================");
        dut._log.info(f"counter_value_o:   {dut.counter_value_o.value.integer}")
        dut._log.info(f"done_o:            {dut.done_o.value}")

# This is a simple test, you can create many more
# just add @cocotb.test() before an async function
@cocotb.test()
async def simple_test(dut):
    """ TODO Simple test for cipher_core """

    # TODO This is were you will be writing your testbench

    # Start the clock
    c = Clock(dut.clk_i, 10, 'ns')
    await cocotb.start(c.start())

    # Reset values
    dut.enable_i.value = 0 # Writing signals is not hard...

    # Execution will block until reset_dut has completed
    await reset_dut(dut.reset_i, 50)
    
    dut._log.info("=================================");
    dut._log.info(f"counter_value_o:   {dut.counter_value_o.value}")
    dut._log.info(f"done_o:            {dut.done_o.value}")
    
    # Wait for 10 clock cycles
    for i in range(10):
        await FallingEdge(dut.clk_i)

    dut.enable_i.value = 1
    
    # Monitor the counter value
    await cocotb.start(monitor_counter(dut))
    
    # Wait for completion
    await RisingEdge(dut.done_o)
    await FallingEdge(dut.clk_i)
    
    assert(dut.counter_value_o.value == 15)
    
    dut._log.info("Test finished!")
    
    # Have a look at the reference card of the cocotb documentation
    # https://docs.cocotb.org/en/latest/refcard.html
    # Here you can see a lot of the most important operations in cocotb

def test_runner():

    # RTL simulation
    sim = "verilator" # For RTL we are using Verilator (fast!)
    print("Running RTL simulation!")

    proj_path = Path(__file__).resolve().parent

    # RTL source files
    verilog_sources = glob.glob("../src/*.sv")
    # Move the package to the front of list
    verilog_sources.remove("../src/cipher_pkg.sv")
    verilog_sources.insert(0, "../src/cipher_pkg.sv")
    defines = [
        ("COCOTB", 1)
    ]
    
    hdl_toplevel = "counter"
    build_args=["--trace", "--trace-structs", "--build", "-j", "0"]
    plusargs=["--trace"]

    runner = get_runner(sim)

    runner.build(
        verilog_sources=verilog_sources,
        defines=defines,
        build_args=build_args,
        hdl_toplevel=hdl_toplevel,
        always=True
    )

    runner.test(
        hdl_toplevel=hdl_toplevel,
        test_module=Path(__file__).name.replace(".py",""),
        plusargs=plusargs
    )

if __name__ == "__main__":
    test_runner()
