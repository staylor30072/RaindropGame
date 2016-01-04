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
  }

  void display() {
    rectMode(RADIUS);
    fill(c);
    rect(loc.x, loc.y, diam, diam);
    fill(c1,c2,c);
    rect(loc.x, loc.y, diam-20, diam-20);
  }

  void update() {
   rectMode(RADIUS);
    fill(c);
    rect(mouseX,mouseY, diam, diam);
    fill(c1,c2,c);
    rect(mouseX, mouseY, diam-20, diam-20);
  }
}