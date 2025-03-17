from PIL import Image
import klayout.db as db
import sys

def generate_macro(filename, macro_name="chip_art", macro_width=1000, macro_height=-1, threshold=50, max_density=0.8, background=True):

    image = Image.open(filename)
    image = image.convert('L')
    width, height = image.size
    
    pixel_map = image.load()
    
    if macro_height == -1:
        macro_height = macro_width/width*height

    print(f"Creating macro of size {macro_width} µm x {macro_height} µm")

    pixel_width = macro_width/width # µm
    pixel_height = macro_height/height # µm

    ly = db.Layout()

    met1 = (68, 20)
    met2 = (69, 20)
    met3 = (70, 20)
    met4 = (71, 20)
    met5 = (72, 20)

    # sets the database unit to 1 nm
    ly.dbu = 0.001

    # adds a single top cell
    top_cell = ly.create_cell(macro_name)

    # creates a new layer
    layer1 = ly.layer(met5[0], met5[1])

    # Draw the individual pixels
    for x in range(width):
        for y in range(height):
            if pixel_map[x,height-1-y] > threshold:
                density = pixel_map[x,height-1-y]/255 * max_density
                
                # creates a rectangle for the "on" pixel, units in µm
                rect = db.DBox(0, 0, pixel_width * density, pixel_height * density).moved(x * pixel_width, y * pixel_height)
                top_cell.shapes(layer1).insert(rect)

    # adds a background
    if background:
        layer2 = ly.layer(met4[0], met4[1])
        background = db.DBox(0, 0, macro_width, macro_height)
        top_cell.shapes(layer2).insert(background)
      
    # writes the layout to GDS
    ly.write(f"{macro_name}.gds")

if __name__ == "__main__":
    filename = "chip_art.png"
    if len(sys.argv) > 1:
        filename = sys.argv[1]

    generate_macro(filename, "chip_art", 1000, 500, 50, 1.0, False)
