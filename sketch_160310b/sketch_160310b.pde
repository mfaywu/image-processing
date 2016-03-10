void setup() {
  size (400, 400);
  stroke (255);
  background (192, 64, 0);
}

void draw() {
  stroke (100);
  //background (192, 64, 0);
  line (150, 25, mouseX, mouseY);
  stroke (200);
  point(30, 30);
  stroke (100);
  fill (150);
  rectMode (CENTER);
  rect (100, 100, 20, 100);
  fill (255, 200, 200, 127);
  ellipse (100, 70, 60, 60);
  ellipse (81, 70, 16, 32);
  fill (0);
  noStroke();
  ellipse (119, 70, 16, 32);
  stroke (100);
  line (90, 150, 80, 160);
  line (110, 150, 120, 160);
}

void mousePressed() {
  saveFrame("output-####.png");
  background (192, 64, 0);
}