# SPDX-FileCopyrightText: © 2022 Leo Moser <leo.moser@pm.me>
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

ENV_GL = os.getenv("GL", None)
ENV_PDK_ROOT = os.getenv("PDK_ROOT")

module_to_test = os.getenv("TEST_MODULE")

# Reset coroutine
async def reset_dut(rst_ni, duration_ns):
    rst_ni.value = 0
    await Timer(duration_ns, units="ns")
    rst_ni.value = 1
    rst_ni._log.info("Reset complete")


# This is a simple test, you can create many more
# just add @cocotb.test() before an async function
@cocotb.test(skip="cipher_core" != module_to_test)
async def simple_test(dut):
    
    # TODO This is were you will be writing your testbench

    # Start the clock
    c = Clock(dut.clk_i, 10, 'ns')
    await cocotb.start(c.start())

    # Reset values
    dut.key_i.value = 1 # Writing signals is not hard...
    dut.nonce_i.value = 1
    dut.data_len_i.value = 1
    dut.ad_len_i.value = 1
    dut.indata_i.value = 1
    dut.indata_valid_i.value = 1
    dut.outdata_ready_i.value = 1
    dut.start_i.value = 0
    if ENV_GL: # Apply power for gate-level simulation
        dut.VPWR.value = 1
        dut.VGND.value = 0

    # Execution will block until reset_dut has completed
    await reset_dut(dut.rst_ni, 50)
    
    # Wait for 100 clock cycles
    for i in range(100):
        await FallingEdge(dut.clk_i)

    dut._log.info("=================================");
    dut._log.info(f"indata_ready_o:  {dut.indata_ready_o.value}") # ...accessing signals neither
    dut._log.info(f"outdata_o:       {dut.outdata_o.value.integer}")
    dut._log.info(f"outdata_valid_o: {dut.outdata_valid_o.value}")
    dut._log.info(f"tag_o:           {dut.tag_o.value.integer}")
    dut._log.info(f"busy_o:          {dut.busy_o.value}")
    dut._log.info(f"finish_o:        {dut.finish_o.value}")
    
    # Wait for 100 clock cycles
    for i in range(100):
        await FallingEdge(dut.clk_i)
    
    dut.start_i.value = 1
    
    # Wait for 1000 clock cycles
    for i in range(1000):
        await FallingEdge(dut.clk_i)
    
    dut._log.info("=================================");
    dut._log.info(f"indata_ready_o:  {dut.indata_ready_o.value}")
    dut._log.info(f"outdata_o:       {dut.outdata_o.value.integer}")
    dut._log.info(f"outdata_valid_o: {dut.outdata_valid_o.value}")
    dut._log.info(f"tag_o:           {dut.tag_o.value.integer}")
    dut._log.info(f"busy_o:          {dut.busy_o.value}")
    dut._log.info(f"finish_o:        {dut.finish_o.value}")
    
    assert(1 == 1) # TODO assert something
    
    dut._log.info("Test finished!")
    
    # Have a look at the reference card of the cocotb documentation
    # https://docs.cocotb.org/en/latest/refcard.html
    # Here you can see a lot of the most important operations in cocotb

# ref functions 
def ref_mult(m1, m2):
    return m1 * m2


@cocotb.test(skip="multiplier" != module_to_test)
async def test_multiplier(dut):
    
    clock = Clock(dut.clk_i, 10, units="ns")
    cocotb.start_soon(clock.start())

    
    dut.reset_i.value = 1
    await Timer(20, units="ns")
    dut.reset_i.value = 0

  
    for _ in range(5):
        await RisingEdge(dut.clk_i)

    m1 = random.randint(0, 69) 
    m2 = random.randint(0, 69)  
 
    expected_result = ref_mult(m1, m2)

   
    dut.m1_i.value = m1
    dut.m2_i.value = m2
    dut.start_i.value = 1 


    await RisingEdge(dut.clk_i)
    dut.start_i.value = 0 

  
    while dut.done_o.value == 0:
        await RisingEdge(dut.clk_i)

     
    result = int(dut.multiplier_o.value)
    assert result == expected_result, f"Test failed: {m1} * {m2} != {result}, expected {expected_result}"

    dut._log.info(f"PASS: {m1} * {m2} = {result}")


def test_runner():

    # GL or RTL simulation
    if ENV_GL:
        sim = "icarus" # For GL we are using Icarus Verilog
        print("Running GL simulation!")
    else:
        sim = "verilator" # For RTL we are using Verilator (fast!)
        print("Running RTL simulation!")

    proj_path = Path(__file__).resolve().parent

    if ENV_GL:
        verilog_sources = [
            # Testbench
            proj_path / "cipher_wrapper_ex1_tb.sv",
            # GL netlist
            proj_path / "../../results/ex1_macro/pnl/cipher_wrapper_ex1.pnl.v",
            # Cell library from PDK
            Path(ENV_PDK_ROOT) / "sky130A/libs.ref/sky130_fd_sc_hd/verilog/primitives.v",
            Path(ENV_PDK_ROOT) / "sky130A/libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v"
        ]
        defines = [
            ("COCOTB", 1),
            ("USE_POWER_PINS", 1),
            ("FUNCTIONAL", 1),
            ("UNIT_DELAY", "#0")
        ]
        hdl_toplevel = "cipher_wrapper_ex1_tb"
        build_args=[]
        plusargs=["-fst"]
    else:
        # RTL source files
        verilog_sources = glob.glob("../src/*.sv")
        # Move the package to the front of list
        verilog_sources.remove("../src/cipher_pkg.sv")
        verilog_sources.insert(0, "../src/cipher_pkg.sv")
        defines = [
            ("COCOTB", 1)
        ]
        hdl_toplevel = module_to_test
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
