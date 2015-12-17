class Catcher {
  float diam;
  PVector loc;
  float c;
  float c1;

  //constructor
  Catcher(float p, float g) {
    diam=40;
    loc = new PVector(p, g);
    c = color(255);
    c1 = color(0, 200, 255);
  }

  void display() {
    rectMode(RADIUS);
    fill(c);
    rect(loc.x, loc.y, diam, diam);
    fill(c1);
    rect(loc.x, loc.y, diam-20, diam-20);
  }

}