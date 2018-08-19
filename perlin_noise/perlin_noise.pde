size(500,500);
background(255);
strokeWeight(5);
smooth();

stroke(0,30); // light grey line
line(20,50,480,50); // straight line for reference

stroke(20,50,70); 
int step = 10;
float lastx = 0;
float lasty = 0;
float ynoise = 1; // this is a seed value for noise()
float y = 50;
for (int x=20; x<=480; x+=step){
  y = 10 + noise(ynoise) * 80; // noise() returns perlin noise, between 0 and 1
  if (lastx != 0) {
    line(x,y,lastx,lasty);
  }
  lastx = x;
  lasty = y;
  ynoise += 0.2; // increment the seed value used by noise()
}
