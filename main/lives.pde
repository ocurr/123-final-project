public class Lives extends GameObject {
  float hx, hy;
  float scl;

  boolean gone = false;

  public Lives() {
  }

  void drawLife() {
    smooth();
    noStroke();
    fill(222, 40, 77, 180);
    beginShape();
    vertex(50, 15); 
    bezierVertex(50, -5, 90, 5, 50, 40); 
    vertex(50, 15); 
    bezierVertex(50, -5, 10, 5, 50, 40); 
    endShape();
  }

  void update() {
    drawLife();
  }
}