
public class HitBox extends GameObject {

    private class box {
        int x = 0;
        int y = 0;
        int width = 0;
        int height = 0;
    }

    private box b;

    int posX;
    int posY;

    HitBox() {
        b = new box();
    }

    HitBox(int x, int y, int endX, int endY) {
        b = new box();
        b.x = x;
        b.y = y;
        b.width = endX - b.x;
        b.height = endY - b.y;
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
    }

    public void setX(int x) {
        b.x = x;
    }

    public void setY(int y) {
        b.y = y;
    }

    public void setXY(int x, int y) {
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

    public void setPositionX(int x) {
        posX = x;
    }

    public void setPositionY(int y) {
        posY = y;
    }

    public int getPositionX() {
        return posX;
    }

    public int getPositionY() {
        return posY;
    }

    public int getX() {
        return b.x;
    }

    public int getY() {
        return b.y;
    }

    public int getWidth() {
        return b.width+1;
    }

    public int getHeight() {
        return b.height+1;
    }
}
