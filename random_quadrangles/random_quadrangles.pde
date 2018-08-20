import processing.svg.*;

/* Random quadrangles 
   based on the example in "Processing: Creative Coding and Generative Art"
   by Greenberg, Xu, Kumar
*/

void setup() {
  //size(864, 864, SVG, "quadrangles.svg"); // 9in x 9in SVG
  size(864, 864); // for screen display
  stroke(0);
  background(255,255,255);
}

void draw() {
  float xoffset = 112;
  float yoffset = 15;
  float xinterval = 80;
  float yinterval = 80;
  float randinterval = 0.006; // amount to increase randomness each drawing
  for (int i = 0; i < 8; i = i+1) { // i is row index
    for (int j = 0; j < 10; j = j+1) { // j is column index
      plotRandomizedQuad (xoffset+(xinterval*i), yoffset+(yinterval*j), 72, 72, randinterval*(pow(j,2)), randinterval*(pow(j,2)));
    }
  }
  noLoop(); // plot once and stop
  //exit();
}

void plotRandomizedQuad(float x, float y, float w, float h, float randW, float randH) {
  float jitterW = w*randW;
  float jitterH = h*randH;
  beginShape();
   vertex(x+random(-jitterW, jitterW), y+random(-jitterH, jitterH));
   vertex(x+random(-jitterW, jitterW), y+h+random(-jitterH, jitterH));
   vertex(x+w+random(-jitterW, jitterW), y+h+random(-jitterH, jitterH));
   vertex(x+w+random(-jitterW, jitterW), y+random(-jitterH, jitterH));
  endShape(CLOSE);
}