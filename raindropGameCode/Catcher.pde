class Catcher {
  float diam;
  PVector loc;
  float c, c1, c2;

  //constructor
  Catcher(float p, float g) {
    diam=40;
    loc = new PVector(p, g);
    c = 255;
    c1 = 0;
    c2 = 200;
    strokeWeight(5);
  }

  void display() {
    rectMode(RADIUS);
    fill(c);
    rect(loc.x, loc.y, diam, diam);
    stroke(c1,c2,c);
    line(loc.x-diam+5,loc.y+diam-5,loc.x+diam-5,loc.y+diam-5);
  }

  void update() {
   rectMode(RADIUS);
    fill(c);
    noStroke();
    rect(mouseX,mouseY, diam, diam);
    stroke(c1,c2,c);
    line(mouseX-diam+5,mouseY+diam-5,mouseX+diam-5,mouseY+diam-5);
  }
  
  /*boolean letUsCatchAtOnce(PVector yum){
    if(dist(yum.x,loc.x+diam,yum.y,*/
}