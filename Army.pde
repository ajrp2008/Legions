class Army extends MovingPiece{
  
  private LinkedList<Point>  list       = new LinkedList<Point>();
  private boolean           isSelected = false;
  
  Army(int x, int y){
    super(x,y);
  }
  
  void userInput(boolean isMouseClicked, int mouseCoordX, int mouseCoordY){
    if(isMouseClicked && Utils.dist(super.getPosX(),mouseCoordX,super.getPosY(),mouseCoordY)<10){
      setSelect(true);
      if(super.arrivedAtWayPoint()){stopMoving();}
    }
    if(!isMouseClicked){
      setSelect(false);
    }
    if(isMouseClicked){
      addWayPointIfSelected(mouseCoordX,mouseCoordY);
    }
  }
  
  private void stopMoving(){
    list.clear();
  }
  
  private void setSelect(boolean select){
    this.isSelected = select;
  }
  
  private void addWayPointIfSelected(int x,int y){
    if(isSelected){
      Point p       =  new Point(x,y);
      
      if(list.size()>0){
        Point p_last  =  list.get(list.size()-1);  
         if(Utils.dist(p_last,p)>40) list.add(p);
      }else{
         if(Utils.dist(super.getPosX(),p.corX,super.getPosY(),p.corY)>40) list.add(p);
      }
    }
  }
  
  void displayAndUpdate(){
    display();
    update();
    debugArmyData(debugArmyStats);
  }
  
  private void display(){
  if(!isSelected){noFill();}else{fill(#8492D3);}
    super.display();
    for(Point p: list){
      ellipse(p.corX,p.corY,5,5);
    }
    ellipse(super.getNextPosX(), super.getNextPosY(),5,5);
  noFill();

  }
  
  private void update(){
      if(!super.arrivedAtWayPoint() && list.size()>0){  //Continue until list is empty!      
      Point p =list.get(0);      
      list.remove(0);
      super.setNewPosition(p.corX,p.corY);
    }
    
    if(list.size()<1){                                //stop when list is empty
      stopMoving();
    }  
  }
  
  
  
  

//DEBUGING METHODS........................
  private void debugArmyData(boolean enabled){
    if(enabled){
      text("Seleced: " +  isSelected,super.getPosX(),super.getPosY()+20);
      text("PosX " + super.getPosX() + "PosY " + super.getPosX(),super.getPosX(),super.getPosY()+40);
      text("list size: "+list.size(), super.getPosX(),super.getPosY()+80);
    }
  }

}
