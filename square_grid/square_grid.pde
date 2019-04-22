// Sample program using pushMatrix() and popMatrix() to create a 2D grid of squares

import processing.svg.*;

void setup() {
  //size(500, 625, SVG, "out.svg"); // for SVG
  size(500, 625); // for screen 
  background(255);
}

float rows = 10;
float cols = 50;
float padding = 5; // in pixels

void draw() {
  stroke(0);
  
  float boxWidth = (width - ( (cols+1) * padding) ) / cols ;
  float boxHeight =  (height - ( (rows+1) * padding) ) / rows ;
  
  translate(padding, padding); // set start position
  
  for (int i=0; i<=rows; i++) {
    for (int j=0; j<=cols; j++) {
      pushMatrix(); // push current reference frame onto stack
        translate( (boxWidth+padding)*j, (boxHeight+padding)*i);
        rect(0,0,boxWidth,boxHeight);
      popMatrix(); // pop from stack, resetting reference frame
    }
  }
}
