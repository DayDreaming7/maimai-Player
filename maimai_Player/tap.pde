class Tap {
  float x, y;
  float speed;
  int pos;
  float hitTime;
  float alpha;
  int xDirection = 1;
  int yDirection = 1;
  boolean visible = false;

  Tap(float tx, float ty, float ts, int tp, float tdp) {
    x = tx;
    y = ty;
    speed = ts;
    pos = tp;
    hitTime = tdp;
  }

  void checkVisibility(){
    //println(hitTime - getDisBtwPoints(startPoints.get(pos - 1).x, startPoints.get(pos - 1).y, hitPoints.get(pos - 1).x, hitPoints.get(pos - 1).y) / (speed/frameRate));
    // if(playTimer.time() >= 
    // hitTime - (getDisBtwPoints(startPoints.get(pos - 1).x, startPoints.get(pos - 1).y, hitPoints.get(pos - 1).x, hitPoints.get(pos - 1).y) / speed)*(1000/frameRate)/*&& playTimer.time() - hitTime < displayTimeBuffer*/){
    //   visible = true;
    //   }else{
    //     visible = false;
    //   }
    if(x > width || x < 0 || y > height || y < 0){
      visible = false;
    }
  }

  void move(){
    if(visible){
    switch(pos) {
    case 1:
    case 4:
    case 5:
    case 8:
      alpha = 22.5;
      break;
    case 2:
    case 3:
    case 6:
    case 7:
      alpha = 67.5;
      break;
    }

    switch(pos) {    
    case 5:
    case 6:
      xDirection = -1;
      break;
    case 1:
    case 2:
      yDirection = -1;
      break;
    case 7:
    case 8:
      xDirection = -1;
      yDirection = -1;
    }

      x += speed * xDirection * sin(radians(alpha));
      y += speed * yDirection * cos(radians(alpha));
    }
  }

  void display() {
    if(visible){
      shape(psTap, x, y);
    }
  }
}


void displayAllTabs() {
  for (Tap temp : taps) {
    temp.checkVisibility();
    temp.move();
    temp.display();
  }
}