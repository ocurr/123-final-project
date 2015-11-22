
public class Level extends GameObject {

    private Sprite background;

    private Sprite character;

    private HitBox mouse;

    ArrayList<Sprite> platforms;

    public Level(String levelPath) {
        background = new Sprite(levelPath);
        background.setPosition(0,0);
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
        character.setPosition(platforms.get(0).getX(), platforms.get(0).getY()-character.getHeight()-50);
    }

    public void init(Camera cam) {
        cam.setBounds(0,0,getWidth(),getHeight());
    }

    @Override
    public void update() {
        mouse.setPosition(mouseX,mouseY);
        pushMatrix();
        background.update();

        /*
        if (!background.didCollideLeft(character.getHitBox())) {
            character.setPositionX(background.getX());
        } else if (background.didCollideRight(character.getHitBox())) {
            character.setPositionX(
                    (background.getX()+background.getWidth())-character.getWidth());
        }
        */

        if (mousePressed) {
            if (character.didCollideLeft(mouse)) {
                println("COLLIDEDEDED");
            } else {
                println("NOT COLLIDEDEDED");
            }
        }

        /*
        for (int p=0; p<3; p++) {
            Sprite pl = platforms.get(p);
            if (pl.didCollideTop(character.getHitBox())) {
                character.setPositionY(pl.getY()-character.getHeight());
            }

            pl.update();
            //pl.drawHitRect();
        }
        */

        popMatrix();
    }
}
