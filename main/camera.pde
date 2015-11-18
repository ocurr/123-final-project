
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
        int newX = posX + dx;
        int newY = posY + dy;
        posX += dx;
        posY += dy;
    }

    @Override
    public void init() {
    }

    @Override
    public void update() {
    }
}
