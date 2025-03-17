#!/usr/bin/env python3

import glob
import os
import shutil
import sys

from typing import List, Type

from openlane.flows.sequential import SequentialFlow
from openlane.steps.odb import CustomIOPlacement
from openlane.steps import (
    Step,
    Yosys,
    OpenROAD,
    Misc,
)

class DefTemplateFlow(SequentialFlow):
    Steps: List[Type[Step]] = [
        Yosys.Synthesis,
        Misc.LoadBaseSDC,
        OpenROAD.Floorplan,
        CustomIOPlacement,
    ]

def run_flow():
    # Get PDK root out of environment
    PDK_ROOT = os.getenv('PDK_ROOT')

    # Create directory
    design_dir = "design"
    if not os.path.exists(design_dir):
        os.mkdir(design_dir)
    
    # Create destination directory
    if not os.path.exists("def"):
        os.mkdir("def")

    design_name = "cipher_wrapper_ex2"

    # Create and run custom flow
    flow_cfg = {
        # Main design properties
        "DESIGN_NAME"    : design_name,
        
        # Core ring
        "DESIGN_IS_CORE"   : True,
        "FP_PDN_CORE_RING" : True,

        # Sources
        "VERILOG_FILES"  : [
            f"../../ex2/src/{design_name}.v",
        ],
        
        # Power
        "VDD_NETS" : ["VPWR"],
        "GND_NETS" : ["VGND"],

        # Floorplanning
        "DIE_AREA"           : [0, 0, 1000, 1000],
        "FP_SIZING"          : "absolute",
        
        # Pin placement
        "FP_PIN_ORDER_CFG"   : "pins.cfg",

        # Synthesis
        "SYNTH_ELABORATE_ONLY" : True,
    }

    flow = DefTemplateFlow(
        flow_cfg,
        design_dir = design_dir,
        pdk_root   = PDK_ROOT,
        pdk        = "sky130A",
    )

    flow.start()

    # Collect and rename the build product
    m = list(sorted(glob.glob(os.path.join(design_dir, 'runs', '*', 'final', 'def', f'{design_name}.def'))))[-1]

    shutil.copyfile(m, f"def/{design_name}.def")


if __name__ == '__main__':
    run_flow()
