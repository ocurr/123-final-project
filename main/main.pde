
World world;

//these are the paths to images and other
//external resources that are required by the game
String resourcePath = "resources/";
String levelPath = resourcePath + "levels/";
String spritePath = resourcePath + "sprites/";
String endingPath = resourcePath + "ending/";
String startPath = resourcePath + "dinosaurwbg/";

void setup() {
    //this size is not final it is the size that I arbitrarily chose
    //to test at
    size(800, 600);
    surface.setResizable(true);

    // create the game world
    world = new World();

    // add levels here
    // levels are added using the path to their background image
    world.addLevel(levelPath + "largebg.png");

    // initialize world
    world.init();

    noStroke();
}

void mousePressed() {
}

void keyPressed() {
    world.updateLevelKeysPressed(key);
    if (key == 'p') {
        saveFrame("frame.jpg");
    }
}

void keyReleased() {
    world.updateLevelKeysReleased(key);
}

// update the world and background
void draw() {
    background(0);
    world.update();
}
