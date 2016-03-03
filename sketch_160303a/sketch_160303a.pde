PImage photo;
PrintWriter output;

void setup() {
  size(290, 174);
  photo = loadImage("red.png");
  photo.loadPixels();
  int width = photo.width;
  int height = photo.height;
  
  output = createWriter("pixels.txt");
  
  for (int i = 0; i < width * height; i++) {
    output.println(
    String.format("%3s", Integer.toBinaryString(floor ((photo.pixels[0] >> 16 & 0xFF) / 32))).replace(' ', '0') + "" + 
    String.format("%3s", Integer.toBinaryString(floor ((photo.pixels[0] >> 8 & 0xFF) / 32))).replace(' ', '0') + "" + 
    String.format("%3s", Integer.toBinaryString(floor ((photo.pixels[0] >> 4 & 0xFF) / 64))).replace(' ', '0'));
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