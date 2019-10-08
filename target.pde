class target {
  int x, y;
  boolean exists;
  target(boolean exists) {
    this.exists = exists;
  }
  //vælger et nyt sted på gridet at lave et target
  void newTarget() {
    x = 50*floor(random(width/50))+25;
    y = 50*floor(random(height/50))+25;
  }
  //tegner en rød cirkel ved x,y
  void drawTarget() {
    fill(255, 0, 0);
    circle(x, y, 50);
  }
}
