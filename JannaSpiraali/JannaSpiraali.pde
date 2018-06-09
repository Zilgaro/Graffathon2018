import peasy.*;

PeasyCam cam;
int i;

void setup() {
  fullScreen(P3D);
  frameRate(60);
  i = 0;
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
}

void draw() {
  background(0);
  float secs = millis() / 1000.0;
  
  // Center the view
  translate(width/2, height/2, 0);
  // Move up and backwards - away from the origin
  translate(0,0,-400);
  for(int j = 0; j < 200; j++) {
      rotate(i * -0.01);
      translate(width/2, height/2,j);
      translate(600, -1000, -100);
      fill(255,0,0);
      box(100);
    }
    translate(0,0,30);
    fill(0,0,255);
    box(30);
    i++;
}
