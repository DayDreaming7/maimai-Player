void drawMainRing() {
  fill(ringColor);
  ellipse(displayWidth/2, displayHeight/2, mainRingOutterR, mainRingOutterR);
  fill(bgColor);
  ellipse(displayWidth/2, displayHeight/2, mainRingInnerR, mainRingInnerR);

  // for(HitPoint temp:hitPoints){
  //   temp.display();
  // }

  for(StartPoint temp:startPoints){
    temp.display();
  }
}


class HitPoint {
  float x, y;
  HitPoint(float tx, float ty) {
    x = tx;
    y = ty;
  }

  void display(){
    fill(hitPointOutterColor);
    ellipse(x, y, hitPointOutterR, hitPointOutterR);
    fill(hitPointInnerColor);
    ellipse(x, y, hitPointInnerR, hitPointInnerR);
  }
}

class StartPoint {
  float x, y;
  StartPoint(float tx, float ty) {
    x = tx;
    y = ty;
  }

  void display(){
    fill(255);
    ellipse(x, y, startPointR, startPointR);
  }
}