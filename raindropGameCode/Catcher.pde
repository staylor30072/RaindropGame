class Catcher {
  float diam, a;
  PVector loc;
  float c, c1, c2;
  int count;

  //constructor
  Catcher(float p, float g) {
    diam=40;
    loc = new PVector(p, g);
    c = 255;
    c1 = 0;
    c2 = 200;
    a = 5;
    strokeWeight(5);
    count= 3;
  }

  void display() {
    rectMode(RADIUS);
    fill(c);
    rect(loc.x, loc.y, diam, diam);
  }

  void update() {
    rectMode(RADIUS);
    fill(c);
    noStroke();
    rect(mouseX, mouseY, diam, diam);
    stroke(c1, c2, c);
    fill(c1, c2, c);
    rect(mouseX, mouseY+diam, diam-4, count);
    stroke(c);
    line(mouseX-diam, mouseY+diam, mouseX+diam, mouseY+diam);
  }

  boolean isInContactWith(PVector yay) {
    if (yay.x>=mouseX-diam && yay.y<=mouseY+diam && yay.x<=mouseX+diam&& yay.y>=mouseY-diam) {
      count++;
      return true;
    } else {
      return false;
    }
  }

  void pointSystem(float p, float b, float j, int points) {

    textAlign(CENTER);
    textSize(j);
    text(points, p, b);
  }
}