
public class World extends GameObject {
    
    private ArrayList<Level> levels;

    private int currentLevel;

    private Camera camera;

    private Sprite character;

    char currentKey;

    public World() {
        levels = new ArrayList<Level>();
        currentLevel = 0;

        currentKey = 'Z';

        camera = new Camera();

        character = new Sprite(spritePath + "character.png");
    }

    public void addLevel(String levelPath) {
        levels.add(new Level(levelPath));
    }

    public void setCurrentLevel(int level) {
        currentLevel = level-1 < 0 ? 0 : level-1;
    }

    public void incrementCurrentLevel() {
        if (currentLevel < levels.size()) {
            currentLevel++;
        } else {
            currentLevel = levels.size()-1;
        }
    }

    public void decrementLevel() {
        if (currentLevel > 0) {
            currentLevel--;
        } else {
            currentLevel = 0;
        }
    }

    public void updateKeyPress(char key) {
        currentKey = key;
    }

    @Override
    public void init() {
        levels.get(0).init(camera);
        levels.get(0).grabCharacter(character);
    }

    @Override
    public void update() {

        int dx, dy;
        dx = dy = 0;

        if (keyPressed) {
            if (key == 'd' || key == 'D') {
                dx = 5;
            }
            if (key == 'a' || key == 'A') {
                dx = -5;
            }
        }

        character.move(dx,dy);
        if (character.getX() > width/2) {
            camera.setPosition(-(character.getX()-width/2), 0);
        }

        camera.set();
        pushMatrix();

        levels.get(currentLevel).update();
        character.update();

        popMatrix();
        camera.unset();
    }
}
