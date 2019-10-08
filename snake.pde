class snake {
  IntList xs;
  IntList ys;
  int size = 0;
{  
xs = new IntList();
ys = new IntList();
}

snake(int size) {
  this.size = size;
  if (size==1) {
    xs.append(50*floor(random(1000/50)));
    ys.append(50*floor(random(1000/50)));
  } else {
    for (int i = 0; i<size; i++) {
      xs.append(50*i);
      ys.append(50);
    }
  }
}


//tenger slagen 
void drawSnake() {
  fill(0, 255, 0);
  for (int i = 0; i<size; i++) {
    rect(xs.get(i), ys.get(i), 50, 50);
  }
}

void addSize() {
  xs.append(100);
  ys.append(100);
}

//flytter slangen de fire retninger
void moveSnakeUp() {
  for (int i = ys.size()-1; i > 0; i--) {
    ys.set(i, ys.get(i-1));
  }
  ys.sub(0, 50);
  for (int i = xs.size()-1; i > 0; i--) {
    xs.set(i, xs.get(i-1));
  }
}

void moveSnakeRight() {
  for (int i = ys.size()-1; i > 0; i--) {
    ys.set(i, ys.get(i-1));
  }
  for (int i = xs.size()-1; i > 0; i--) {
    xs.set(i, xs.get(i-1));
  }
  xs.add(0, 50);
}

void moveSnakeLeft() {
  for (int i = ys.size()-1; i > 0; i--) {
    ys.set(i, ys.get(i-1));
  }
  for (int i = xs.size()-1; i > 0; i--) {
    xs.set(i, xs.get(i-1));
  }
  xs.sub(0, 50);
}  

void moveSnakeDown() {
  for (int i = ys.size()-1; i > 0; i--) {
    ys.set(i, ys.get(i-1));
  }
  for (int i = xs.size()-1; i > 0; i--) {
    xs.set(i, xs.get(i-1));
  }
  ys.add(0, 50);
} 

boolean collisionWithSelf() {
  for (int i = 1; i<size; i++) {
    if (xs.get(0)==xs.get(i)&&ys.get(0)==ys.get(i)) {
      return true;
    }
  }
  return false;
}
boolean collsionWithWall() {
  if (xs.get(0)>=width || xs.get(0)<0 || ys.get(0)<0||ys.get(0)>=height) {
    return true;
  }
  return false;
}
}
