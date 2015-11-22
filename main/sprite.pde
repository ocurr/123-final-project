
public class Sprite extends GameObject {

    private PImage img;

    private HitBox hb;

    private Collider collider;

    public Sprite(String name) {
        img = loadImage(name);
        img.loadPixels();

        hb = new HitBox(img);

        collider = new Collider();
    }

    public float getImageOffsetX() {
        return hb.getOffsetX();
    }

    public float getImageOffsetY() {
        return hb.getOffsetY();
    }

    public int getWidth() {
        return hb.getWidth();
    }

    public int getHeight() {
        return hb.getHeight();
    }

    public void setPosition(int x, int y) {
        hb.setPosition(x,y);
    }

    public void setPositionX(int x) {
        hb.setPositionX(x);
    }

    public void setPositionY(int y) {
        hb.setPositionY(y);
    }

    public void move(PVector p) {
        hb.getPosition().add(p);
    }

    public int getX() {
        return hb.getX();
    }

    public int getY() {
        return hb.getY();
    }

    public float getDirection() {
        return hb.getDirection();
    }

    public HitBox getHitBox() {
        return hb;
    }

    public PVector getPosition() {
        return hb.getPosition();
    }

    public boolean didCollide(HitBox other) {
        return collider.detectCollision(hb,other);
    }

    public boolean didCollideLeft(HitBox other) {
        return didCollide(other) && collider.detectCollisionLeft(hb, other);
    }

    public boolean didCollideRight(HitBox other) {
        return didCollide(other) && collider.detectCollisionRight(hb, other);
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
        image(img, getX()-getImageOffsetX(), getY()-getImageOffsetY());
        popMatrix();
    }
}
