PImage photo;
PrintWriter output;
String image_title = "matt";

void setup() {
  size(91, 102);
  photo = loadImage(image_title + ".png");
  photo.loadPixels();
  int width = photo.width;
  int height = photo.height;
  
  output = createWriter("pixels-" + image_title + ".txt");
  
  for (int i = width * height / 4; i < width * height; i++) {
    output.print(
    String.format("%3s", Integer.toBinaryString(floor ((photo.pixels[i] >> 16 & 0xFF) / 32))).replace(' ', '0') + "" + 
    String.format("%3s", Integer.toBinaryString(floor ((photo.pixels[i] >> 8 & 0xFF) / 32))).replace(' ', '0') + "" + 
    String.format("%3s", Integer.toBinaryString(floor ((photo.pixels[i] >> 4 & 0xFF) / 64))).replace(' ', '0'));
    if (i % width == 0) output.println();
  }
}

void draw() {
  image (photo, 0, 0);
}

void keyPressed() {
  output.flush();
  output.close();
  exit();
}