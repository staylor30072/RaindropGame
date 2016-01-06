class Raindrop {
  //declaring all information (fields) contained within the Ball class
  PVector loc, vel;
  float diam;
  float gravity;
  color c, a, b;
  float randy;
  boolean yes = false;
  //this is the constructor
  Raindrop(float p, float g) {
    filter(BLUR);
    diam=random(20, 30);
    loc= new PVector(p, g); //Makes rainsdrops start at top of page 
    c= color(255); //Makes raindrops white
    a=color(255);
    b=color(102, 153, 0);
    vel = PVector.random2D();
    vel.mult(20);
    gravity = random(.5, 1);
    randy=random(0, 1);
  }

  void display () {    //display the raindrop on the screen
    fill(c);
    noStroke();  
    triangle(loc.x-diam/2, loc.y, loc.x+diam/2, loc.y, loc.x, loc.y-diam);
    ellipse(loc.x, loc.y, diam, diam);
  }

  void fall() {    //Causes acceleration and makes raindrop fall
    loc.y+=vel.y;
    if (loc.y<=height) {
      vel.y+=gravity;
    }
  }

  boolean isInContactWith(PVector yay) {
    if (dist(yay.x, yay.y, loc.x, loc.y)<diam/2) {
      return true;
    } else {
      return false;
    }
  }
  void reset() {
    loc.y=0;
    //loc.x=random(width);
    vel = PVector.random2D();
    vel.mult(5);
  }

  void dirtyWater() {
    if (randy<.6) {
      c=a;
    } else {
      c=b;

    }
  }

  boolean ewNasty() {
    if (c==b) {
      return true;
    } else {
      return false;
    }
  }
}