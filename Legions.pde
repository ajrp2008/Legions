ArrayList<Army> list = new ArrayList<Army>();

//test
void setup(){
  size(600,600);
  for(int i = 0; i<1;i++){
    for(int j = 0; j<1;j++){
      list.add(new Army(width/2-250+i*100,height/2-250+j*100));
    }
  }
  
  rectMode(CENTER);
}

void draw(){
  background(204);

  for(Army army: list){
      army.userInput(mousePressed,mouseX,mouseY);
      army.displayAndUpdate();
  }
  
  debugMouse();
}

//DEBUGING METHODS........................
  private void debugMouse(){
    text("mouseX: " + mouseX + " mouseY: "+ mouseY,     width - 200,25);
  }
