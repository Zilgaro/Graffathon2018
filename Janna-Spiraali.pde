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
  for(int j = 0; j < 100; j++) {
    rotate(i * -0.01);
    translate(0,j + i,j + i);
    fill(255,0,0);
    box(30);
  }
    translate(0,0,30);
    fill(0,0,255);
    box(30);
    i++;
    if (i % 150 == 0) {
      i = 0;
    }
}
