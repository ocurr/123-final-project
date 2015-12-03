public class Lives extends GameObject {
  float hx, hy;
  float scl;

  boolean gone = false;

  private HitBox hb;

  public Lives() {
    hb = new HitBox(0,0,1,1);
    hb.setPosition(50,50);
  }
  public void setPosition(int x, int y) {
    hb.setPosition(x, y);
  }
  
  void drawLife(float dx, float dy) {
    pushMatrix();
    translate(dx, dy);
    smooth();
    noStroke();
    fill(222, 40, 77, 180);
    beginShape();
    vertex(50, 15); 
    bezierVertex(50, -5, 90, 5, 50, 40); 
    vertex(50, 15); 
    bezierVertex(50, -5, 10, 5, 50, 40); 
    endShape();
    popMatrix();
  }

  void update() {
    drawLife(hb.getX(),hb.getY());
  }
}