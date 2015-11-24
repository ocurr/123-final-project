
// Sprite is an object that hanldes individual objects in the level and world
public class Sprite extends GameObject {

    private PImage img;

    private HitBox hb;

    private Collider collider;

    /*** there are two constructors to allow for different types of sprite ***/

    // takes in the path to the sprite's base image
    public Sprite(String name) {
        img = loadImage(name);
        img.loadPixels();

        hb = new HitBox(img);

        collider = new Collider();
    }

    // takes in the dimensions and position of the sprite
    public Sprite(int x, int y, int width, int height) {
        img= null;
        hb = new HitBox(0,0,width,height);
        hb.setPosition(x,y);
        collider = new Collider();
    }

    // for image based sprites only
    // returns the offset for the image in x
    public float getImageOffsetX() {
        return hb.getOffsetX();
    }

    // for image based sprites only
    // returns the offset for the image in y
    public float getImageOffsetY() {
        return hb.getOffsetY();
    }

    // returns the width of the sprite
    public int getWidth() {
        return hb.getWidth();
    }

    // returns the height of the sprite
    public int getHeight() {
        return hb.getHeight();
    }

    // set the position of the sprite
    public void setPosition(int x, int y) {
        hb.setPosition(x,y);
    }

    // set only the x position
    public void setPositionX(int x) {
        hb.setPositionX(x);
    }

    // set only the y position
    public void setPositionY(int y) {
        hb.setPositionY(y);
    }

    // move the sprite through vector addition
    public void move(PVector p) {
        setPosition((int)(hb.getPosition().x+p.x), (int)(hb.getPosition().y+p.y));
    }

    // returns position in x
    public int getX() {
        return hb.getX();
    }

    // returns position in y
    public int getY() {
        return hb.getY();
    }

    // returns the sprite's hitbox
    public HitBox getHitBox() {
        return hb;
    }

    // returns the position of the sprite as a vector
    public PVector getPosition() {
        return hb.getPosition();
    }

    // checks for a collision with the requested hitbox
    public boolean didCollide(HitBox other) {
        return collider.detectCollision(hb,other);
    }

    // checks for a collision with the requested hitbox from the left
    public boolean didCollideLeft(HitBox other) {
        return collider.detectCollisionLeft(hb, other);
    }

    // checks for a collision with the requested hitbox from the right
    public boolean didCollideRight(HitBox other) {
        return collider.detectCollisionRight(hb, other);
    }

    // checks for a collision with the requested hitbox from the top
    public boolean didCollideTop(HitBox other) {
        return collider.detectCollisionTop(hb, other);
    }

    // checks for a collision with the requested hitbox from the bottom
    public boolean didCollideBottom(HitBox other) {
        return collider.detectCollisionBottom(hb, other);
    }

    // draws a rect where the hitbox covers
    // useful for debugging collisions
    public void drawHitRect() {
        rect(getX(),getY(),hb.getWidth(),hb.getHeight());
    }

    @Override
    public void init() {
    }

    // draw the sprite
    @Override
    public void update() {
        pushMatrix();
        image(img, getX()-getImageOffsetX(), getY()-getImageOffsetY());
        popMatrix();
    }
}
