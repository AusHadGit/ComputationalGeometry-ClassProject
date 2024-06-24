boolean isCovered() {
   Map<Point, Integer> coverage = new HashMap<Point, Integer>();
   ArrayList<Point> sightSpots = new ArrayList<Point>();
   boolean sightCover = true;
   //For any gallery that is chosen, we put its points into a hashmap as keys, with values of 0 attached to each one.
   for (Point gP: galleryPoints) {
       coverage.put(gP, 0);
   }
  
   //This function would increment the key points' values in the hashmap created above by going through the end points of the sightlines,
   //but only if there are sightlines in the first place. If there's no guard inside the gallery, then there is no coverage to be had at all.
   if (sightLines.size() > 0) {
        for (int i = 0; i < sightLines.size(); i++) {
           sightSpots.add(sightLines.get(i).p1); 
        }
   }
   
   for (Point p: sightSpots) {
       if (coverage.get(p) != null) {
          coverage.put(p, coverage.get(p) + 1); 
       }
   }
   
   for (int check: coverage.values()) {
      if (check == 0) {
         sightCover = false;
         break;
      }
   }
   
   if (sightCover == true) {
      return true; 
   }
   else {
      return false; 
   }
}
