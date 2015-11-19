float rotTHIGH;
float rotTHIGH2;
float rotLEG;
float rotLEG2;
float THIGHx = 750;
float THIGHy = 655;
float dx ;
float dy ;
boolean THIGHmove = true;
boolean THIGHmove2 = true;
boolean LEGmove = true;
boolean LEGmove2 = true;

void setup(){
  size(800,600);
  rotTHIGH = -.5;
  rotTHIGH2 = 0;
  rotLEG = 0;
  rotLEG2 = 0;
  dx = 0;
  dy = 0;
  

}

void draw(){
 background(255);
 drawDino();
 animate();
 dx+= 1;
   println(rotTHIGH, THIGHmove, rotLEG, LEGmove);
 
}

void drawDino(){
  pushMatrix();
  scale(.5);
 // translate(dx,0);
  
  pushMatrix(); 
  translate(THIGHx, THIGHy-150);
  rotate(rotTHIGH2);
  translate(0, 150);
  fill(209, 68, 40);
  ellipse(50, -20, 150, 300);
  
  translate(40, 110);
  rotate(-rotLEG);
 // translate(0, 150);
  fill(200,200,0);
  rect(50, -20, -80, 150);
  popMatrix();
  
  pushMatrix();
  translate(0, 50+dy);
  beginShape();
  fill(245, 115, 89);
  noStroke();
  vertex(942, 137);
  bezierVertex(955, 94, 992, 60, 1045, 108);
  bezierVertex(1142, 84, 1160, 84, 1172, 111);
  bezierVertex(1178, 121, 1190, 113, 1188, 139);
  vertex(1074, 181);
  vertex(1190, 201);
  vertex(1183, 222);
  bezierVertex(1135, 229, 1126, 216, 1086, 227);
  bezierVertex(1088, 272, 1081, 275, 1007, 311);
  bezierVertex(976, 463, 856, 727, 535, 603);
  bezierVertex(129, 712, 64, 704, 34, 615);
  bezierVertex(56, 667, 159, 723, 532, 387);
  bezierVertex(648, 304, 782, 285, 782, 285);
  bezierVertex(876, 255, 894, 127, 942, 137);
  endShape();
  //body
  
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
  
  beginShape();
  vertex(1086, 227);
  bezierVertex( 1090, 276, 1082, 278,1007, 311);
  bezierVertex(990, 263, 1002, 250, 1009, 231);
  bezierVertex(1018, 249, 1037, 230, 1086, 227);
  endShape();
  //detail neck
  popMatrix();
  
  pushMatrix(); 
  translate(THIGHx, THIGHy-150);
  rotate(rotTHIGH-.2);
  translate(0, 150);
  ellipse(0, 0, 150, 300);
 
  translate(50, 110);
  rotate(rotLEG);
 // translate(0, 150);
 // fill(200,200,0);
  rect(0, 0, -80, 150);
  
  quad(-80,150, 0, 150, 100, 210, 0, 210);  
  popMatrix();

  popMatrix();
}

void animate(){
  
  rotTHIGH2 = -rotTHIGH;
  
  if (rotTHIGH < -.5 || rotLEG <-.1) {
      THIGHmove = false;

    }  
   
 
 if(rotLEG > .6 && rotTHIGH > .5){
   
    THIGHmove = true;
     }
  
  
  if (THIGHmove == true) {
     rotTHIGH -= .01; 
  } else {
    rotTHIGH += .01;
  }
  

//  if (THIGHmove == true ) {
  if ((rotTHIGH > 0 && THIGHmove == true) || (rotTHIGH<0 && THIGHmove == false) ) {
 
     dy += .2;
    } 
    
    if ((rotTHIGH>0 && THIGHmove == false)|| (rotTHIGH<0 && THIGHmove == true)){
    dy -= .2;
  }
  
  
  if (rotLEG < .1) {
      LEGmove = true;
  } 
  if (rotLEG > .5) {
    LEGmove = false;
  }
 
  if (THIGHmove == true) {
     rotLEG-= .005; 
  } else {
    rotLEG += .005;
  }
 /*
  if (rotLEG2 < -.3) {
      THIGHmove = true;
  } 
  if (rotLEG2 > 1.4) {
      THIGHmove = false;
  }
 
  if (THIGHmove == false) {
     rotLEG2-= .01; 
  } else {
    rotLEG2 += .02;
  }
  */
}