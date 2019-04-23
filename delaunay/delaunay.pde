// Basic Delaunay triangulation  

import processing.svg.*;
import processing.pdf.*;
import de.ixdhof.hershey.*; // requires library to be installed, see HersheyFont.zip
import megamu.mesh.*;  // for Delaunay and hull calculations, see mesh-0002.zip and http://leebyron.com/mesh/

HersheyFont hf;

// PARAMETERS
int numberOfPoints = 50;  // total number of points in the field
float padding = 10; // padding between boxes, in pixels
float bottomPadding = 100;  // extra padding at the bottom for name
float textSize = 10;
String title = "Delaunay Triangulation";


void setup() {
  noLoop();
  //size(500, 625, SVG, "delaunay.svg"); // for SVG; ignore "textMode(SHAPE) is not supported" warning
  //size(500,625,PDF, "delaunay.pdf");  // for PDF
  size(500, 625); // for screen 
  background(255);
  hf = new HersheyFont(this, "futural.jhf");
  hf.textSize(textSize);
}

void draw() {
  stroke(0); // black lines
  fill(255); // white fill
  
  translate(padding, padding); // set start position
  
  float[][] points = new float[numberOfPoints][2];  // 2D array for points
  
  for (int i=0; i<points.length; i++) {
    points[i][0] = random(padding, width-padding);  // randomly choose X within bounds
    points[i][1] = random(padding, height-bottomPadding);  // randomly choose Y within bounds
  }
  
  Delaunay myDelaunay = new Delaunay( points );
  
  float[][] myEdges = myDelaunay.getEdges();
  
  for (int i=0; i<myEdges.length; i++) {
    float startX = myEdges[i][0];
    float startY = myEdges[i][1];
    float endX = myEdges[i][2];
    float endY = myEdges[i][3];
    line( startX, startY, endX, endY );
  }
  
  // Draw title at bottom left
  pushMatrix();
   PShape ps = hf.getShape(title);
   float textX = padding/2;
   float textY = height + padding - (bottomPadding / 2);
   translate(textX, textY);
   shape(ps);
  popMatrix();
}