
public class Sprite extends GameObject {

    private PImage img;

    private HitBox hb;

    int posX;
    int posY;

    public Sprite(String name) {
        img = loadImage(name);
        img.loadPixels();

        posX = width/2;
        posY = height/2;

        hb = new HitBox(img);
    }

    public float getImageOffsetX() {
        return hb.getX();
    }

    public float getImageOffsetY() {
        return hb.getY();
    }

    public float getWidth() {
        return hb.getWidth();
    }

    public float getHeight() {
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

    public boolean didCollide(int x, int y) {
        return hb.detectCollision(posX, posY, x, y);
    }

    @Override
    public void init() {
    }

    @Override
    public void update() {
        image(img, posX-getImageOffsetX(), posY-getImageOffsetY());
    }
}
