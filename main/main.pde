 
World world;

//these are the paths to images and other
//external resources that are required by the game
String resourcePath = "resources/";
String levelPath = resourcePath + "levels/";
String spritePath = resourcePath + "sprites/";

void setup() {
    //this size is not final it is the size that I arbitrarily chose
    //to test at
    size(800, 600);

    // create the game world
    world = new World();

    // add levels here
    // levels are added using the path to their background image
    world.addLevel(levelPath + "skyonly.png");

    // initialize world
    world.init();

    noStroke();
}

void mousePressed() {
}

// While these two are un-neccessary they gives a better flow of control
void keyPressed() {
    world.updateKeyPress(key);
}

void keyReleased() {
    world.updateKeyRelease(key);
}

// update the world and background
void draw() {
    background(0);
    world.update();
}