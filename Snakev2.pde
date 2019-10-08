//TODO: Screensize compatability
//BUGFIX: 
int score = 0;
int highscore = 0;
String lastMove = "";
void setup() {
  size(1000, 1000);
  frameRate(10);
  target.newTarget();
  frameRate(10);
  textAlign(CENTER);
  surface.setTitle("snake");
}
snake player = new snake(score+1);
target target = new target(false);
void draw() {
  background(200);
  switch (key) {
  case 'w':
    if (lastMove!="down") {
      player.moveSnakeUp();
      lastMove="up";
    } else {
      player.moveSnakeDown();
    }
    break;
  case 'a':
    if (lastMove!="right") {
      player.moveSnakeLeft();
      lastMove="left";
    } else {
      player.moveSnakeRight();
    }
    break;
  case 's':
    if (lastMove!="up") {
      player.moveSnakeDown();
      lastMove="down";
    } else {
      player.moveSnakeUp();
    }
    break;
  case 'd':
    if (lastMove!="left") {
      player.moveSnakeRight();
      lastMove="right";
    } else {
      player.moveSnakeLeft();
    }
    break;
  }
  target.drawTarget();
  player.drawSnake();
  fill(0);
  textSize(12);
  text("score:" + score, 0, 0);
  if (player.collisionWithSelf()||player.collsionWithWall()) {
    noLoop();
    textSize(185*width/1000);
    background(200);
    fill(0);
    text("Game Over", width/2, height/2);
    textSize(95);
    if (score > highscore) {
      highscore = score;
    }
    text("Score:" + score, width/2, 7*height/10);
    text("Highscore:" + highscore, width/2, 8*height/10);
  }
  if (target.x == player.xs.get(0)+25 && target.y == player.ys.get(0)+25) {
    score+=1;
    player.addSize();
    target.newTarget();
    player.size +=1;
  }
}
void keyPressed() {
  if (key=='r') {
    score = 0;
    player.size=1;
    loop();
    player = new snake(score +1);
    lastMove = "";
    target.newTarget();
  }
}
