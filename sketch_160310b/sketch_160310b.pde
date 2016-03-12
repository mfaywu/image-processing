int choice;
int screen_width = 1000;
int screen_height = 1000;
color cursor_colour;
PFont pfont;

/*** Splash vars ***/
String letters = "";
 
/*** Program 1 Vars ***/
int side;

/*** Program 2 Vars ***/
ArrayList<String> headlines = new ArrayList<String>();
String new_headline = "";
int moving_ptr = 0;
int moving_ptr_max = 0;
int speed = 1;
int spacing = 20; // TODO: Change to dynamic
int headline_size = 24; // TODO: Change to dynamic

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
      text("Press 1 to see Shanara.", 100, 130);
      text("Press 2 to see scrolling headlines.", 100, 160);
      text(letters, 300, 300);
      noCursor();
      if (mouseX > 0) textSize(mouseX); 
      else textSize(1);
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
      
    /*** Program 2 - Scrolling headlines ***/
    case 1: 
      // Instructions at the top
      fill (0);
      textSize(24);
      text ("Type a new headline and press ENTER.", 50, 50);
      
      // Box for new headline
      stroke (0);
      fill (255);
      rect(50, 80, 750, 50);
      
      // TODO: Blinking type line
      // Text typing into box plus Enter for saving and clearing
      fill (0);
      text (new_headline, 60, 90, 725, 45);
      
      // Display headlines
      textSize(headline_size);
      
      for (int i = 0; i < headlines.size(); i++) {
        int h_y = (140 + headline_size) +  moving_ptr - (i * (spacing + headline_size));
        if (h_y >= (140 + headline_size) && h_y <= (500 + headline_size)) 
          text (headlines.get(i), 60, h_y);
      }
      moving_ptr = (moving_ptr >= moving_ptr_max) ? 0 : moving_ptr + speed;
      
      // White box to hide partial headlines
      fill (255);
      noStroke();
      rect (50, 140, 750, headline_size);
      rect (50, 500, 750, headline_size);
      
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
    /*** Program 2 Setup ***/
    case '2':
      choice = 1;
      cursor();
      break;
    case '3':
      choice = 2;
      break;
      
    default:
      /*** Splash Screen Keyboard Reading ***/
      if (choice == -1) {
        if (key == BACKSPACE) {
          if (letters.length() > 0) {
            letters = letters.substring(0, letters.length() - 1);
          }
        }
        else letters = letters + key;
      }
      /*** Program 2 Keyboard Reading ***/
      else if (choice == 1) {
        if (key == BACKSPACE) {
          if (new_headline.length() > 0) {
            new_headline = new_headline.substring (0, new_headline.length() - 1);
          }
        }
        else if (key == ENTER) {
          headlines.add(new_headline);
          new_headline = "";
          moving_ptr_max = (headlines.size() * (headline_size + spacing)) + ((500 - 140) + headline_size);
        }
        else if (key == CODED) {
          if (keyCode == UP)
            speed -= 2; 
          if (keyCode == DOWN)
            speed += 2;
          if (keyCode == RIGHT) 
            headline_size += 10;
          if (keyCode == LEFT) 
            headline_size -= 10;
        }
        else new_headline = new_headline + key;
      }
      break;
  }
}