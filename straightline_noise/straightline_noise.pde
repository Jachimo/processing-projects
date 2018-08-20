import processing.svg.*;
/* Example of Perlin noise in 2 dimensions represented using short straight lines */

// SET THESE
public static final int numCols = 10;
public static final int numRows = 50;
public static final float diameter = 50; // diameter in pixels (or line length)
public static final int max_loops = 3; // doesn't work for SVG

static int loopcount = 0;
static int strokecolor = 0;
static float noisefactor = 1; // this increases with each iteration

void setup() {
  size(500, 500); // for screen display
  //size(500, 500, SVG, "straightlines.svg"); // 864x864 = 9in x 9in SVG
  background(255);
  smooth();
  stroke(strokecolor);
}

void draw() {
  // Draw a 2D grid of something, filling the viewport
  float colWidth = (width / numCols);
  float rowHeight = (height / numRows);
  float xpos = (colWidth / 2); // start at middle of first column
  float xstart = xpos;
  float ypos = (rowHeight / 2); // and start in middle of first row
  float ystart = ypos;
  loopcount++;
  
  // Flow with short straight lines
  for (int i=0; i<numCols; i++) { // iterate through columns
    ypos = ystart;
    for (int j=0; j<numRows; j++) { // iterate through rows
      pushMatrix();
        translate(xpos,ypos);
        rotate( 
          noise(
            noisefactor*xpos/(width/2), 
            noisefactor*ypos/(height/2)
          ) * radians(360) 
        );
        line(-(diameter/2), 0, (diameter/2), 0);
      popMatrix();
      ypos += rowHeight;
    }
    xpos += colWidth;
  }
  
  if (loopcount >= max_loops) {
    // stop when we reach max_loops
    noLoop();
  }
  noisefactor += 0.06;
  strokecolor += 90;
}
