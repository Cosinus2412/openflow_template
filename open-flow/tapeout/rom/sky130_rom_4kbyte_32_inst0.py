"""
Configuration for the ROM
"""

use_conda = False

tech_name = "sky130"
nominal_corner_only = True

route_supplies = "ring"
check_lvsdrc = False

word_size = 4

rom_data = "rom_4kbyte_inst0.bin"
data_type = "bin"

output_name = "sky130_rom_4kbyte_32_inst0"
output_path = "macro/{output_name}".format(**locals())
