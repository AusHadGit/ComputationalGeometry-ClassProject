//The entire purpose of this class is to help with getting as close as possible to the optimal number of guards
class Triangle {
   Point p0,p1,p2;
     
   Triangle(Point _p0, Point _p1, Point _p2 ) {
     p0 = _p0; p1 = _p1; p2 = _p2;
   }
   
   boolean ccw() {
     PVector v1 = PVector.sub( p1.p, p0.p );
     PVector v2 = PVector.sub( p2.p, p0.p );
     float z = v1.cross(v2).z;
     return z > 0;
   }
}
