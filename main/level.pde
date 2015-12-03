//Oliver Curry - created technology for hit boxes, collisions, and levels 
//Emily Guerra - added and positioned platforms
// Level is an object that handles individual levels
public class Level extends GameObject {

    private Sprite background;
    private Sprite backgroundLeft;
    private Sprite backgroundRight;
    private Camera camera;

    private Sprite eggs;
    private Dinosaur character;
    private Snowman snowman;
    private SnowCloud snowcloud;

    private HashMap<Character,Boolean> keys;

    private HitBox mouse;

    private Collider collider;

    ArrayList<Sprite> platforms;

    private int gravity;
    private int jumpHeight;
    private int jumpRate;
    private boolean jumped;
    private int numJumps;

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
        camera = null;
        snowman = new Snowman(); 
        snowman.setPosition(900, 360);
        collider = new Collider();

        platforms = new ArrayList<Sprite>();

        keys = new HashMap<Character,Boolean>();
        keys.put('d',false);
        keys.put('D',false);
        keys.put('a',false);
        keys.put('A',false);
        keys.put('w',false);
        keys.put('W',false);

        gravity = 10;
        jumpHeight = 0;
        jumpRate = 1;
        jumped = false;
        numJumps = 0;

        mouse = new HitBox(0, 0, 1, 1);

        eggs = new Sprite(spritePath+"eggs.png");
        eggs.setPosition(width+4900, height-70);
        
        snowcloud = new SnowCloud();
        
      

        for (int i=0; i<15; i++) {
            platforms.add(new Sprite(spritePath + "platform"+Integer.toString(i+1)+".png"));
        }

        platforms.get(0).setPosition(0, height-60);
        platforms.get(1).setPosition(width-235, height - 60);
        platforms.get(2).setPosition(width+15, height-150);
        platforms.get(3).setPosition(width+300, height-235);
        platforms.get(4).setPosition(width+500, height - 60);
        platforms.get(5).setPosition(width+1100, height - 60);
        platforms.get(6).setPosition(width+1600, height - 60);
        platforms.get(7).setPosition(width+1800, height -240);
        platforms.get(8).setPosition(width+2200, height- 240);
        platforms.get(9).setPosition(width+2600, height-150);
        platforms.get(10).setPosition(width+2800, height-150);
        platforms.get(11).setPosition(width+3000, height-150);
        platforms.get(12).setPosition(width+3200, height-60);
        platforms.get(13).setPosition(width+4000, height-60);
        platforms.get(14).setPosition(width+4500, height-60);
    }

    // get the width of the level
    public int getWidth() {
        return background.getWidth();
    }

    // get the height of the level
    public int getHeight() {
        return background.getHeight();
    }
    
    private void reset(){
       character.setPosition(platforms.get(0).getX(), platforms.get(0).getY()-character.getHeight());
        camera.setBounds(0, 0, getWidth(), getHeight());
        camera.setPosition(0,0);
        snowcloud.setPositionX(-500);
    }

    // takes in the camera and sets it's bounds to the bouds of the level
    public void init(Camera cam, Dinosaur c) {
        cam.setBounds(0, 0, getWidth(), getHeight());
        cam.setPosition(0,0);
        character = c;
        character.setPosition(platforms.get(0).getX(), platforms.get(0).getY()-character.getHeight());
        snowcloud.setPositionX(-500);
        camera = cam;
    }

    public void updateKeyReleased(char key) {
        keys.put(key,false);
    }

    public void updateKeyPressed(char key) {
        keys.put(key,true);
    }
    // update the level
    // draws the background and anything else in the level
    // and checks for collisions between the character and anything in the level
    @Override
        public void update() {
            pushMatrix();
            background.update();

            if (character.getY() > height+150) {
                reset();
            }

            int dx, dy;
            dx = dy = 0;

            if (keys.get('d') || keys.get('D')) {
                dx = 4;
                character.flipRight();
                character.dinoAnimate = true;
            }
            else if (keys.get('a') || keys.get('A')) {
                dx = -4;
                character.flipLeft();
                character.dinoAnimate = true;
            }else{
                character.dinoAnimate = false;
            }
            if ((keys.get('w') || keys.get('W')) && !jumped && numJumps < 2) {
                jumped = true;
                jumpHeight = 25;
                numJumps++;
            }

            character.move(new PVector(dx,dy+(gravity-jumpHeight)));


            if (backgroundLeft.didCollideRight(character.getHitBox())) {
                character.setPositionX(background.getX());
            } else if (backgroundRight.didCollideLeft(character.getHitBox())) {
                character.setPositionX(
                        (background.getX()+background.getWidth())-character.getWidth());
            }

            jumpHeight -= jumpRate;
            if (jumpHeight <= 0) {
                jumped = false;
                jumpHeight = 0;
            }

            for (int p=0; p<15; p++) {
                Sprite pl = platforms.get(p);


                if (pl.didCollideTop(character.getHitBox())) {
                    character.setPositionY(pl.getY()-character.getHeight());
                    jumped = false;
                    jumpHeight = 0;
                    numJumps = 0;
                }
                if (pl.didCollideBottom(character.getHitBox())) {
                    character.setPositionY(pl.getY()+pl.getHeight());
                    jumped = false;
                    jumpHeight = 0;
                    numJumps = 0;
                }
                if (pl.didCollideLeft(character.getHitBox())) {
                    character.setPositionX(pl.getX()-character.getWidth());
                }
                if (pl.didCollideRight(character.getHitBox())) {
                    character.setPositionX(pl.getX()+pl.getWidth());
                }
                if (pl.didCollideTop(snowman.getHitBox()) && !snowman.isDead()) {
                    snowman.setPositionY(pl.getY() - snowman.getHeight());
                }
                if (pl.didCollideBottom(snowman.getHitBox()) && !snowman.isDead()) {
                    snowman.setPositionY(pl.getY() + pl.getHeight());
                }
                if (pl.didCollideLeft(snowman.getHitBox()) && !snowman.isDead()) {
                    snowman.setPositionX(pl.getX()-snowman.getWidth());
                }
                if (pl.didCollideRight(snowman.getHitBox()) && !snowman.isDead()) {
                    snowman.setPositionX(pl.getX()+pl.getWidth());
                }

                pl.update();
            }

            if (collider.detectCollisionTop(snowman.getHitBox(), character.getHitBox())) {
                snowman.setkill();
            }
            
            if (collider.detectCollision(snowcloud.getHitBox(), character.getHitBox())){
                reset();
            }

            character.update();

            eggs.update();
            snowman.update();
            snowman.move(new PVector(0, 5));
            snowcloud.move(2);
            snowcloud.update();


            popMatrix();
        }
}
