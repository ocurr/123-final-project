
// World is an object that handles what a player can
// see and do in the game e.g. menu, levels, cutscenes, etc...
public class World extends GameObject {
    
    private ArrayList<Level> levels;

    private int currentLevel;

    private Camera camera;

    private Sprite character;
    private Dinosaur dino;

    private HashMap<Character,Boolean> keys;

    private int gravity;
    private int jumpHeight;
    private int jumpRate;
    private boolean jumped;

    public World() {
        levels = new ArrayList<Level>();
        currentLevel = 0;

        camera = new Camera();

        gravity = 5;
        jumpHeight = 0;
        jumpRate = 1;
        jumped = false;

        keys = new HashMap<Character,Boolean>();
        keys.put('d',false);
        keys.put('D',false);
        keys.put('a',false);
        keys.put('A',false);
        keys.put('w',false);
        keys.put('W',false);

        // sprites are initialized in the same way as a level
        character = new Sprite(spritePath + "character.png");

        dino = new Dinosaur();
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

    // updates each known key's value
    public void updateKeyPress(char key) {
        keys.put(key,true);
    }

    public void updateKeyRelease(char key) {
        keys.put(key,false);
    }

    // initialize the first level
    @Override
    public void init() {
        levels.get(0).init(camera);
        levels.get(0).grabCharacter(dino);
    }

    // update the world
    // this includes character controls, the camera, and the current level
    @Override
    public void update() {

        int dx, dy;
        dx = dy = 0;

        if (keys.get('d') || keys.get('D')) {
            dx = 10;
        }
        if (keys.get('a') || keys.get('A')) {
            dx = -10;
        }
        if ((keys.get('w') || keys.get('W')) && !jumped) {
            jumped = true;
            jumpHeight = 30;
        }

        //character.move(new PVector(dx,dy+(gravity-jumpHeight)));
        dino.move(new PVector(dx,dy+(gravity-jumpHeight)));

        jumpHeight -= jumpRate;
        if (jumpHeight <= 0) {
            jumped = false;
            jumpHeight = 0;
        }

        if (dino.getX()+dino.getHitBox().getWidth() > width/2) {
            camera.setPosition(-(dino.getX()+dino.getHitBox().getWidth()-width/2), 0);
        }

        camera.set();
        pushMatrix();

        levels.get(currentLevel).update();
        character.update();

        dino.update();

        popMatrix();
        camera.unset();
    }
}
