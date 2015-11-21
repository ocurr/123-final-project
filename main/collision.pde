
class Collider {

    int twoBottom;
    int oneBottom;
    int twoRight;
    int oneRight;

    public Collider() {
    }

    private float impLine(float x1, float y1, float x2, float y2, float x, float y) {
        return (y1 - y2)*x + (x2-x1)*y + x1*y2 - x2*y1;
    }

    private void calculatePositions(HitBox one, HitBox two) {
        twoBottom = two.getPositionY() + two.getHeight();
        oneBottom = one.getPositionY() + one.getHeight();
        twoRight = two.getPositionX() + two.getWidth();
        oneRight = one.getPositionX() + one.getWidth();
    }

    public boolean detectTotalCollision(HitBox one, HitBox two) {
        calculatePositions(one, two);
        int posX = one.getPositionX();
        int posY = one.getPositionY();
        int xL = two.getPositionX();
        int xR = two.getPositionX()+two.getWidth();
        int y = two.getPositionY();
        return
            impLine(posX,posY,posX+one.getWidth(),posY,x,y) > 0 &&
            impLine(posX+one.getWidth(),posY+one.getHeight(),posX,posY+one.getHeight(),x,y) > 0 &&
            impLine(posX,posY,posX,posY+one.getHeight(),x,y) < 0 &&
            impLine(posX+one.getWidth(),posY,posX+one.getWidth(),posY+one.getHeight(),x,y) > 0;
    }

    public boolean detectVerticalLine(HitBox hb, int x, int y, int height) {
        boolean left = impLine(x, y, x, y+height, hb.getPositionX(), hb.getPositionY()) > 0;
        boolean right = impLine(x, y, x, y+height, hb.getPositionX(), hb.getPositionY()) < 0;
        return left || right;
        
    }

    public boolean detectCollisionTop(HitBox one, HitBox two) {
        calculatePositions(one, two);
        int bottom = oneBottom - two.getPositionY();
        int top = twoBottom - one.getPositionY();
        int left = twoRight - one.getPositionX();
        int right = oneRight - two.getPositionX();

        return top < bottom && top < left && top < right;
    }

    public boolean detectCollisionBottom(HitBox one, HitBox two) {
        calculatePositions(one, two);
        int bottom = oneBottom - two.getPositionY();
        int top = twoBottom - one.getPositionY();
        int left = twoRight - one.getPositionX();
        int right = oneRight - two.getPositionX();
        return bottom < top && bottom < right && bottom < left;
    }

    public boolean detectCollisionLeft(HitBox one, HitBox two) {
        calculatePositions(one, two);
        int bottom = oneBottom - two.getPositionY();
        int top = twoBottom - one.getPositionY();
        int left = twoRight - one.getPositionX();
        int right = oneRight - two.getPositionX();
        return left < top && left < bottom && left < right;
    }

    public boolean detectCollisionRight(HitBox one, HitBox two) {
        calculatePositions(one, two);
        int bottom = oneBottom - two.getPositionY();
        int top = twoBottom - one.getPositionY();
        int left = twoRight - one.getPositionX();
        int right = oneRight - two.getPositionX();
        return right < top && right < bottom && right < left;
    }
}
