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
  imgPlayer = loadImage("tikus.png");
  initBaddies(-100, width + 20, -250, -80, difficulty);
}

void draw(){
  image(img, 0, 0);
  drawPlayer();
  
  if(!isCollided){
    moveBaddies();
    if(score > limit && score < limit + 2){
      initBaddies(-100, width + 20, -260, -80, difficulty); 
      difficulty += 10; 
      limit += 20;
    }
  } else {
    drawRestartButton();
    text("Score: " + (int)score, 100, 100);
  }
}

void moveBaddies(){
  for(int i = 0; i < baddies.length; i++){
    if(baddies[i].yCor > height){
      baddies[i].yCor = -10;
    }
    baddies[i].display();
    baddies[i].drop(random(1, 15));
    
    boolean conditionXLeft = baddies[i].xCor + baddies[i].w >= playerXCor;
    boolean conditionXRight = baddies[i].xCor + baddies[i].w <= playerXCor + playerWidth + 4;
    boolean conditionUp =  baddies[i].yCor >= playerYCor;
    boolean conditionDown = baddies[i].yCor + baddies[i].h <= playerYCor + playerHeight;
    
    if(conditionXLeft && conditionXRight && conditionUp && conditionDown){
      isCollided = true;
    }
  }
 
  score += 0.1;
  fill(0, 102, 153);
  text("Score: " + (int)score, 10, 60);
  textSize(50);
}

void drawPlayer(){
  image(imgPlayer, playerXCor, playerYCor, playerWidth, playerHeight);
}

void mouseDragged(){
  if(mouseX >= 0 && mouseX <= width - playerWidth + 1){
    playerXCor = mouseX;
  }
  if(mouseY >= 590 && mouseY <= height - playerHeight){
    playerYCor = mouseY;
  }
}

void drawRestartButton(){
  fill(0, 255, 0);
  rect(width/2 - 100, height/2 - 25, 200, 50, 10);
  
  fill(0);
  textSize(20);
  textAlign(CENTER, CENTER);
  text("Restart Permainan", width/2, height/2);
  
  textAlign(LEFT, BASELINE);
}
