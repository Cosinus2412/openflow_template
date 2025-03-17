# SPDX-FileCopyrightText: © 2023 Leo Moser <leo.moser@pm.me>
# SPDX-License-Identifier: Apache-2.0

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
ENV_EMPTY = os.getenv("ENV_EMPTY")

# Reset coroutine
async def reset_dut(rst_ni, duration_ns):
    rst_ni.value = 0
    await Timer(duration_ns, units="ns")
    rst_ni.value = 1
    rst_ni._log.debug("Reset complete")

# Monitor parallel out
pario_output = ""
async def monitor_pario(dut):
    global pario_output
    while 1:
        await RisingEdge(dut.sys_clk_i)        
        if (dut.parout_valid_o.value):
            char = chr(dut.parout_o.value)
            pario_output += char
            print(char, end="", flush=True)

@cocotb.test()
async def simple_test(dut):
    """This test runs the program under sw/"""

    # Start the clock
    c = Clock(dut.sys_clk_i, 40, 'ns')
    await cocotb.start(c.start())
    
    output = ""
    cocotb.start_soon(monitor_pario(dut))

    if ENV_GL: # Apply power for gate-level simulation
        dut.VPWR.value = 1
        dut.VGND.value = 0

    # Execution will block until reset_dut has completed
    await reset_dut(dut.sys_rst_ni, 50)
    dut._log.info("Reset done")
    
    print("\nSimulation output:\n================================")
    
    # Wait for end of computing
    await RisingEdge(dut.eoc_o)

    for i in range(100):
        await RisingEdge(dut.sys_clk_i)

    print("")
    
    with open("pario.txt", 'w') as pario_f:
        pario_f.write(pario_output)

    print("\n\n")

def test_runner():
    # GL or RTL simulation
    if ENV_GL:
        sim = "icarus" # For GL we are using Icarus Verilog
        print("Running GL simulation!")
    else:
        sim = "verilator" # For RTL we are using Verilator (fast!)
        print("Running RTL simulation!")

    proj_path = Path(__file__).resolve().parent

    # RTL sources ibex soc, ram, rom and tb
    verilog_sources = [
        proj_path / "../../open-flow/ex2_aux/ibex-verilog/ibex.v",
        proj_path / "../../open-flow/ex2_aux/ibex-verilog/ibex_soc.v",
        proj_path / "../../open-flow/ex2_aux/ibex-verilog/ibex_soc/uart_rx.sv",
        proj_path / "../../open-flow/ex2_aux/ibex-verilog/ibex_soc/uart_tx.sv",
        proj_path / "../../open-flow/ex2_aux/ibex-verilog/ibex_soc/synchronizer.sv",
        proj_path / "models/sky130_rom_4kbyte_1r_32x1024.v",
        proj_path / "models/sky130_sram_2kbyte_1rw1r_32x512_8.v",
        proj_path / "tb_top.sv"
    ]
    
    hdl_toplevel = "tb_top"
    
    # Use the empty wrapper for cipher_wrapper_ex2
    if ENV_EMPTY:
        print("Using empty wrapper for cipher_wrapper_ex2")
        verilog_sources.append(proj_path / "cipher_empty/cipher_wrapper_ex2.sv")
        defines = [
            ("COCOTB", 1)
        ]
        build_args=["--trace-fst", "--trace-structs", "-Wno-fatal", "--no-timing"]
        plusargs=[]
    else:
        if ENV_GL:
            verilog_sources += [
                # GL netlist
                proj_path / "../../results/ex2_macro/pnl/cipher_wrapper_ex2.pnl.v",
                # Cell library from PDK
                Path(ENV_PDK_ROOT) / "sky130A/libs.ref/sky130_fd_sc_hd/verilog/primitives.v",
                Path(ENV_PDK_ROOT) / "sky130A/libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v"
            ]
            defines = [
                ("COCOTB", 1),
                ("ICARUS", 1),
                ("USE_POWER_PINS", 1),
                ("FUNCTIONAL", 1),
                ("UNIT_DELAY", "#0")
            ]
            build_args=[]
            plusargs=["-fst"]
        else:
            # RTL source files
            verilog_sources += glob.glob("../../ex1/src/*.sv")
            verilog_sources += glob.glob("../src/*.sv")
            # Move the package and interface to the front of list
            verilog_sources.remove("../../ex1/src/cipher_pkg.sv")
            verilog_sources.insert(0, "../../ex1/src/cipher_pkg.sv")
            verilog_sources.remove("../src/bus_if.sv")
            verilog_sources.insert(0, "../src/bus_if.sv")
            
            defines = [
                ("COCOTB", 1)
            ]
            build_args=["--trace-fst", "--trace-structs", "-Wno-fatal", "--no-timing", "--build", "-j", "0"]
            plusargs=[]

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
