
// Level is an object that handles individual levels
public class Level extends GameObject {

  private Sprite background;
  private Sprite backgroundLeft;
  private Sprite backgroundRight;

  private Sprite eggs;
  private Dinosaur character;
  private Snowman snowman;

  private HitBox mouse;

  private Collider collider;

  ArrayList<Sprite> platforms;

  // takes in a path to the background image
  public Level(String levelPath) {
    background = new Sprite(levelPath);
    background.setPosition(0, 0);
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
    snowman = new Snowman(); 
    snowman.setPosition(900, 360);
    collider = new Collider();

    platforms = new ArrayList<Sprite>();

    mouse = new HitBox(0, 0, 1, 1);

    eggs = new Sprite(spritePath+"eggs.png");
    eggs.setPosition(width+4900, height-90);

    for (int i=0; i<13; i++) {
      platforms.add(new Sprite(spritePath + "platform"+Integer.toString(i+1)+".png"));
    }

    platforms.get(0).setPosition(0, height-60);
    platforms.get(1).setPosition(width-235, height - 60);
    platforms.get(2).setPosition(width+15, height-150);
    platforms.get(3).setPosition(width+400, height-235);
    platforms.get(4).setPosition(width+500, height - 60);
    platforms.get(5).setPosition(width+1100, height - 60);
    platforms.get(6).setPosition(width+1600, height - 60);
    platforms.get(7).setPosition(width+1800, height -240);
    platforms.get(8).setPosition(width+2200, height- 240);
    platforms.get(9).setPosition(width+2800, height-150);
    platforms.get(10).setPosition(width+3200, height-150);
    platforms.get(11).setPosition(width+3600, height-60);
    platforms.get(12).setPosition(width+4500, height-60);
  }

  // get the width of the level
  public int getWidth() {
    return background.getWidth();
  }

  // get the height of the level
  public int getHeight() {
    return background.getHeight();
  }

  // this allows the level to access the character object
  // and sets it's initial position in the level
  public void grabCharacter(Dinosaur c) {
    character = c;
    character.setPosition(platforms.get(0).getX(), platforms.get(0).getY()-character.getHeight());
  }

  // takes in the camera and sets it's bounds to the bouds of the level
  public void init(Camera cam) {
    cam.setBounds(0, 0, getWidth(), getHeight());
  }

  // update the level
  // draws the background and anything else in the level
  // and checks for collisions between the character and anything in the level
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


    for (int p=0; p<13; p++) {
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
      if (pl.didCollideTop(snowman.getHitBox())) {
        snowman.setPositionY(pl.getY() - snowman.getHeight());
      }
      if (pl.didCollideBottom(snowman.getHitBox())) {
        snowman.setPositionY(pl.getY() + pl.getHeight());
      }
      if (pl.didCollideLeft(snowman.getHitBox())) {
        snowman.setPositionX(pl.getX()-snowman.getWidth());
      }
      if (pl.didCollideRight(snowman.getHitBox())) {
        snowman.setPositionX(pl.getX()+pl.getWidth());
      }

      pl.update();
    }

    if (collider.detectCollisionBottom(character.getHitBox(), snowman.getHitBox())) {
      snowman.setkill();
    }

    eggs.update();
    snowman.update();
    snowman.move(new PVector(0, 5));


    popMatrix();
  }
}