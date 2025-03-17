cif istyle sky130(vendor)
gds read chip_art.gds
load chip_art
lef write lef/chip_art -tech -toplayer -hide
exit
