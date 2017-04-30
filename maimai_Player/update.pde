void update(){
  drawMainRing();
  displayAllTabs();


  for(HitPoint temp:hitPoints){
    temp.display();
  }
}
