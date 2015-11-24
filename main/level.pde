
public class Level extends GameObject {

    private Sprite background;
    private Sprite backgroundLeft;
    private Sprite backgroundRight;

    private Sprite character;

    private HitBox mouse;

    ArrayList<Sprite> platforms;

    public Level(String levelPath) {
        background = new Sprite(levelPath);
        background.setPosition(0,0);
        backgroundLeft = new Sprite(
                background.getX()-10,
                background.getY(),
                10,
                background.getHeight());
        backgroundRight = new Sprite(
                background.getX()+background.getWidth(),
                background.getY(),
                10,
                background.getHeight());

        character = null;

        platforms = new ArrayList<Sprite>();

        mouse = new HitBox(0,0,1,1);

        for (int i=0; i<3; i++) {
            platforms.add(new Sprite(spritePath + "platform"+Integer.toString(i+1)+".png"));
        }

        platforms.get(0).setPosition(0,height-(height/6)-10);
        platforms.get(1).setPosition(width-250,height-(height/5)-10);
        platforms.get(2).setPosition(width/3+22,height-(height/3)+18);
    }

    public int getWidth() {
        return background.getWidth();
    }

    public int getHeight() {
        return background.getHeight();
    }

    public void grabCharacter(Sprite c) {
        character = c;
        character.setPosition(platforms.get(0).getX(), platforms.get(0).getY()-character.getHeight());
    }

    public void init(Camera cam) {
        cam.setBounds(0,0,getWidth(),getHeight());
    }

    @Override
    public void update() {
        pushMatrix();
        background.update();

        if (backgroundLeft.didCollideRight(character.getHitBox())) {
            character.setPositionX(background.getX());
        } else if (backgroundRight.didCollideLeft(character.getHitBox())) {
            character.setPositionX(
                    (background.getX()+background.getWidth())-character.getWidth());
        }

        for (int p=0; p<3; p++) {
            Sprite pl = platforms.get(p);

            if (pl.didCollideTop(character.getHitBox())) {
                character.setPositionY(pl.getY()-character.getHeight());
            }
            if (pl.didCollideBottom(character.getHitBox())) {
                character.setPositionY(pl.getY()+pl.getHeight());
            }
            if (pl.didCollideLeft(character.getHitBox())) {
                character.setPositionX(pl.getX()-character.getWidth());
            }
            if (pl.didCollideRight(character.getHitBox())) {
                character.setPositionX(pl.getX()+pl.getWidth());
            }

            pl.update();
        }

        popMatrix();
    }
}
