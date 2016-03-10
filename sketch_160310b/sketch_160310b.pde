int choice;
int screen_width = 1000;
int screen_height = 1000;
color cursor_colour;
PFont pfont;

/*** Splash vars ***/
String letters = "";
 
/*** Program 1 Vars ***/
int side;

void setup() {
  size (1000, 1000);
  choice = -1;
  pfont = createFont ("Monospaced", 32);
}

void draw() {
  
  background (255);
  switch (choice) {
    
    /* Splash screen - Instructions */
    case -1:
      fill (0);
      textSize(24);
      textFont(pfont);
      text("Instructions: ", 100, 100);
      text(letters, 300, 300);
      noCursor();
      textSize(mouseX);
      text ("Hello World!", mouseX, mouseY);
      break;
      
    /*** Program 1 - Highlighting parts of a Shanara's body ***/
    case 0:
      // Body
      if (onShape ('r', 430, 330, 100, 200)) {
        fill (255, 255, 0);
        cursor_colour = color (255, 0, 0);
      }
      else {
        fill (255, 0, 255);
        cursor_colour = color (255, 204, 0);
      }
      rect (430, 330, 100, 200);
      
      // Head
      if (onShape ('e', 480, 240, 100, 125) 
        && !onShape('e', 435, 420, 25, 50)
        && !onShape ('e', 525, 240, 25, 50)) fill (0, 255, 0);
      else fill (102, 255, 178);
      ellipse (480, 240, 200, 250); 
      
      // Left eye
      if (onShape ('e', 435, 240, 25, 50)) fill (0, 255, 0);
      else fill (128);
      ellipse (435, 240, 50, 100); 
      
      // Right eye
      if (onShape ('e', 525, 240, 25, 50)) fill (0, 255, 0);
      else fill (128);      
      ellipse (525, 240, 50, 100); 
      
      // Appendages
      if (key == CODED) {
        if (keyCode == LEFT) side = -50;
        else if (keyCode == RIGHT) side = 50;
      }
      line (530, 400, 530 + side, 380); // Right arm
      stroke (0);
      line (430, 400, 430 + side, 380); // Left arm
      line (520, 530, 560, 600); // Right leg
      line (440, 530, 400, 600); // Left leg
      
      //Cursor
      fill (cursor_colour);
      ellipse (mouseX, mouseY, 20, 20);
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
       if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) return true;
       else return false;
     case 'e': 
       if (((sq(mouseX - x) / sq(w)) + (sq(mouseY - y) / sq(h))) <= 1)  return true;
       else return false;
     default: 
       return false;
  }
}

void mousePressed() {
  println (mouseX + " : " + mouseY);
}

void keyPressed() {
  switch (key) {
    
    /*** Program 1 Setup ***/
    case '1':
      choice = 0;
      noCursor();
      ellipseMode (CENTER);
      side = 50;
      cursor_colour = color(255, 204, 0);
      break;
    case '2':
      choice = 1;
      break;
    case '3':
      choice = 2;
      break;
      
    /*** Splash Screen Setup ***/
    default:
      if (choice == -1) {
        if (key == BACKSPACE) {
          if (letters.length() > 0) {
            letters = letters.substring(0, letters.length() - 1);
          }
        }
        else letters = letters + key;
      }
      break;
  }
}