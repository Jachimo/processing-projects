// Basic Voronoi plots  

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
float circleRadius = 3;
String title = "VORONOI";

void setup() {
  noLoop();
  //size(500, 625, SVG, "voronoi-delaunay_100pt.svg"); // for SVG; ignore "textMode(SHAPE) is not supported" warning
  //size(500,625,PDF, "voronoi.pdf");  // for PDF
  size(500, 625); // for screen 
  background(255);
  hf = new HersheyFont(this, "futural.jhf");  // http://www.whence.com/hershey-fonts/ for examples
  hf.textSize(textSize);
}

void draw() {
  // DERIVED CONSTANTS
  float xmin = padding;
  float xmax = width-(2*padding);
  float ymin = padding;
  float ymax = height-bottomPadding;

  stroke(0); // black lines
  fill(255); // white fill

  float[][] points = new float[numberOfPoints][2];  // 2D array for points

  // Debugging
  println("X min is ", xmin);
  println("X max is ", xmax);

  for (int i=0; i<points.length; i++) {
    points[i][0] = random(xmin, xmax);  // randomly choose X
    points[i][1] = random(ymin, ymax);  // randomly choose Y
  }

  // Draw points
  ellipseMode(RADIUS);
  stroke(0,0,255);
  for (int i=0; i<points.length; i++) {
    ellipse(points[i][0], points[i][1], circleRadius, circleRadius);
  }
  stroke(0);

  // Draw Voronoi
  stroke(255, 0, 0);
  Voronoi myVoronoi = new Voronoi( points );
  float[][] voEdges = myVoronoi.getEdges();
  for (int i=0; i<voEdges.length; i++) {
    float startX = voEdges[i][0];
    //if (startX<xmin) {startX = xmin;};
    //if (startX>xmax) {startX = xmax;};
    
    float startY = voEdges[i][1];
    //if (startY<ymin) {startY = ymin;};
    //if (startY>ymax) {startY = ymax;};
    
    float endX = voEdges[i][2];
    //if (endX<xmin) {endX = xmin;};
    //if (endX>xmax) {endX = xmax;};
    
    float endY = voEdges[i][3];
    //if (endY<ymin) {endY = ymin;};
    //if (endY>ymax) {endY = ymax;};
    
    line( startX, startY, endX, endY );
  }
  stroke(0);

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

  // Draw title at bottom left
  pushMatrix();
  //PShape ps = hf.getShape(title);
  float textX = xmin;
  float textY = height - bottomPadding/2;
  translate(textX, textY);
  //hf.text(title, 0, 0);
  popMatrix();
}