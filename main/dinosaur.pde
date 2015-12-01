//Emily Guerra Lab 9
//dinosaur for Final Project - Dino Disaster! 

class Dinosaur extends GameObject {

float rotTHIGH;
float rotTHIGH2;
float rotLEG;
float rotLEG2;
float rotARM;
float rotHEAD;

float THIGHx = 750;
float THIGHy = 655;
float dy ;
float bx, by;
boolean THIGHmove = true;
boolean THIGHmove2 = true;
boolean LEGmove = true;
boolean LEGmove2 = true;
boolean dinoEnter = true;

float px[];
float py[];
float vx[];
float vy[];

int pressedKey;
int time, wait;

HitBox hb;

Dinosaur() {

    rotHEAD = 0;
    rotTHIGH = -.5;
    rotTHIGH2 = 0;
    rotLEG = 0;
    rotLEG2 = 0;
    rotARM = 0;
    dy = 0;
    bx = 0;
    by = 300;
    pressedKey = 32;
    wait = 1000;

    hb = new HitBox(0,0,(int)(470*0.34),(int)(325*0.34));
    hb.setPosition(0,0);
}

public void setPositionX(int x) {
    hb.setPositionX(x);
}

public void setPositionY(int y) {
    hb.setPositionY(y);
}

public int getX() {
    return hb.getX();
}

public int getY() {
    return hb.getY();
}

public void setPosition(int x, int y) {
    setPositionX(x);
    setPositionY(y);
}

public int getHeight() {
    return hb.getHeight();
}

public int getWidth() {
    return hb.getWidth();
}

public HitBox getHitBox() {
    return hb;
}

public void move(PVector p) {
    setPosition((int)(hb.getPosition().x+p.x), (int)(hb.getPosition().y+p.y));
}

void update() {
    drawDino(hb.getX(),hb.getY());
    animate();
    //hb.drawHitRect(0,0);
}

void drawDino(float dx, float dinoy) {

  pushMatrix();
  translate(dx, dinoy);

  pushMatrix();
  scale(.14,.14);
  translate(-30, -130);
  //scales and translates whole dino (dx can move it across screen)

  pushMatrix(); 
  translate(THIGHx, THIGHy-150);
  rotate(rotTHIGH2);
  translate(0, 150);
  fill(183, 48, 24);
  ellipse(50, -20, 150, 300);
  translate(35, 90);
  rotate(rotLEG2);
  rect(50, -20, -80, 150);
  translate(50, -20);
  pushMatrix();
  translate(-80, 150);
  rotate(-.6);
  rotate(rotLEG);
  translate(80, -150);
  quad(-80, 150, 0, 150, 100, 210, 0, 210);
  popMatrix();
  popMatrix();
  //draws back leg


  pushMatrix();
  translate(0, 50+dy);
  //dinosaur bobs up and down while walking
  
  pushMatrix();
  translate(10, -15);
  translate(910, 415);
  rotate(-rotARM-.01);
  translate(-910, -415);
  beginShape();
  fill(183, 48, 24);
  vertex(910, 415);
  bezierVertex(896, 389, 881, 385, 937, 381);
  bezierVertex(959, 378, 981, 400, 979, 409);
  bezierVertex(984, 416, 1021, 394, 1033, 416);
  bezierVertex(1042, 434, 1046, 447, 1031, 453);
  bezierVertex(1023, 461, 1004, 454, 1013, 445);
  bezierVertex(1016, 451, 1031, 446, 1025, 444);
  bezierVertex(1022, 438, 1012, 433, 1015, 428);
  bezierVertex(980, 435, 947, 432, 942, 418);
  bezierVertex(929, 425, 916, 426, 910, 415);
  endShape();
  beginShape();
  vertex(1026, 408);
  bezierVertex(1040, 410, 1062, 429, 1057, 440);
  bezierVertex(1056, 451, 1045, 455, 1041, 448);
  bezierVertex(1045, 451, 1052, 443, 1046, 438);
  bezierVertex(1044, 430, 1001, 434, 1026, 408);
  endShape();
  //back arm
  popMatrix();
 

  beginShape();
  fill(245, 115, 89);
  noStroke();
  vertex(942, 137);
  bezierVertex(1088, 272, 1081, 275, 1007, 311);
  bezierVertex(976, 463, 856, 727, 535, 603);
  bezierVertex(129, 712, 64, 704, 34, 615);
  bezierVertex(56, 667, 159, 723, 532, 387);
  bezierVertex(648, 304, 782, 285, 782, 285);
  bezierVertex(876, 255, 894, 127, 942, 137);
  endShape();
  pushMatrix();
  //body

  beginShape();
  fill(209, 68, 40);
  vertex(1086, 227);
  bezierVertex( 1090, 276, 1082, 278, 1007, 311);
  bezierVertex(990, 263, 1002, 250, 1009, 200); 
  vertex(1086, 200);
  endShape();
  popMatrix();
  //neck

  pushMatrix();
  //fill(245, 115, 89);
  //if (dx>400) {
  //  translate(942, 137);
  //  rotate(rotARM);
  //  translate(-942, -137);
  //}
  //if active makes dino move head up at certain spot along screen

  fill(255, 249, 219);
  ellipse(1160, 150, 20, 30);
  ellipse(1130, 160, 20, 30);
  ellipse(1100, 165, 20, 30);
  //teeth

  beginShape();
  fill(245, 115, 89);
  vertex(942, 137);
  bezierVertex(955, 94, 992, 60, 1045, 108);
  bezierVertex(1142, 84, 1160, 84, 1172, 111);
  bezierVertex(1178, 121, 1190, 113, 1188, 139);
  vertex(1074, 181);
  vertex(1190, 201);
  vertex(1183, 222);
  bezierVertex(1135, 229, 1126, 216, 1086, 227);
  bezierVertex(990, 263, 1002, 250, 942, 137); 
  endShape();
  //head

  beginShape();
  fill(209, 68, 40);
  vertex(961, 133);
  bezierVertex(971, 72, 1037, 110, 1041, 127);
  bezierVertex(1033, 154, 966, 152, 961, 133);
  endShape();
  //detail eye

  beginShape();
  vertex(1056, 168);
  bezierVertex(1037, 124, 1109, 111, 1121, 118);
  bezierVertex(1144, 132, 1087, 170, 1056, 168);
  endShape();
  //detail nose

  fill(0);
  ellipse(1135, 125, 30, 15);
  //nostril

  if (rotTHIGH < .05 && rotTHIGH > -.05) {
    ellipse(1015, 130, 30, 5);
  } else {
    ellipse(1015, 130, 30, 20);
    fill(255);
    ellipse(1020, 130, 10, 5);
  }
  //blinking eye
  popMatrix();
  popMatrix();

  pushMatrix();
  fill(209, 68, 40);
  translate(910, 415);
  rotate(rotARM-.02);
  translate(-910, -415);
  beginShape();
  vertex(910, 415);
  bezierVertex(896, 389, 881, 385, 937, 381);
  bezierVertex(959, 378, 981, 400, 979, 409);
  bezierVertex(984, 416, 1021, 394, 1033, 416);
  bezierVertex(1042, 434, 1046, 447, 1031, 453);
  bezierVertex(1023, 461, 1004, 454, 1013, 445);
  bezierVertex(1016, 451, 1031, 446, 1025, 444);
  bezierVertex(1022, 438, 1012, 433, 1015, 428);
  bezierVertex(980, 435, 947, 432, 942, 418);
  bezierVertex(929, 425, 916, 426, 910, 415);
  endShape();
  beginShape();
  vertex(1026, 408);
  bezierVertex(1040, 410, 1062, 429, 1057, 440);
  bezierVertex(1056, 451, 1045, 455, 1041, 448);
  bezierVertex(1045, 451, 1052, 443, 1046, 438);
  bezierVertex(1044, 430, 1001, 434, 1026, 408);
  endShape();
  //front arm
  popMatrix();

  pushMatrix(); 
  fill(209, 68, 40);
  translate(THIGHx, THIGHy-150);
  rotate(rotTHIGH-.2);
  translate(0, 150);
  ellipse(0, 0, 150, 300);
  //thigh
  translate(50, 110);
  rotate(-rotLEG+.8);
  rect(0, 0, -80, 150);
  //leg and knee
  pushMatrix();
  translate(-80, 150);
  rotate(-rotLEG);
  translate(80, -150);
  quad(-80, 150, 0, 150, 100, 210, 0, 210);  
  //foot and ankle
  popMatrix();
  popMatrix();

  popMatrix();

  popMatrix();
}

void animate() {

  rotTHIGH2 = -rotTHIGH;

  if (rotTHIGH < -.5 || rotLEG <-.1) {
    THIGHmove = false;
  }  


  if (rotLEG > .5 && rotTHIGH > .5) {

    THIGHmove = true;
  }


  if (THIGHmove == true) {
    rotTHIGH -= .01;
  } else {
    rotTHIGH += .01;
  }



  if ((rotTHIGH > 0 && THIGHmove == true) || (rotTHIGH<0 && THIGHmove == false) ) {

    dy += .2;
  } 

  if ((rotTHIGH>0 && THIGHmove == false)|| (rotTHIGH<0 && THIGHmove == true)) {
    dy -= .2;
  }


  if (rotLEG < .1) {
    LEGmove = true;
  } 
  if (rotLEG > .5) {
    LEGmove = false;
  }

  if (THIGHmove == true) {
    rotLEG-= .006; 
    rotARM+=.003;
  } else {
    rotLEG += .006;
    rotARM -= .003;
  }

  if (THIGHmove == true) {
    rotLEG2-= .006;
  } else {
    rotLEG2 += .006;
  }
}

}
