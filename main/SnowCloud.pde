public class SnowCloud{
  
float px[];
float py[];
float vx[];
float vy[];
color flakeC[];
int numflakes;

private SnowCloud(){
  size(400, 400);
 
  numflakes = 20;
  px = new float[numflakes];
  py = new float[numflakes];
  vx = new float[numflakes];
  vy = new float[numflakes];
  flakeC = new color[numflakes];
  for (int i=0; i <numflakes; i++) {
    px[i] = random(-100, 150);
    py[i] = random(0, 100);
    vx[i] = random(-.05, .05);
    vy[i] = random(.05, .1);
    flakeC[i] = color(random(250, 255), random(250, 255), random(250, 255));
  }
}

private void update(){
  noStroke();
  background(125);
  translate(200, 100);
  drawSnow();
  drawCloud();
  
  
}


private void drawCloud() {
  
  scale(.7);
  fill(67, 85, 147);
  ellipse(0, 0, 300, 200);
  ellipse(150, 50, 200, 100);
  ellipse(150, 0, 100, 100);
  ellipse(-150, 50, 150, 100);
}

private void drawSnow() {
  float x;
  float y;
  float radi = 20;
  for (int i=0; i < numflakes; i++) {
    //draw the ball
    fill(255, 200);
    beginShape();
   
    for (int j =0; j < 360; j+=15) {
      if (j%2 == 0) {
        radi = 15;
      } else {
        radi = 3;
      }
      x = px[i] + radi*cos(radians(j));
      y = py[i] + radi*sin(radians(j));
      vertex(x, y);
      px[i] += vx[i];
      py[i] += vy[i];
    }

    endShape();
  }
}
}