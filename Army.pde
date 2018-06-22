class Army extends MovingPiece{
  
  private ArrayList<Point>  list       = new ArrayList<Point>();
  private int               atWayPoint = 0;
  private boolean           isSelected = false;
  
  Army(int x, int y){
    super(x,y);
  }
  
  void stopMoving(){
    list.clear();
    atWayPoint = 0;
  }
  
  void setSelect(boolean select){
    this.isSelected = select;
  }
  
  void addWayPoint(int x,int y){
    if(isSelected){
      Point p       =  new Point(x,y);
      
      if(list.size()>0){
        Point p_last  =  list.get(list.size()-1);  
         if(Utils.dist(p_last,p)>10) list.add(p);
      }else{
        list.add(p);
      }
    }
  }
  
  void displayAndUpdate(){
    super.display();
    if(!isSelected){noFill();}else{fill(#8492D3);}
    for(Point p: list){
      ellipse(p.corX,p.corY,5,5);
    }
    if(!super.isMoving() && atWayPoint < list.size()){
      Point p =list.get(atWayPoint);
      super.setNewPosition(p.corX,p.corY);
      atWayPoint++;
    }
    if(atWayPoint == list.size() && atWayPoint > 0){
      stopMoving();
    }
    debugingText(true);
  }

//DEBUGING METHODS........................
  private void debugingText(boolean enabled){
    if(enabled){
    text("list size:",     25,height - 100 + 25);  text(list.size(),  100,height - 100 + 25);
    text("atWayPoint:",    25,height - 100 + 50);  text(atWayPoint,   100,height - 100 + 50);

    }
  }
}
