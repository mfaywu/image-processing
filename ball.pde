Bouncer[] bouncer = new Bouncer[2];

/*** Set up ***/

void setup() {
     size (200, 200);
     frameRate (300);
     stroke (#003300);
     fill (#0000FF);
     bouncer[0] = new Ball (width / 2 - 30, 20, 20);
     bouncer[1] = new Box (width / 2, 20, 20, 20);
}

void draw() { // Runs every __ seconds?
     int items = bouncer.length;
     for (int i = 0; i < items; i++) {
     	 bouncer[i].computeNextStep (width, height, frameRate);
     }
     background (#FFFFEE);

     for (int i = 0; i < items; i++) {
     	 bouncer[i].draw();
     }     
}

/*** Event handlers ***/

void mousePressed() {
     int items = bouncer.length;
     for (int i = 0; i < items; i++) {
     	 if (bouncer[i].mouseOver (mouseX, mouseY)) {
	    bouncer[i].mousePressed();
	 }
     }
}

void mouseReleased() {
     int items = bouncer.lenght;
     for (int i = 0; i < items; i++) {
     	 bouncer[i].mouseDragged (mouseX, mouseY);
     }
}

/*** Classes *********/

abstract class Bouncer {
     int x, y;
     boolean move = true;
     int step = 0; 
     int xoffset = 0;
     int yoffset = 0;

     abstract void computeNextStep (int width, int height, float framerate);
     
     abstract void draw();

     abstract boolean mouseOver (int mx, int my);

     abstract boolean mouseOver (int mx, int my);

     void mousePressed() {
     	  move = false;
     }

     void mouseReleased() {
     	  move = true;
     }
}

class Ball implements Bouncer {
      int x, y, radius;
      int step = 0;
      int incr = 1;

      Ball (int x, int y, int r) {
      	   this.x = x;
	   this.y = y;
	   this.radius = r;
      }

      void computeNextStep (int sketch_width, int sketch_height, float frame_rate) {
      if (move) {
      	   if (step == 0) incr = 1;
	   if (step == sketch_height / 2 - 1) incr = -1;
	   step += incr;
	   //float sin_value = abs (sin (PI * step / (float) frame_rate));
	   //float bounce_height = sketch_height / 2 * sin_value;
	   //float ball_height = sketch_height - (bounce_height + radius);
	   //y = (int) (ball_height);
	   float ball_height = sketch_height / 2 - (2*radius) + (step % (sketch_height / 2) + radius); 
	   
	   y = (int) (ball_height);
	   }
      }

      void draw() {
      	   ellipse (x, y, radius, radius);
      }
      
      boolean mouseOver (int mx, int my) {
      	      return sqrt ((x - mx)* (x - mx) + (y-my)*(y-my)) <= radius;
      }
}

class Box implements Bouncer {
      int x, y, w, h;
      int step = 0;
      int incr = 1;

      Box (int x, int y, int w, int h) {
      	  this.x = x;
	  this.y = y;
	  this.w = w;
	  this.h = h;
     }

     void computeNextStep (int sketch_width, int sketch_height, float frame_rate) {
     if (move) {
     	  if (step == 0) incr = 1;
	  if (step == sketch_height / 2 - 1) incr = -1;
	  step += incr;

	  float box_height = sketch_height - (step % (sketch_height / 2) + (h));
	  
	  y = (int) (box_height);
	  }
     }

     void draw() {
     	  rect (x, y, w, h);
     }
     
     boolean mouseOver (int mx, int my) {
     	     return x <= mx && mx <= x + w && (y-h/2)<= my && my <= (y+h/2);
     }
}