static class Utils{

static float dist(int aX, int bX, int aY, int bY){
 return int(sqrt((aX-bX)*(aX-bX)+(aY-bY)*(aY-bY)));
}

static int dist(Point p1,Point p2){
  float d = dist(p1.corX,p2.corX,p1.corY,p2.corY);
  return int(d);
}

}
