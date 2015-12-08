
// World is an object that handles what a player can
// see and do in the game e.g. menu, levels, cutscenes, etc...
public class World extends GameObject {

  private ArrayList<Level> levels;

  private int currentLevel;

  private Camera camera;

  private Dinosaur dino;

  private EndScene endscene;
  private StartScene startscene;
  private boolean gamestarted = true;
  private boolean gameended = false;
  private boolean menu = true;
  private boolean tutorial = false;

  private Sprite menuScreen;
  private Sprite tutorialScreen;


  private HashMap<Character, Boolean> keys;

  public World() {
    levels = new ArrayList<Level>();
    currentLevel = 0;

    camera = new Camera();

    dino = new Dinosaur();

    menuScreen = new Sprite(resourcePath + "dinodisaster.png");
    tutorialScreen = new Sprite(resourcePath + "instructions.png");

    endscene = new EndScene();
    startscene = new StartScene();
  }

  // takes in the path to a level and adds the resulting object to
  // the arraylist
  public void addLevel(String levelPath) {
    levels.add(new Level(levelPath));
  }

  // takes in the requested level and checks whether it is
  // a valid level
  // TODO: there is a better way of doing this
  //       involving the actual level arraylist
  public void setCurrentLevel(int level) {
    // look up the '?' operator if this confuses you
    currentLevel = level-1 < 0 ? 0 : level-1;
  }

  // increases the current level by one
  public void incrementCurrentLevel() {
    if (currentLevel < levels.size()) {
      currentLevel++;
    } else {
      currentLevel = levels.size()-1;
    }
  }

  // decreases the current level by one
  public void decrementLevel() {
    if (currentLevel > 0) {
      currentLevel--;
    } else {
      currentLevel = 0;
    }
  }

    public void updateLevelKeysPressed(char key) {
      if (key == ' ') {
        if (menu) {
          menu = false;
          tutorial = true;
        } else if (tutorial) {
          tutorial = false;
          gamestarted = false;
        } else if (gameended) {
          gamestarted = false;
          gameended = false;
          startscene = new StartScene();
          endscene = new EndScene();
          menu = true;
          tutorial = false;
        } else if (!gamestarted) {
          surface.setSize(800,600);
          gamestarted = true;
          levels.get(0).init(camera, dino);
        }
      }
        levels.get(currentLevel).updateKeyPressed(key);
    }

    public void updateLevelKeysReleased(char key) {
        levels.get(currentLevel).updateKeyReleased(key);
    }

    // initialize the first level
    @Override
    public void init() {
        levels.get(0).init(camera, dino);
    }

    // update the world
    // this includes character controls, the camera, and the current level
    @Override
        public void update() {
            if(dino.getX() >= width+4700 && gamestarted){
                gameended = true;
            }

            if (menu) {
              surface.setSize(1034, 510);
              menuScreen.update();
            } else if (tutorial) {
              surface.setSize(1034, 600);
              tutorialScreen.update();
            } else if (gameended){
              surface.setSize(1034, 510);
              endscene.update();
              gamestarted = false;
            } else if (!gamestarted){
              surface.setSize(1034, 510);
              startscene.update();
            } else {

                if (dino.getX()+dino.getHitBox().getWidth() > width/2) {
                    camera.setPosition(-(dino.getX()+dino.getHitBox().getWidth()-width/2), 0);
                }

                camera.set();
                pushMatrix();

                levels.get(currentLevel).update();

                dino.update();

                popMatrix();
                camera.unset();
            }
        }
}
