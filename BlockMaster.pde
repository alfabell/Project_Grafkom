PImage img;
PImage imgPlayer;
int playerXCor = 600;
int playerYCor = 590;
int playerWidth = 55;
int playerHeight = 55;
int difficulty = 10;
int limit = 10;
float score = 0;
Baddie[] baddies;
boolean isCollided = false;

void initBaddies(int xMin, int xMax, int yMin, int yMax, int num){
  baddies = new Baddie[num];
 
  for(int i = 0; i < baddies.length; i++){
    int x = (int)random(xMin, xMax);
    int y = (int)random(yMin, yMax);
    baddies[i] = new Baddie(x, y, 30, 15);
  }
}

void setup(){
  size(1280, 720);
  img = loadImage("bg.png");
  imgPlayer = loadImage("tikus.png"); // Load gambar tikus tanah
  initBaddies(-100, width + 20, -250, -80, difficulty);
}
