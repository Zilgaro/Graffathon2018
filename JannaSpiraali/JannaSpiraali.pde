import peasy.*;

PeasyCam cam;
int i;

int CANVAS_WIDTH = 1920;
int CANVAS_HEIGHT = 1080;


void settings() {
  size(CANVAS_WIDTH,CANVAS_HEIGHT,P3D);
}
void setup() {
  colorMode(HSB, 360, 100, 100);
  noStroke();
  frameRate(60);
  i = 0;
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
}

void draw() {
  background(0,0,0);
  float secs = millis() / 1000.0;
  
  // Center the view
  translate(width/2, height/2, 0);
  // Move backwards - away from the origin
  translate(0,0,-400);
  for(int j = 0; j < 200; j++) {
      rotate(i*0.01);
      translate(width/2, height/2,j);
      translate(600, -1000, -100);
      fill(100,100,50);
      box(100);
    }
    i++;
}
