class Army extends MovingPiece{
  
  ArrayList<Point>  list       = new ArrayList<Point>();
  int               atWayPoint = 0;
  
  Army(int x, int y){
    super(x,y);
  }
  
  void addWayPoint(int x,int y){
    Point p       =  new Point(x,y);
    
    if(list.size()>0){
      Point p_last  =  list.get(list.size()-1);  
      if(sqrt((p_last.corX-p.corX)*(p_last.corX-p.corX)+(p_last.corY-p.corY)*(p_last.corY-p.corY))>10)
       list.add(p);
    }else{
      list.add(p);
    }
  }
  
  void displayAndUpdate(){
    super.display();
    for(Point p: list){
      ellipse(p.corX,p.corY,5,5);
    }
    if(!super.isMoving() && atWayPoint < list.size()){
      Point p =list.get(atWayPoint);
      super.setNewPosition(p.corX,p.corY);
      atWayPoint++;
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

//CLASS POINT.....
class Point{
  int corX, corY;
  
  Point(int x, int y){
    corX = x;
    corY = y;
  }  
}
