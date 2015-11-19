
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

    public boolean didCollide(int x, int y) {
        return hb.detectCollision(posX, posY, x, y);
    }

    public boolean didCollideLeft(int x, int y) {
        return 
            hb.detectCollisionLeft(posX, posY, x, y) &&
            hb.detectCollisionTop(posX, posY, x, y) &&
            hb.detectCollisionBottom(posX, posY, x, y);
    }

    public boolean didCollideRight(int x, int y) {
        return
            hb.detectCollisionRight(posX, posY, x, y) &&
            hb.detectCollisionTop(posX, posY, x, y) &&
            hb.detectCollisionBottom(posX, posY, x, y);
    }

    public boolean didCollideTop(int x, int y) {
        return
            hb.detectCollisionTop(posX, posY, x, y) &&
            hb.detectCollisionLeft(posX, posY, x, y) &&
            hb.detectCollisionRight(posX, posY, x, y);
    }

    public boolean didCollideBottom(int x, int y) {
        return
            hb.detectCollision(posX, posY, x, y) &&
            hb.detectCollisionLeft(posX, posY, x, y) &&
            hb.detectCollisionRight(posX, posY, x, y);
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
