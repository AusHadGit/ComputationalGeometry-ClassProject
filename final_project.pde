
import java.util.*;

ArrayList<Point> userPoints = new ArrayList<Point>();
ArrayList<Edge> sightLines = new ArrayList<Edge>();
ArrayList<Point> squarePoints = new  ArrayList<> (List.of(new Point(300, 600), new Point(600, 600), new Point(600, 300), new Point(300, 300)));
ArrayList<Point> secondPoints = new  ArrayList<> (List.of(new Point(100, 350), new Point(250, 400), new Point(350, 550), new Point(450, 400), new Point(550, 550), new Point(650, 400), new Point(800, 350), new Point(650, 300), new Point(550, 200), new Point(450, 300), new Point(350, 200), new Point(250, 300)));
ArrayList<Point> uShapePoints = new ArrayList<> (List.of(new Point(200, 200), new Point(300, 200), new Point(300, 500), new Point(600, 500), new Point(600, 200), new Point(700, 200), new Point(700, 600), new Point(200, 600)));
ArrayList<Point> angledPoints = new ArrayList<> (List.of(new Point(150, 100), new Point(250, 200), new Point(200, 175), new Point(300, 400), new Point(225, 500), new Point(115, 450), new Point(200, 300)));
ArrayList<Point> galleryPoints = (ArrayList)squarePoints.clone();
float angleBound = 1;
boolean covered = false;

//The reason why I have these functions set up that rely upon other files was so I could keep the amount of lines down in the main file, increasing readability
void galleryCover() {
  covered = isCovered();
}

void createLines() {
  sightLines = SightLines();
}

void guardsNeed() {
   angleBound = guardRec();
}

void setup(){
  size(800,800,P3D);
  frameRate(30);
}

void draw(){
  background(255);
  
  translate( 0, height, 0);
  scale( 1, -1, 1 );
  
  strokeWeight(3);
  
  fill(0);
  noStroke();
  for( Point p : userPoints ){
    p.draw();
  }
  
  for (Point gP: galleryPoints) {
      gP.draw();
  }
  
  noFill();
  stroke(100);
  for (int i = 0; i < galleryPoints.size()-1; i++) {
     if (i == galleryPoints.size()-2) {
        line(galleryPoints.get(i+1).p.x, galleryPoints.get(i+1).p.y, galleryPoints.get(0).p.x, galleryPoints.get(0).p.y);
     }
     line(galleryPoints.get(i).p.x, galleryPoints.get(i).p.y, galleryPoints.get(i+1).p.x, galleryPoints.get(i+1).p.y);
  }
  
  for (Point p: userPoints) {
     if (p.insideGallery(p) == true) {
       fill(255, 172, 28);
       p.draw();
     }
  }
  
  
  stroke(0, 255, 0);
  for (Edge sL: sightLines) {
     sL.drawDotted();
  }
  
  fill(0);
  textSize(20);
  textRHC("Choose the gallery shape", 10, height-20);
  textRHC("1: 4 Corner Gallery", 10, height-40);
  textRHC("2: 12 Corner Gallery", 10, height-60);
  textRHC("3: 8 Corner Gallery", 10, height-80);
  textRHC("4: 7 Corner Gallery", 10, height-100);
  textRHC("c: Clear Points", 10, height-120);
  textRHC("All corners of gallery seen: " + (covered?"True":"False"), width-350, height-20);
  textRHC("Recommended number of guards: " + int(angleBound), width-350, height-40);
}

void textRHC( int s, float x, float y ){
  textRHC( Integer.toString(s), x, y );
}

void textRHC( String s, float x, float y ){
  pushMatrix();
  translate(x,y);
  scale(1,-1,1);
  text( s, 0, 0 );
  popMatrix();
}

void keyPressed() {
  if (key == 'c') {
     userPoints.clear(); 
     sightLines.clear();
  }
  if (key == '1') {
     galleryPoints.clear();
     galleryPoints = (ArrayList)squarePoints.clone();
     sightLines.clear();
     guardsNeed();
  }
  if (key == '2') {
     galleryPoints.clear();
     galleryPoints = (ArrayList)secondPoints.clone();
     sightLines.clear();
     guardsNeed();
  }
  if (key == '3') {
     galleryPoints.clear();
     galleryPoints = (ArrayList)uShapePoints.clone();
     sightLines.clear();
     guardsNeed();
  }  
  if (key == '4') {
     galleryPoints.clear();
     galleryPoints = (ArrayList)angledPoints.clone();
     sightLines.clear();
     guardsNeed();
  }
}

Point sel = null;

void mousePressed() {
  int mouseXRHC = mouseX;
  int mouseYRHC = height-mouseY;
  
  float dT = 6;
  for( Point p : userPoints ) {
    float d = dist( p.p.x, p.p.y, mouseXRHC, mouseYRHC );
    if( d < dT ){
      dT = d;
      sel = p;
    }
  }
  
  if( sel == null ) {
    sel = new Point(mouseXRHC,mouseYRHC);
    userPoints.add( sel );
    createLines();
    galleryCover();
  }
}

void mouseDragged() {
  int mouseXRHC = mouseX;
  int mouseYRHC = height-mouseY;
  if( sel != null ) {
    sel.p.x = mouseXRHC;   
    sel.p.y = mouseYRHC;
    createLines();
    galleryCover();
  }
  
}

void mouseReleased(){
  sel = null;
}




  
