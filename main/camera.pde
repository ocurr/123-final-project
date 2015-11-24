
// Camera is an object that allows the level to
// move in relation to the character
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

    // sets the boundaries that the camera cannot cross
    public void setBounds(int x, int y, int width, int height) {
        bounds.x = x;
        bounds.y = y;
        bounds.width = width;
        bounds.height = height;
    }

    // move the camera's position by dx and dy
    public void move(int dx, int dy) {
        setX(posX + dx);
        setY(posY + dy);
    }

    // set the x position of the camera
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

    // set the y position of the camera
    // TODO change to match the setX() function in functionality
    public void setY(int y) {
        if (abs(y) > bounds.y && abs(y-height) < (bounds.y+bounds.height)) {
            posY = y;
        }
    }

    // set the xy position of the camera
    public void setPosition(int x, int y) {
        setX(x);
        setY(y);
    }

    // push the current matrix and translate to the camera's position
    public void set() {
        pushMatrix();
        translate(posX, posY);
    }

    // pop the camera's matrix
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
