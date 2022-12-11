from ImageGoNord import NordPaletteFile, GoNord
import sys
import re
from os import path, listdir

input_file = sys.argv[1]
output_file = sys.argv[2]
palette_path = "/home/tilman/dotfiles/image_go_nord/palettes/gruv/"



def main():

    go_nord = GoNord()
    go_nord.reset_palette()

    go_nord.set_palette_lookup_path(palette_path)
    go_nord.add_file_to_palette("gruvbox.txt")
    
    go_nord.enable_avg_algorithm()
    go_nord.enable_gaussian_blur()
    
    image = go_nord.open_image(input_file)
    go_nord.convert_image(image, save_path=output_file)
   
if __name__=="__main__":
    main()
