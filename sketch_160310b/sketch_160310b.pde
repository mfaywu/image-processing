//void setup() {
//  size (400, 400);
//  stroke (255);
//  background (192, 64, 0);
//}

//void draw() {
//  //frameRate(12);
  
//  //println(mouseX + " : " + mouseY);
  
//  background (192, 64, 0);
//  ellipse (mouseX, mouseY, 16, 32);
  
//  stroke (100);
//  //background (192, 64, 0);
//  line (150, 25, mouseX, mouseY);
//  stroke (200);
//  point(30, 30);
//  stroke (100);
//  fill (150);
//  rectMode (CENTER);
//  rect (100, 100, 20, 100);
//  fill (255, 200, 200, 127);
//  ellipse (100, 70, 60, 60);
//  ellipse (81, 70, 16, 32);
//  fill (0);
//  noStroke();
//  stroke (100);
//  line (90, 150, 80, 160);
//  line (110, 150, 120, 160);
//}

//void mousePressed() {
//  saveFrame("output-####.png");
//  background (192, 64, 0);
//}

void setup() {
  size (100, 100);
  noStroke();
  fill(0);
}

void draw() {
  background (204);
  if (mouseButton == LEFT) {
    fill (255);
  }
  else if (mouseButton == RIGHT) {
    fill (0);
  }
  else {
    fill (125);
  }
  if ((mouseX <= 50) && (mouseY <= 50)) {
    rect (0, 0, 50, 50); //UL
    stroke (200);
    textSize(40);
    text(key, 10, 10);
    fill (125);
  }
  else if ((mouseX <= 50) && (mouseY > 50)) {
    rect (0, 50, 50, 50); //LL
  }
  else if ((mouseX > 50) && (mouseY <= 50)) {
    rect (50, 0, 50, 50);
  }
  else {
    rect (50, 50, 50, 50);
  }
  
}