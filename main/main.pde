
World world;
Sprite sprite;

String resourcePath = "resources/";
String levelPath = resourcePath + "levels/";
String spritePath = resourcePath + "sprites/";

void setup() {
    size(800, 600);

    sprite = new Sprite(spritePath + "character.png");
    world = new World();

    world.addLevel(levelPath + "level1.png");

    world.init();
}

void mousePressed() {
    if (sprite.didCollide(mouseX,mouseY)) {
        println("collidededed");
    } else {
        println("not collidededed");
    }
}

void keyPressed() {
    world.updateKeyPress(key);
}

void draw() {
    world.update();
    sprite.update();
}