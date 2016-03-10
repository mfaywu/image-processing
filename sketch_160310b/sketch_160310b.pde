int choice;
int screen_width = 1000;
int screen_height = 1000;

void setup() {
  size (1000, 1000);
  choice = 0;
}

void draw() {
  background (255);
  switch (choice) {
    case 0: // Highlighting parts of a Shanara's body
    
      if (onShape ('r', 430, 330, 100, 200)) 
        fill (255, 255, 0);
      else 
        fill (255, 0, 255);
      rect (430, 330, 100, 200); // Body
      
      if (onShape ('e', 480, 240, 200, 250))
        fill (0, 255, 0);
      else
        fill (102, 255, 178);
      ellipse (480, 240, 200, 250); // Head
      
      fill (128);
      ellipse (435, 240, 50, 100); // Left eye
      ellipse (525, 240, 50, 100); // Right eye
      line (530, 400, 580, 380); // Right arm
      stroke (0);
      line (430, 400, 370, 380); // Left arm
      line (520, 530, 560, 600); // Right leg
      line (440, 530, 400, 600); // Left leg
      break;
    case 1: // implement fill algorithm?
      break;
    case 2: // 
      break;
    default: 
      break;
  }
}

boolean onShape(char shape, int x, int y, int w, int h) {
  switch (shape) {
     case 'r':  
       println("case r");
       if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) 
         return true;
       else 
           return false;
     case 'e': 
       //if (sqrt (sq (x - mouseX) + sq (y - mouseY) < 
       return true;
     default: 
       return true;
  }
}

void mousePressed() {
  println (mouseX + " : " + mouseY);
}

void keyPressed() {
  switch (key) {
    case 'a':
      choice = 0;
      break;
    case 'b':
      choice = 1;
      break;
    case 'c':
      choice = 2;
      break;
  }
}