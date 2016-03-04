PImage photo;
PrintWriter output;
String image_title = "colors";

String[] lines;
String line;
boolean display_image;

int canvas_size = 500;

void setup() {
  size(500,500);
  background(0);
    
  display_image = false;
  photo = loadImage(image_title + ".png");
  photo.loadPixels();
  int width = photo.width;
  int height = photo.height;
  
  /*** Extracting pixels from image to file ***/
  
  output = createWriter("pixels-" + image_title + ".txt");
  
  for (int i = 0; i < height; i++) {
    for (int j = 0; j < width; j++) {
      output.print(
        String.format("%3s", Integer.toBinaryString(floor ((photo.pixels[i*j] >> 16 & 0xFF) / 32))).replace(' ', '0') + "" + 
        String.format("%3s", Integer.toBinaryString(floor ((photo.pixels[i*j] >> 8 & 0xFF) / 32))).replace(' ', '0') + "" + 
        String.format("%2s", Integer.toBinaryString(floor ((photo.pixels[i*j] >> 4 & 0xFF) / 64))).replace(' ', '0'));
    }
    output.println();
  }
  
  output.flush();
  output.close();
  
  println("Done! Yay!");
  
  /*** Testing: Rendering image from file ***/
  
  display_image = true;
  
  loadPixels();
  
  lines = loadStrings("pixels-" + image_title + ".txt");
  
  println("lines width: " + lines[0].length() + " should be 2320");
  println("lines height: " + lines.length + " should be 174");

  for (int i = 0; i < lines.length; i++) { //height
    for (int j = 0; j < lines[0].length(); j+=8) { // width
    
      int red = 32 * Integer.parseInt(lines[i].substring(j, j+3), 2);
      int green = 32 * Integer.parseInt(lines[i].substring(j+3, j+6), 2);
      int blue = 64 * Integer.parseInt(lines[i].substring(j+6, j+8), 2);
      
      color c = color(red, green, blue);
      
      pixels[(j / 8) + (i * canvas_size)] = c;
     
    }
  }
  
  println("wrote all the pixels");
  
  updatePixels();
}

void draw() {
  if (display_image) {
    //TODO: Render image from text file
    //image (photo, 0, 0);
  }
}