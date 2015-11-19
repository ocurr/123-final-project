
class Camera extends GameObject {

    private class box {
        int x = 0;
        int y = 0;
        int width = 0;
        int height = 0;
    }

    box bounds;

    int posX;
    int posY;

    Camera() {
        bounds = new box();
        posX = 0;
        posY = 0;
    }

    public void setBounds(int x, int y, int width, int height) {
        bounds.x = x;
        bounds.y = y;
        bounds.width = width;
        bounds.height = height;
    }

    public void move(int dx, int dy) {
        setX(posX + dx);
        setY(posY + dy);
    }

    public void setX(int x) {
        if (abs(x) <= bounds.x) {
            posX = bounds.x;
            return;
        }
        if (abs(x-width) >= (bounds.x+bounds.width)) {
            posX = -((bounds.x+bounds.width)-width);
            return;
        }

        posX = x;

    }

    public void setY(int y) {
        if (abs(y) > bounds.y && abs(y-height) < (bounds.y+bounds.height)) {
            posY = y;
        }
    }

    public void setPosition(int x, int y) {
        setX(x);
        setY(y);
    }

    public void set() {
        pushMatrix();
        translate(posX, posY);
    }

    public void unset() {
        popMatrix();
    }

    @Override
    public void init() {
    }

    @Override
    public void update() {
    }
}
