class Army extends MovingPiece{
  
  private ArrayList<Point>  list       = new ArrayList<Point>();
  private int               atWayPoint = 0;
  private boolean           isSelected = false;
  
  Army(int x, int y){
    super(x,y);
  }
  
  void userInput(boolean isMouseClicked, int mouseCoordX, int mouseCoordY){
    if(isMouseClicked && Utils.dist(super.getPosX(),mouseCoordX,super.getPosY(),mouseCoordY)<10){
      setSelect(true);
      if(super.isMoving()){stopMoving();}
    }
    if(!isMouseClicked){
      setSelect(false);
    }
    if(isMouseClicked){
      addWayPoint(mouseCoordX,mouseCoordY);
    }
  }
  
  private void stopMoving(){
    list.clear();
    atWayPoint = 0;
  }
  
  private void setSelect(boolean select){
    this.isSelected = select;
  }
  
  private void addWayPoint(int x,int y){
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
    if(!isSelected){noFill();}else{fill(#8492D3);}
    super.display();
    for(Point p: list){
      ellipse(p.corX,p.corY,5,5);
    }
    if(!super.isMoving() && atWayPoint < list.size()){
      Point p =list.get(atWayPoint);      
      super.setNewPosition(p.corX,p.corY);
      atWayPoint++;
      //hej 2
     // if(list.size()>3)list.remove(0);
    }
    
    if(atWayPoint == list.size() && atWayPoint > 0){ 
      stopMoving();
    }
    
    
    noFill();
    debugArmyData(true);
  }

//DEBUGING METHODS........................
  private void debugArmyData(boolean enabled){
    if(enabled){
      text("Seleced: " +  isSelected,super.getPosX(),super.getPosY()+20);
      text("PosX " + super.getPosX() + "PosY " + super.getPosX(),super.getPosX(),super.getPosY()+40);
      text("AtwayPoint: " + atWayPoint,super.getPosX(),super.getPosY()+60);
    text("list size: "+list.size(), super.getPosX(),super.getPosY()+80);
    }
  }

}
