Army army;
//test
void setup(){
  size(600,600);  
  army = new Army(width/2, height/2);
  rectMode(CENTER);
}

void draw(){
  background(204);
  
  if(mousePressed && Utils.dist(army.getPosX(),mouseX,army.getPosY(),mouseY)<10){
    army.setSelect(true);
    if(army.isMoving()){army.stopMoving();}
  }
  if(!mousePressed){
    army.setSelect(false);
  }
  if(mousePressed){
    army.addWayPoint(mouseX,mouseY);
  }
  
  army.displayAndUpdate();
  
  debugMouse();
}

//DEBUGING METHODS........................
  private void debugMouse(){
    text("mouseX: " + mouseX + " mouseY: "+ mouseY,     width - 200,25);
  }
