
World world;

String resourcePath = "resources/";
String levelPath = resourcePath + "levels/";
String spritePath = resourcePath + "sprites/";

void setup() {
    size(800, 600);

    world = new World();

    world.addLevel(levelPath + "level1.png");

    world.init();
}

void mousePressed() {
  
}

void keyPressed() {
    world.updateKeyPress(key);
}

void keyReleased() {
    world.updateKeyRelease(key);
}

void draw() {
    background(255);
    world.update();
}