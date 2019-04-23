// Basic Delaunay triangulation  

import processing.svg.*;
import processing.pdf.*;
import de.ixdhof.hershey.*; // requires library to be installed, see HersheyFont.zip
import megamu.mesh.*;  // for Delaunay and hull calculations, see mesh-0002.zip and http://leebyron.com/mesh/

HersheyFont hf;

// PARAMETERS
int numberOfPoints = 100;  // total number of points in the field
float padding = 10; // padding between boxes, in pixels
float bottomPadding = 50;  // extra padding at the bottom for name
float textSize = 10;
String title = "DELAUNAY 100";


void setup() {
  noLoop();
  //size(500, 625, SVG, "delaunay_100pt.svg"); // for SVG; ignore "textMode(SHAPE) is not supported" warning
  //size(500,625,PDF, "delaunay.pdf");  // for PDF
  size(500, 625); // for screen 
  background(255);
  hf = new HersheyFont(this, "futural.jhf");  // http://www.whence.com/hershey-fonts/ for examples
  hf.textSize(textSize);
}

void draw() {
  stroke(0); // black lines
  fill(255); // white fill
  
  translate(padding, padding); // set start position
  
  float[][] points = new float[numberOfPoints][2];  // 2D array for points
  
  for (int i=0; i<points.length; i++) {
    points[i][0] = random(padding, width-(2*padding));  // randomly choose X within bounds
    points[i][1] = random(padding, height-bottomPadding);  // randomly choose Y within bounds
  }
  
  // Draw Delaunay triangles
  Delaunay myDelaunay = new Delaunay( points );
  float[][] deEdges = myDelaunay.getEdges();
  for (int i=0; i<deEdges.length; i++) {
    float startX = deEdges[i][0];
    float startY = deEdges[i][1];
    float endX = deEdges[i][2];
    float endY = deEdges[i][3];
    line( startX, startY, endX, endY );
  }
  
  // Draw Voronoi
  stroke(255,0,0);
  Voronoi myVoronoi = new Voronoi( points );
  float[][] voEdges = myVoronoi.getEdges();
    for (int i=0; i<voEdges.length; i++) {
    float startX = voEdges[i][0];
    float startY = voEdges[i][1];
    float endX = voEdges[i][2];
    float endY = voEdges[i][3];
    line( startX, startY, endX, endY );
  }
  stroke(0);
  
  // Draw title at bottom left
  pushMatrix();
   //PShape ps = hf.getShape(title);
   float textX = padding/2;
   float textY = height + padding - (bottomPadding/1.5);
   translate(textX, textY);
   //shape(ps);
   hf.text(title,0,0);
  popMatrix();
}