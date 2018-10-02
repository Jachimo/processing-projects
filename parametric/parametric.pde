// Parametric falling object

import processing.svg.*;

class Point{
  float x;
  float y;
  Point(float x, float y){
    this.x = x;
    this.y = y;
  }
}

ArrayList<Point> points = new ArrayList<Point>();

void setup() {
  //size(500, 625, SVG, "falling_spinning.svg"); // for SVG
  size(500, 625); // for screen 
  background(255);
}

void draw() {
  stroke(0);
  float xmarg = 55;
  float ymarg = 30;
  translate(xmarg, ymarg); // set starting position
  
  float linelength = 50;

  for (float t=0; t<=198; t++) {
    translate(dx(t), dy(t));
    float x1 = -(linelength/2) * cos(theta(t));
    float y1 = (linelength/2) * sin(theta(t));
    float x2 = (linelength/2) * cos(theta(t));
    float y2 = -(linelength/2) * sin(theta(t));
    float absX = screenX(0,0);
    float absY = screenY(0,0);
    float absX1 = screenX(x1,y1);
    float absY1 = screenY(x1,y1);
    float absX2 = screenX(x2,y2);
    float absY2 = screenY(x2,y2);
    if ((absY1 <= 0) || (absY2 <= 0)) {
      continue; // don't draw outside the lines, kids
    }
    if ((absY1 > (height)) || (absY2 > (height))) {
      resetMatrix();
      translate(xmarg, ymarg);
      translate(absX+10, 0);
    }
    stroke(0);
    line(x1, y1, x2, y2);
    pushMatrix();
      translate(-28,0);
      stroke(255,0,0);
      ellipse(0,0,3,3);
    popMatrix();
  }
  noLoop();
}

// dx(t) = x component velocity
float dx(float t) {
  return 0; 
}

// dy(t) = y component velocity
float dy(float t) {
  float vel = 1;
  float accel = 0.2;
  return vel + (accel * t); 
}

//theta(t)
float theta(float t) {
  return 0.1 * t;
}