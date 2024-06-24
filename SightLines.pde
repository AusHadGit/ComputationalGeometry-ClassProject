//To help improve readability, I chose to take this variable and put it into its own file.
ArrayList<Edge> SightLines() {
   ArrayList<Edge> possibleLines = new ArrayList<Edge>();
   ArrayList<Edge> galleryEdge = new ArrayList<Edge>();
   ArrayList<Edge> sightLines = new ArrayList<Edge>();
   //The first part to creating the sightlines of every guard point to the corners is to find all the possible lines that can form.
   //Which first involves finding all the points that are inside the polygon itself, and then making edges with them and every poin in the polygon.
   for (int i = 0; i < userPoints.size(); i++) {
      if (userPoints.get(i).insideGallery(userPoints.get(i)) == true) {
          for (int j = 0; j < galleryPoints.size(); j++) {
            possibleLines.add(new Edge(userPoints.get(i), galleryPoints.get(j)));
          }
      }
   }
   //Then, to ensure that everytime that this is called, that we are dealing with the actual number of polygon edges,
   //We set up an arraylist of that in here.
   for (int i = 0; i < galleryPoints.size()-1; i++) {
      if (i == galleryPoints.size()-2) {
        galleryEdge.add(new Edge(galleryPoints.get(i+1), galleryPoints.get(0)));
      }
      galleryEdge.add(new Edge(galleryPoints.get(i), galleryPoints.get(i+1)));
   }
   //The logic for this part is that since a possible line will be connecting to a point, it will always be intercepting two other lines at least. 
   //Which means we only want the possible lines with only two intercepts detected, for any more means that it crosses a polygon line, invalidating it as a sight line
   if (possibleLines.size() > 0) {
      for (Edge pL: possibleLines) {
        int interCheck = 0;
        for (Edge gE: galleryEdge) {
           if (pL.intersectionTest(gE) == true) {
              interCheck += 1;
           }
        }
        if (interCheck == 2) {
           sightLines.add(pL); 
        }
      }
   }
   
   return sightLines;
}
