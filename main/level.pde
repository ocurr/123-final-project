
public class Level extends GameObject {

    private Sprite background;

    private Sprite character;

    private int gravity;

    ArrayList<Sprite> platforms;

    public Level(String levelPath) {
        background = new Sprite(levelPath);
        background.setPosition(0,0);
        character = null;

        platforms = new ArrayList<Sprite>();

        gravity = 1;

        for (int i=0; i<1; i++) {
            platforms.add(new Sprite(spritePath + "platform"+Integer.toString(i+1)+".png"));
        }

        platforms.get(0).setPosition(0,height-(height/6)-10);
    }

    public int getWidth() {
        return background.getWidth();
    }

    public int getHeight() {
        return background.getHeight();
    }

    public void grabCharacter(Sprite c) {
        character = c;
        character.setPosition(platforms.get(0).getX(), platforms.get(0).getY()-character.getHeight()-20);
    }

    public void init(Camera cam) {
        cam.setBounds(0,0,getWidth(),getHeight());
    }

    @Override
    public void update() {
        pushMatrix();
        background.update();

        if (!background.didCollideLeft(character.getX(), character.getY())) {
            character.setPositionX(background.getX());
        } else if (!background.didCollideRight(
                            character.getX()+character.getWidth(),
                            character.getY())) {
            character.setPositionX(
                (background.getX()+background.getWidth())-character.getWidth());
        }

        for (int p=0; p<1; p++) {
            Sprite pl = platforms.get(p);
            if (
                pl.didCollideTop(
                    character.getX(),
                    character.getY()+character.getHeight()) &&
                pl.didCollideTop(
                    character.getX()+character.getWidth(),
                    character.getY()+character.getHeight())) {
                character.setPositionY(pl.getY()-character.getHeight());
            }

            pl.update();
            pl.drawHitRect();
        }

        character.move(0,gravity);

        popMatrix();
    }
}
