import java.util.*;

//DEBUG FLAGS
boolean debugArmyStats  = true;
boolean debugMousePos   = false;
// 

LinkedList<Army> list = new LinkedList<Army>();

//test
void setup(){
  size(displayHeight,displayWidth);
  
  for(int i = 0; i<5;i++){
    for(int j = 0; j<5;j++){
      list.add(new Army(width/2-250+i*50,height/2-250+j*50));
    }
  }
  
  rectMode(CENTER);
  //frameRate(15);
}

void draw(){
  background(204);

  for(Army army: list){
      army.userInput(mousePressed,mouseX,mouseY);
      army.displayAndUpdate();
  }
  
  debugMouse(debugMousePos);
}

//DEBUGING METHODS........................
  private void debugMouse(boolean enable){
    if(enable){
      text("mouseX: " + mouseX + " mouseY: "+ mouseY,     width - 200,25);
    }
  }
