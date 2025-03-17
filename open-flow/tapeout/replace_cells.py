import pya
import sys

def main(args):

    if len(args) < 4:
        print(f"Usage: {args[0]} layout.gds cell_to_replace.gds instance_name \n \
cell_to_replace.gds instance_name \n \
cell_to_replace.gds instance_name \n \
cell_to_replace.gds instance_name \n")

    load_layout = args[1]
    
    cell_instance_map = []

    cell_instance_map.append((args[2], args[3]))
    cell_instance_map.append((args[4], args[5]))
    cell_instance_map.append((args[6], args[7]))
    cell_instance_map.append((args[8], args[9]))

    # Read in the harness
    ly1 = pya.Layout()
    ly1.read(load_layout)

    for cell, instance in cell_instance_map:

        print(f'Replacing instance {instance} with GDS {cell}')

        # Read in the cell to replace with
        ly2 = pya.Layout()
        ly2.read(cell)

        # replace the top cell of ly2 in ly1 (by name)
        # clears the original cell before the cell from b.gds is copied over.

        source_cell = ly2.top_cell()
        target_cell = ly1.cell(instance) #(source_cell.name)

        # Prune all subcells of target_cell
        target_cell.prune_subcells()
        
        # Empty the content of target_cell
        target_cell.clear()

        cm = pya.CellMapping()
        cm.for_single_cell_full(ly1, target_cell.cell_index(), ly2, source_cell.cell_index())
        ly1.copy_tree_shapes(ly2, cm)

    ly1.write("chip_tapeout.gds")


if __name__ == "__main__":
    main(sys.argv)
