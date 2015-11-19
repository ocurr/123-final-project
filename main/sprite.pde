
public class Sprite extends GameObject {

    private PImage img;

    private HitBox hb;

    int posX;
    int posY;

    public Sprite(String name) {
        img = loadImage(name);
        img.loadPixels();

        posX = 0;
        posY = 0;

        hb = new HitBox(img);
    }

    public float getImageOffsetX() {
        return hb.getX();
    }

    public float getImageOffsetY() {
        return hb.getY();
    }

    public int getWidth() {
        return hb.getWidth();
    }

    public int getHeight() {
        return hb.getHeight();
    }

    public void setPosition(int x, int y) {
        posX = x;
        posY = y;
    }

    public void setPositionX(int x) {
        posX = x;
    }

    public void setPositionY(int y) {
        posY = y;
    }

    public void move(int dx, int dy) {
        posX += dx;
        posY += dy;
    }

    public int getX() {
        return posX;
    }

    public int getY() {
        return posY;
    }

    public HitBox getHitBox() {
        return hb;
    }

    public boolean didCollide(HitBox other) {
        return hb.detectCollision(other);
    }

    public boolean didCollideLeft(HitBox other) {
        hb.setPositionX(posX);
        hb.setPositionY(posY);
        return hb.detectCollisionLeft(other);
    }

    public boolean didCollideRight(HitBox other) {
        hb.setPositionX(posX);
        hb.setPositionY(posY);
        return hb.detectCollisionRight(other);
    }

    public boolean didCollideTop(HitBox other) {
        hb.setPositionX(posX);
        hb.setPositionY(posY);
        return hb.detectCollisionTop(other);
    }

    public boolean didCollideBottom(HitBox other) {
        hb.setPositionX(posX);
        hb.setPositionY(posY);
        return hb.detectCollisionBottom(other);
    }

    public void drawHitRect() {
        rect(getX(),getY(),hb.getWidth(),hb.getHeight());
    }

    @Override
    public void init() {
    }

    @Override
    public void update() {
        pushMatrix();
        image(img, posX-getImageOffsetX(), posY-getImageOffsetY());
        popMatrix();
    }
}
