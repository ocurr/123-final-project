
public class HitBox extends GameObject {

    private class box {
        int x = 0;
        int y = 0;
        int width = 0;
        int height = 0;
    }

    private box b;

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

    public int getX() {
        return b.x;
    }

    public int getY() {
        return b.y;
    }

    public int getWidth() {
        return b.width;
    }

    public int getHeight() {
        return b.height;
    }

    private float impLine(float x1, float y1, float x2, float y2, float x, float y) {
        return (y1 - y2)*x + (x2-x1)*y + x1*y2 - x2*y1;
    }

    public boolean detectCollision(int posX, int posY, int x, int y) {
        return
            impLine(posX,posY,posX+b.width,posY,x,y) > 0 &&
            impLine(posX+b.width,posY,posX+b.width,posY+b.height,x,y) > 0 &&
            impLine(posX+b.width,posY+b.height,posX,posY+b.height,x,y) > 0 &&
            impLine(posX,posY,posX,posY+b.height,x,y) < 0;
    }
}
