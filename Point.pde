class Point {
  public PVector p;
  
  public Point(float x, float y) {
     p = new PVector(x, y); 
  }
 
  public Point(PVector _p0) {
     p = _p0; 
  }
  
  float x(){ return p.x; }
  float y(){ return p.y; }
  
  public void draw() {
     ellipse(p.x, p.y, 10, 10); 
  }
  
  public float distance(Point o) {
   return PVector.dist( p, o.p );
  }
  //The function of this program is to act as an internal check for each gallery point, and determine if it should be added to the insidePoints arraylist.
  boolean insideGallery(Point p) {
    Point rightRay = new Point(1000, p.p.y);
    Edge checkEdge = new Edge(p, rightRay);
    int intersectionCheck = 0;
    
    for (int i = 0; i < galleryPoints.size()-1; i++) {
       if (i == galleryPoints.size()-2) {
          Edge galleryEdge = new Edge(galleryPoints.get(i+1), galleryPoints.get(0));
          
          if (checkEdge.intersectionTest(galleryEdge) == true) {
             intersectionCheck += 1; 
          }
       }
       Edge galleryEdge = new Edge(galleryPoints.get(i), galleryPoints.get(i+1));
       
       if (checkEdge.intersectionTest(galleryEdge) == true) {
          intersectionCheck += 1; 
       }
    }
    // The reasoning for this check amount is because by checking the sightline formed, it should be only intersecting two other lines at the same point. If it goes above 2, then that means
    // it has crossed a line, making it invalid.
    if (intersectionCheck % 2 == 0) {
       return false; 
    }
    else {
    return true;
    }
  }
}
