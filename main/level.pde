
public class Level extends GameObject {

    private PImage img;

    public Level(String levelPath) {
        img = loadImage(levelPath);
        img.loadPixels();
    }

    @Override
    public void init() {
    }

    @Override
    public void update() {
        image(img, 0,0);
    }
}
