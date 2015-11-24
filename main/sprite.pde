
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

    public Sprite(int x, int y, int width, int height) {
        img= null;
        hb = new HitBox(0,0,width,height);
        hb.setPosition(x,y);
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
        setPosition((int)(hb.getPosition().x+p.x), (int)(hb.getPosition().y+p.y));
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
        return collider.detectCollisionLeft(hb, other);
    }

    public boolean didCollideRight(HitBox other) {
        return collider.detectCollisionRight(hb, other);
    }

    public boolean didCollideTop(HitBox other) {
        return collider.detectCollisionTop(hb, other);
    }

    public boolean didCollideBottom(HitBox other) {
        return collider.detectCollisionBottom(hb, other);
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
