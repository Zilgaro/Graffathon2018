import moonlander.library.*;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import peasy.*;

PeasyCam cam;
int i_global;
private int scene = 2;
float r = 250;

Minim minim;
AudioPlayer song;

int CANVAS_WIDTH = 1920;
int CANVAS_HEIGHT = 1080;

int i2 = 0;
int beats = 0;

Moonlander moonlander;

void settings() {
  size(CANVAS_WIDTH,CANVAS_HEIGHT,P3D);
}
void setup() {
  moonlander = Moonlander.initWithSoundtrack(this, "data/DestinyDay.mp3", 120, 7);
  noiseSeed(0);
  colorMode(HSB, 360, 100, 100);
  frameRate(60);
  i_global = 0;
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
  minim = new Minim(this);
  song = minim.loadFile("data/DestinyDay.mp3");
  song.play();
  moonlander.start();
}

void drawVerner(int now) {
  
  double value = moonlander.getValue("track1");
  print(value);
  background(0,0,0);
  //lights();
  stroke(90,90,110);
  translate(0,0,-500);
  int counter = 0;
  float secs = millis() / 1000.0;
  for (int i = -6; i < 7; i++) {
    for (int j = -6 + counter; j < 7 - counter; j++) {
      if (i != -6) {
      pushMatrix();
      translate(j*50,i*50,0);
      if ((secs > 3.6)&&(i == -6)) {
      } else if ((secs > 5.1)&&(i == -5)) {
      } else if ((secs > 7.6)&&(i == -4)) {
      } else if ((secs > 9.1)&&(i == -3)) { 
      } else if ((secs > 10.6)&&(i == -2)) {
      } else if ((secs > 12.1)&&(i == -1)) {
      } else {
        scale(noise(millis()*100), noise(millis()*100), noise(millis()*100));
      }
      //if (secs > 1) {
      //  translate(x,y, 0);
      //}
      sphere(20);
      popMatrix();
      }
    }
    for (int j = 7 - counter; j > -6 + counter; j--) {
      if (i != -6) {
      pushMatrix();
      translate(j*(-50) + 50,i*-50,0);
      // j == -5 saa yhden pallon alariviltä scaleemaan!!!
      if ((secs > 2)&&(j == 1)) {
        scale(noise((float)value), noise((float)value), noise((float)value));
      }
      if ((secs > 3.5)&&(i == -6)) {
        scale(noise((float)value), noise((float)value), noise((float)value));
      }
      if ((secs > 5)&&(i == -5)) {
        scale(noise((float)value), noise((float)value), noise((float)value));
      }
      if ((secs > 7.5)&&(i == -4)) {
        scale(noise((float)value), noise((float)value), noise((float)value));
      }
      if ((secs > 9)&&(i == -3)) {
        scale(noise((float)value), noise((float)value), noise((float)value));
      }
      if ((secs > 10.5)&&(i == -2)) {
        scale(noise((float)value), noise((float)value), noise((float)value));
      }
      if ((secs > 12)&&(i == -1)) {
        scale(noise((float)value), noise((float)value), noise((float)value));
      }
      //translate(i*10*secs,j*10*secs,0);q
      //if (secs > 1) {
      //  translate(x,y, 0);
      //}
      sphere(20);
      popMatrix();
    }
    }
    counter++;
    // pitäisi olla 11.3 sec aloituksesta koko kierros
    if (secs > 12 && secs < 23.3) {
      
      rotate(-frameCount*0.02);
    }
 } 
}

void draw1() {
  noStroke();
  background(0,0,0);
  float secs = millis() / 1000.0;
  if (secs > 1) {
    this.scene = 1;
  }
  
  // Center the view
  translate(width/2, height/2, 0);
  // Move backwards - away from the origin
  translate(0,0,-400);
  for(int j = 0; j < 200; j++) {
      rotate((i_global/PI)*0.01);
      translate(width/2, height/2,j);
      translate(600, -1000, -100);
      fill(100,100,50);
      box(100);
    }
    i_global++;
} 

void draw2(){
 
  
    moonlander.update();
  background(0,0,0);
  
    float secs = millis() / 1000.0;
  
  double value =  moonlander.getValue("my_track");
  
   if(value==1.0){
      beats++;
   }
   
   print(beats+" ");
  
  for(int j = 0; j <= secs; j++){
    if(j%4==0){
      fill(100,100,100);
    }
        else {
        fill(200,100,100);
        }
        
    //translate(0,0,-i2/100);
    rotate(TWO_PI/(i2%8));
    
    
    

    ellipse(0,0,i2/7-j*30,i2/6.6-j*30);
  }
  

 i2++;
}

void draw() {
  moonlander.update();
  
  if (scene == 0) {
    draw1();
  }
  
  if (scene == 1) {
    int now = frameCount;
    drawVerner(now);
  }
  
  if(scene == 2) {
    draw2();
  }
  
}
