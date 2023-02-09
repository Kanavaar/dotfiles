def main():
    from ImageGoNord import NordPaletteFile, GoNord
    
    go_nord = GoNord()
    
    go_nord.enable_avg_algorithm()
    go_nord.enable_gaussian_blur()
    
    image = go_nord.open_image("/home/tilman/Pictures/walls/gefaengnis/gefaengnis.png")
    go_nord.convert_image(image, save_path='/home/tilman/Pictures/walls/gefaengnis/gefaengnis_nord_blur.png')
   
if __name__=="__main__":
    main()
