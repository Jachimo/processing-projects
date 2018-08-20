import processing.svg.*;

class Point{
  float x;
  float y;
  Point(float x, float y){
    this.x = x;
    this.y = y;
  }
}

void setup() {
  //size(864, 864, SVG, "simple_radii.svg"); // 9in x 9in SVG
  size(864, 864); // for screen display
  background(255);
}

void draw() {
  stroke(0);
  int radius = 400;
  float ranAmt = 20;
  float circCenterX = (width/2);
  float circCenterY = (height/2);
  float x, y;
  ArrayList<Point> points = new ArrayList<Point>(); // arraylist of point objects
  
  for (float ang = 0; ang <= 360; ang += 45) {
    float rad = radians(ang);
    x = circCenterX + (radius * cos(rad));
    y = circCenterY + (radius * sin(rad));
    //line(circCenterX, circCenterY, x, y);
    points.add(new Point(x,y));
  }
  for (int i=0; i < points.size(); i += 1) {
    Point startPoint;
    startPoint = points.get(i);
    for (int j=0; j < points.size(); j += 1) {
      Point endPoint;
      endPoint = points.get(j);
      line(startPoint.x, startPoint.y, endPoint.x, endPoint.y);
    }
  }
  
  //stroke(255,0,0); // change pen color to red
  //for (int i=0; i<points.size(); i++) {
  //  // add some jitter to the x and y coords of each point
  //  Point updatePoint = points.get(i);
  //  updatePoint.x = (updatePoint.x + random(ranAmt*-1,ranAmt)); // modify in place
  //  updatePoint.y = (updatePoint.y + random(ranAmt*-1,ranAmt));
  //}
  //for (int i=0; i < points.size(); i += 1) {
  //  Point startPoint;
  //  startPoint = points.get(i);
  //  for (int j=0; j < points.size(); j += 1) {
  //    Point endPoint;
  //    endPoint = points.get(j);
  //    line(startPoint.x, startPoint.y, endPoint.x, endPoint.y);
  //  }
  //}
  
  stroke(10,255,200); // change pen color again, to green
  float skew = 15; // degrees to rotate by
  ArrayList<Point> greenPoints = new ArrayList<Point>(); // new arraylist
  for (float ang = 0; ang <= 360; ang += 30) {
    float rad = radians(ang + skew);
    x = circCenterX + (radius * cos(rad));
    y = circCenterY + (radius * sin(rad));
    //line(circCenterX, circCenterY, x, y);
    greenPoints.add(new Point(x,y));
  }
  for (int i=0; i < greenPoints.size(); i++) {
    Point startPoint;
    startPoint = greenPoints.get(i);
    for (int j=0; j < greenPoints.size(); j++) {
      Point endPoint;
      endPoint = greenPoints.get(j);
      line(startPoint.x, startPoint.y, endPoint.x, endPoint.y);
    }
  }
  
  noLoop();
}
