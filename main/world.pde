
public class World extends GameObject {
    
    private ArrayList<Level> levels;

    private int currentLevel;

    public World() {
        levels = new ArrayList<Level>();
        currentLevel = 0;
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
        if (key == 'd' || key == 'D') {
        }
    }

    @Override
    public void init() {
        levels.get(0).init();
    }

    @Override
    public void update() {
        pushMatrix();

        levels.get(currentLevel).update();

        popMatrix();
    }
}
