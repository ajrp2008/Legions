Army army;
//test
void setup(){
  size(600,600);  
  army = new Army(width/2, height/2);
  rectMode(CENTER);
}

void draw(){
  background(204);
  if(mousePressed){
    army.setNewPosition(mouseX,mouseY);
  }
  army.display();
  
  debugMouse();
}

//DEBUGING METHODS........................
  private void debugMouse(){
    text("mouseX: " + mouseX + " mouseY: "+ mouseY,     width - 200,25);
  }
