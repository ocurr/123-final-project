
// HitBox creates a collision detectable object
public class HitBox extends GameObject {

    private class box {
        int x = 0;
        int y = 0;
        int width = 0;
        int height = 0;
    }

    private box b;

    private PVector position;
    private PVector lastPosition;

    // create a new empty hitbox
    HitBox() {
        b = new box();
        position = new PVector(0,0);
        lastPosition = new PVector(0,0);
    }

    // create a new HitBox with the indicated dimensions
    HitBox(int x, int y, int endX, int endY) {
        b = new box();
        b.x = x;
        b.y = y;
        b.width = endX - b.x;
        b.height = endY - b.y;
        position = new PVector(0,0);
        lastPosition = new PVector(0,0);

    }

    // create a hitbox based off of an image
    HitBox(PImage img) {
        b = new box();

        b.x = img.width;
        b.y = img.height;

        int loc;
        color sample;
        for (int y=0; y<img.height; y++) {
            for (int x=0; x<img.width; x++) {
                loc = img.width*y + x;
                sample = img.pixels[loc];
                if (alpha(sample) > 0) {
                    b.x = min(b.x,x);
                    if (b.x == x && y-b.height != 1) {
                        b.y = y-b.height;
                    }
                    b.width = max(b.width,x);
                    b.height = max(b.height,y);
                }
            }
        }
        b.height = b.height-b.y;
        b.width = b.width-b.x;
        position = new PVector(0,0);
        lastPosition = new PVector(0,0);
    }

    // set the offset in x for an image
    public void setOffsetX(int x) {
        b.x = x;
    }

    // set the offset in y for an image
    public void setOffsetY(int y) {
        b.y = y;
    }

    // set the xy offset for an image
    public void setOffsetXY(int x, int y) {
        b.x = x;
        b.y = y;
    }

    // set the width of the hitbox
    public void setWidth(int endX) {
        b.width = endX - b.x;
    }

    // set the height of the hitbox
    public void setHeight(int endY) {
        b.height = endY - b.y;
    }

    // set the dimensions of the hitbox
    public void setHitBox(int x, int y, int width, int height) {
        b.x = x;
        b.y = y;
        b.width = width;
        b.height = height;
    }

    // returns the offset in x for an image
    public int getOffsetX() {
        return b.x;
    }

    // returns the offset in y for an image
    public int getOffsetY() {
        return b.y;
    }


    // set the position in x
    public void setPositionX(int x) {
        if (x != position.x) {
            lastPosition.x = position.x;
        }
        position.set(x, position.y);
    }

    // set the position in y
    public void setPositionY(int y) {
        if (y != position.y) {
            lastPosition.y = position.y;
        }
        position.set(position.x, y);
    }

    // returns the width of the hitbox
    public int getWidth() {
        return b.width;
    }

    // returns the height of the hitbox
    public int getHeight() {
        return b.height;
    }

    // returns the position in x of the hitbox
    public int getX() {
        return (int)position.x;
    }

    // returns the position in y of the hitbox
    public int getY() {
        return (int)position.y;
    }

    // returns the position of the hitbox as a vector
    public PVector getPosition() {
        return position;
    }

    // returns the last position of the hitbox as a vector
    public PVector getLastPosition() {
        return lastPosition;
    }

    // returns the right x coordinate of the hitbox
    public int getRightX() {
        return getX() + getWidth();
    }

    // returns the bottom y coordinate of the hitbox
    public int getBottomY() {
        return getY() + getHeight();
    }

    // set the xy postion of the hitbox
    public void setPosition(int x, int y) {
        setPositionX(x);
        setPositionY(y);
    }
}
