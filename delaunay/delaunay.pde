// Basic Delaunay triangulation  

import processing.svg.*;
import de.ixdhof.hershey.*; // requires library to be installed, see HersheyFont.zip

HersheyFont hf;
float rows = 10;
float cols = 10;
float padding = 10; // padding between boxes, in pixels
float bottomPadding = 100;  // extra padding at the bottom for name
float textSize = 25;


void setup() {
  //size(500, 625, SVG, "out.svg"); // for SVG; ignore "textMode(SHAPE) is not supported" warning
  size(500, 625); // for screen 
  background(255);
  hf = new HersheyFont(this, "futural.jhf");
  hf.textSize(textSize);
}

void draw() {
  stroke(0);
  
  float boxWidth = (width - ((cols+1) * padding) ) / cols ;
  float boxHeight =  (height - ((rows+1) * padding) - bottomPadding ) / rows ;
  
  translate(padding, padding); // set start position
  
  for (int i=0; i<=rows; i++) {
    for (int j=0; j<=cols; j++) {
      pushMatrix(); // push current reference frame onto stack
        translate( (boxWidth+padding)*j, (boxHeight+padding)*i);
        rect(0,0,boxWidth,boxHeight);
      popMatrix(); // pop from stack, resetting reference frame to start position
    }
  }
  
  PShape ps = hf.getShape("Long SVG Output Test");
  float textX = width/2; // center text
  float textY = height - (padding * 2) - (ps.height);
  translate(textX, textY);
  shape(ps);
}