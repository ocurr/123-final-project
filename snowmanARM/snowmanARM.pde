PVector Sloc;
PVector dir;
float armR, armR2, time;

boolean armMove = false;
boolean armMove2 = false;
boolean animate = false;

//code to draw the snowman with animation parameters armR and arm2R
void drawSnowman() {
  noStroke();
  smooth();
  pushMatrix();
    translate(Sloc.x, Sloc.y);
    fill(255);
    //body 
    ellipse(200, 300, 100, 85);
    ellipse(200, 240, 80, 70);
    ellipse(200, 190, 55, 55);
    //buttons
    fill(0);
    ellipse(200, 290, 8, 8);
    ellipse(200, 305, 8, 8);
    ellipse(200, 320, 8, 8);
    ellipse(200, 250, 8, 8);
    ellipse(200, 235, 8, 8);
    ellipse(200, 220, 8, 8);
    //eyebrows on fleek
    stroke(0);
    strokeWeight(2);
    line(190, 178, 180, 173);
    line(210, 173, 200, 178);
    //demon eyes
    fill(255, 0, 0);
    noStroke();
    ellipse(185, 183, 8, 8);
    ellipse(207, 183, 8, 8);
    //nose
    fill(247, 126, 12);
    translate(0, -7);
    triangle(200, 195, 160, 198, 200, 203); 
  //draw arm that animates 
  pushMatrix();
 //   translate(10, 15);
    translate(175, 230);
    rotate(armR);
    translate(-175, -230);
 //TRANSLATED TO ROTATE AROUND SHOULDER PIVOT
    stroke(160, 86, 16);
    line(175, 230, 120, 210);
    line(120, 210, 105, 220);
    line(120, 210, 103, 200);
  popMatrix();
  //2nd arm that animates
  //pushMatrix();
  //  translate(0, 0);
  //  rotate(armR);
  //  translate(0, 0);
  //  stroke(160, 86, 16);
  //  line(225, 235, 275, 210);
  //  line(275, 210, 295, 220);
  //  line(275, 210, 270, 200);
  //popMatrix();
popMatrix();
}

//updating animation parameters 
void animate() {
  Sloc.x = Sloc.x + dir.x *time;
  Sloc.y = Sloc.y + dir.y * time;
  
  if (armMove){
    armR -= 0.02;
  }else{ 
    armR += 0.02;
  }
//SLOWED ROTATION SPEED
  
  if (armR < radians(-30)){
    armMove = false;
  }
  
  if (armR > radians(30)){
    armMove = true;
  }
  
  if (armMove2){
    armR2 -= 0.05;
  } else {
    armR2 += 0.05;
  }
  
  if (armR2 < radians(-45)){
    armMove2 = false;
  }
  
  if (armR2 > radians(45)){
    armMove2 = true;
  }
}

void setup(){
  size(400, 400);
  smooth();
  armR = radians(50);
  armR2 = radians(40);
  Sloc = new PVector(width*.5, height/8);
  dir = new PVector(-0.5, 0);
  time = 0.3;
}

void draw() {
  background(200);
  drawSnowman();
  if (animate){
    animate();
  }
}

void mousePressed(){
  Sloc.x = width *.5;
  animate =! animate;
}