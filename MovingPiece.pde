class MovingPiece{
  private int    posX,    posY,    nextX,  nextY;
  private int    deltaX,  deltaY;
  private float  stepX,   stepY;
  private int    countX,  countY;
  private float  angle,   newAngle;
  
  MovingPiece(int startX, int startY){
     posX = startX; posY = startY;
     nextX= startX;nextY = startY;
  }
  
  private void setNewPosition(int x, int y){
    nextX  = x; nextY = y;
    deltaX = nextX - posX;
    deltaY = nextY- posY;
    newAngle  = atan2(deltaY,deltaX);
    
    calculateStepVariables();
  }
  
  
  
  private void display(){
    displayArmy(); 
    updateAngle(3);
    updatePosition();
    
    debugingText(false);
  }
  
  private void displayArmy(){
    if(!keyPressed){noFill();}else{fill(255, 204);}
    triangle(posX + cos(angle-radians(150))*20, posY+sin(angle-radians(150))*20, posX + cos(angle+radians(150))*20, posY+sin(angle+radians(150))*20,posX + cos(angle)*20, posY+sin(angle)*20);
    ellipse(posX,posY,3,3);
  }
  
  private boolean updateAngle(float deg){
    boolean updateing = false;
      if(abs(angle -newAngle) > radians(deg)){
        updateing = true;
        if(abs(angle -newAngle)<PI){
          if(angle -newAngle > 0) angle = angle - radians(deg); else if(angle -newAngle < 0) angle = angle + radians(deg);
        }else{
          if(angle -newAngle > 0) angle = angle + radians(deg); else if(angle -newAngle < 0) angle = angle - radians(deg);
        }
    }
    if(angle < -PI) angle = angle + 2*PI;
    if(angle >  PI) angle = angle - 2*PI;
    return updateing;
  }

  private void calculateStepVariables(){
     if(deltaX != 0 && deltaY != 0){
      if(abs(deltaX) < abs(deltaY)){ stepY = deltaY/deltaX; stepX = 1;}else{ stepX = deltaX/deltaY; stepY = 1;} 
    }else if(deltaX == 0){
      stepX = deltaX; stepY = deltaY;
    }else if(deltaY == 0){
      stepX = deltaX; stepY = deltaY;
    }
    countX = abs(int(stepX)); countY = abs(int(stepY));
  }
  
  private boolean updatePosition(){
    boolean updateOfX = false, updateOfY = false;
    if(countX<=1){ updateOfY = updatePosY(); countX = abs(int(stepX));}else{countX--;}
    if(countY<=1){ updateOfX = updatePosX(); countY = abs(int(stepY));}else{countY--;}
    return updateOfX || updateOfY;
  }
  
  private boolean updatePosY(){
    if(nextY - posY > 0){ posY++; }else if(nextY - posY < 0){ posY--; }else{ posY = nextY;}
    return (nextY != posY);
  }
  
  private boolean updatePosX(){
    if(nextX - posX > 0){ posX++; }else if(nextX - posX < 0){ posX--; }else{ posX = nextX;}
    return (nextX != posX);
  }
  
  private boolean isMoving(){
    return (nextX != posX)||(nextY != posY);  
  }
  
  
//DEBUGING METHODS........................
  private void debugingText(boolean enabled){
    if(enabled){
    text("deltaX:",     25,25);  text(deltaX, 100,25);
    text("deltaY:",     25,50);  text(deltaY, 100,50);
   //text("length:",   25,75);   text(int(sqrt(deltaX*deltaX + deltaY*deltaY)),     100,75);
    text("stepX:",      25,100); text(stepX, 100,100);
    text("stepY:",      25,125); text(stepY, 100,125);
   //text("factorStep:",     25,150);   text(factorStep,     100,150);
    }
  }
  
  
}
