float guardRec() {
  float guardNeed = 1;
  for (int i = 1; i < galleryPoints.size()-1; i++) {
      if (i == galleryPoints.size()-2) {
         Triangle endToBegin = new Triangle(galleryPoints.get(i), galleryPoints.get(i+1), galleryPoints.get(0));
         
         if (endToBegin.ccw()) {
            guardNeed += 1; 
         }
      }
      Triangle angleCheck = new Triangle(galleryPoints.get(i-1), galleryPoints.get(i), galleryPoints.get(i+1));
      
      if (angleCheck.ccw()) {
         guardNeed += 1; 
      }
  }
  guardNeed = ceil(guardNeed / 3);
  return guardNeed;
}
