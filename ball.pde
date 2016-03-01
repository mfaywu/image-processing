float framerate = 24;

int ball_x;
int ball_y;
int ball_radius = 20;

void setup() {
     size (200, 200);
     frameRate (framerate);
     ball_x = width / 2; // where does the width come from?
     ball_y = ball_radius;
     stroke (#003300);
     fill (#0000FF);
}

void draw() {
     float bounce_height = height / 2 * abs (sin (PI * frameCount / framerate)); // To learn
     float ball_height = height - (bounce_height + ball_radius);

     background (#FFFFEE);
     ball_y = (int) (ball_height);
     ellipse (ball_x, ball_y, ball_radius, ball_radius);
}