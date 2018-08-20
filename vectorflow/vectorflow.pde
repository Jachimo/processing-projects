import processing.svg.*;

// SET THESE
public static final int numCols = 50; // affects curve shape
public static final int numRows = 40;
public static final float margin = 20; // margin in pixels
public static final int max_loops = 1;

static int loopcount = 0;
static int strokecolor = 0;
static float noisefactor = 1; // this increases with each iteration

void setup() {
  size(500, 500); // for screen display
  //size(500, 500, SVG, "vectorflow_curves.svg");
  background(255);
  smooth();
  stroke(strokecolor);
}

void draw() {
  // Draw a 2D grid of something, filling the viewport
  float colWidth = ((width - margin*2) / numCols);
  float rowHeight = ((height - margin*2) / numRows);
  float xstart = margin + (colWidth / 2); // start at middle of first column
  float xpos = xstart;
  float ystart = margin + (colWidth / 2); // add extra margin at top
  float ypos = ystart;
  loopcount++;

  // Flow with curves //<>//
  noFill();
  for (int i=0; i<numRows; i++) {  //<>//
    xpos = xstart; // "carriage return"
    beginShape();
    for (int j=0; j<numCols; j++) { 
      //stroke(noise(xpos*noisefactor,ypos*noisefactor) * 255);
      // tangent line follows ∆y = tan(ang) where ang varies from 0 to 2pi
      float ang;
      //ang = ( noise(xpos*noisefactor,ypos*noisefactor) - 0.5) * 50 ; // in radians
      ang = ( noise(xpos*noisefactor) - 0.5) * 70 ; // in radians
      curveVertex(xpos,ypos+ang);
      xpos += colWidth;
    }
    endShape();
    ypos += rowHeight;
    noisefactor += 0.0004;
  }
  
  
  if (loopcount < max_loops) {
    draw();
  } else {
    noLoop();
  }

}
