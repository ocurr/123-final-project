
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

    HitBox() {
        b = new box();
        position = new PVector(0,0);
        lastPosition = position;
    }

    HitBox(int x, int y, int endX, int endY) {
        b = new box();
        b.x = x;
        b.y = y;
        b.width = endX - b.x;
        b.height = endY - b.y;
        position = new PVector(0,0);
        lastPosition = position;

    }

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
        lastPosition = position;
    }

    public void setOffsetX(int x) {
        b.x = x;
    }

    public void setOffsetY(int y) {
        b.y = y;
    }

    public void setOffsetXY(int x, int y) {
        b.x = x;
        b.y = y;
    }

    public void setWidth(int endX) {
        b.width = endX - b.x;
    }

    public void setHeight(int endY) {
        b.height = endY - b.y;
    }

    public void setHitBox(int x, int y, int width, int height) {
        b.x = x;
        b.y = y;
        b.width = width;
        b.height = height;
    }

    public int getOffsetX() {
        return b.x;
    }

    public int getOffsetY() {
        return b.y;
    }


    public void setPositionX(int x) {
        lastPosition.x = position.x;
        position.set(x, position.y);
    }

    public void setPositionY(int y) {
        lastPosition.y = position.y;
        position.set(position.x, y);
    }

    public int getWidth() {
        return b.width+1;
    }

    public int getHeight() {
        return b.height+1;
    }

    public int getX() {
        return (int)position.x;
    }

    public int getY() {
        return (int)position.y;
    }

    public PVector getPosition() {
        return position;
    }

    public PVector getLastPosition() {
        return lastPosition;
    }

    public float getDirection() {
        return position.heading();
    }

    public int getRightX() {
        return getX() + getWidth();
    }

    public int getBottomY() {
        return getY() + getHeight();
    }

    public void setPosition(int x, int y) {
        setPositionX(x);
        setPositionY(y);
    }
}
