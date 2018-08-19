import processing.svg.*;

class Point{ // Point class for later ArrayList usage
  float x;
  float y;
  Point(float x, float y){
    this.x = x;
    this.y = y;
  }
}

void setup() {
  size(864, 864, SVG, "radii.svg"); // 9in x 9in SVG
  //size(864, 864); // for screen display
  background(255);
}

void draw() {
  int strokeColor = 0;
  stroke(strokeColor); // start with black
  int radius = 350;
  float circCenterX = (width/2);
  float circCenterY = (height/2);
  float x, y;
  float noiseAmt = 0; // used by noise() as starting value
  ArrayList<Point> points = new ArrayList<Point>(); // arraylist of point objects
  
  for (float ang = 0; ang <= 360; ang += 2) {
    noiseAmt += 0.3; // increment noiseAmt each time
    float radNoise = (noise(noiseAmt) - 0.5) * 200; // radius noise
    float angNoise = (noise(noiseAmt) - 0.5) * 0.1; // angle noise (in degrees)
    // construct arraylist of points
    float rad = radians(ang);
    x = circCenterX + ((radius + radNoise) * cos(rad + angNoise));
    y = circCenterY + ((radius + radNoise) * sin(rad + angNoise));
    points.add(new Point(x,y));
  }
  
  float noiseCenterAmt = 0;
  for (Point point : points) {
    //stroke((point.x / width) * 255); // continuously vary line color
    noiseCenterAmt += 0.5;
    float noiseCenter = (noise(noiseCenterAmt) - 0.5) * 0; // center point noise, change multiplier to 0 to disable
    line(circCenterX + noiseCenter, circCenterY + noiseCenter, point.x, point.y);
  }
  
  noLoop();
}
