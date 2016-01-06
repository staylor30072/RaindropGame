class Catcher {
  //declare variables
  float diam, a;
  PVector loc;
  float c, c1, c2;
  int count;

  //constructor
  Catcher(float p, float g) {
    //initialize variables
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
    //drawing of the catcher
    rectMode(RADIUS);
    fill(c);
    noStroke();
    rect(loc.x, loc.y, diam, diam);
    stroke(c1, c2, c);
    fill(c1, c2, c);
    rect(loc.x, loc.y+diam, diam-4, count);
    stroke(c);
    line(loc.x-diam, loc.y+diam, loc.x+diam, loc.y+diam);
  }

  void update() {
    //catcher now follows mouse
    rectMode(RADIUS);
    fill(c);
    noStroke();
    rect(mouseX, mouseY, diam, diam);
    fill(c1, c2, c);
    rect(mouseX, mouseY+diam, diam-4, count);
    stroke(c);
    line(mouseX-diam, mouseY+diam, mouseX+diam, mouseY+diam);
  }

  boolean isInContactWith(PVector yay) {      //checks to see if a PVector is touching the location of the catcher
    if (yay.x>=mouseX-diam && yay.y<=mouseY+diam && yay.x<=mouseX+diam&& yay.y>=mouseY-diam) {
      count++;      //the amount of liquid in catcher increases
      return true;
    } else {
      return false;
    }
  }

  boolean amIFull() {      //checks to see if catcher is filled to the max
    if (count>=2*diam-4) {
      return true;
    } else {
      return false;
    }
  }

  void refillMeBaby() {
    count=3;
  }
}