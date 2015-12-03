//Emily Guerra - created cloud and moving snow
//Snow cloud to follow dinosaur during game play

public class SnowCloud{
  
  private class Flake{
    float px= random(-100, 150); 
    float py= random(0,100);
    float vx= random(-.05, .05);
    float vy= random(.05, 1);
    float lx = px;
    float ly = py;
  }
 
Flake flakes[];  

int numflakes;
private HitBox hb;

private SnowCloud(){
  numflakes = 20;
  flakes = new Flake[numflakes];
 
  for (int i=0; i <numflakes; i++) {
    flakes[i] = new Flake();
  }
  
  hb = new HitBox(0,0, 150, height-(height/4));
  hb.setPosition(-500, height/4);
}

public void setPositionX(int x){
  hb.setPositionX(x);
}


public void move(int x){
  hb.setPosition(hb.getX()+x, height/4);
}

public HitBox getHitBox(){
  return hb;
}

private void update(){
  noStroke();
  pushMatrix();
  translate(hb.getX(), hb.getY());
  scale(.5);
  drawSnow();
  drawCloud();
  popMatrix();
  
}


private void drawCloud() {
  pushMatrix();
  translate(150,0);
  scale(.7);
  fill(67, 85, 147);
  ellipse(0, 0, 300, 200);
  ellipse(150, 50, 200, 100);
  ellipse(150, 0, 100, 100);
  ellipse(-150, 50, 150, 100);
  popMatrix();
}

private void drawSnow() {
  float x;
  float y;
  float radi = 20;
  pushMatrix();
  translate(150,0);
  for (int i=0; i < numflakes; i++) {
    //draw the flakes
    fill(255, 200);
    beginShape();
   
    for (int j =0; j < 360; j+=15) {
      if (j%2 == 0) {
        radi = 15;
      } else {
        radi = 3;
      }
      x = flakes[i].px + radi*cos(radians(j));
      y = flakes[i].py + radi*sin(radians(j));
      vertex(x, y);
      flakes[i].px += flakes[i].vx;
      flakes[i].py += flakes[i].vy;
    }

    endShape();
    if(flakes[i].py >height){
      flakes[i].py = flakes[i].ly;
      flakes[i].px = flakes[i].lx;
    }
  }
 popMatrix();
}
}