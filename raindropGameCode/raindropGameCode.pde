PVector mouse;   //declare a P
int count=10;
ArrayList<Raindrop> r = new ArrayList<Raindrop>();
int rec =150;
Catcher bucket;
Timer theBucketSlayer;
int yaass=0;
int ewNo=0;
int mode=0;

// On your own, create an array of Raindrop objects instead of just one
// Use the array instead of the single object
// You can start out by just using the single Raindrop as you test


void setup() {
  size(1200, 800);
  mouse = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  r.add(new Raindrop(random(width), 0));
  bucket = new Catcher(width/2, height/2);
  theBucketSlayer = new Timer();
}

void draw() {
  if (mode==0) {
    background(0, 200, 255);
    bucket.display();
    fill(255);
    textSize(200);
    textAlign(CENTER);
    text("Raindrops", width/2, height/4);
    textSize(50);
    text("Fill your bucket with clean water", width/2, 3*height/4);
    text("as quickly as possible.", width/2, 3*height/4+50);
    text("Press Enter to begin", width/2, 3*height/4+150);
  }
  if (mode==1) {
    mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
    background(0, 200, 255);
    bucket.update();
    if (frameCount%10==0) {
      r.add(new Raindrop(random(width), 0));
    }
    for (int i = r.size()-1; i>=0; i--) {
      Raindrop ro=r.get(i);
      ro.fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
      ro.display();      //display the raindrop
      ro.dirtyWater();

      if (ro.isInContactWith(mouse)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
        ro.reset();    //if it is, reset the raindrop
        println("I CAUGHT THE CIRCLE!!!!!!   ");
      }

      if (ro.loc.y > height + ro.diam/2) {     //check to see if the raindrop goes below the bottom of the screen
        ro.reset();                           //if it does, reset the raindrop
        println("hit the bottom, you missed it :(     ");
        r.remove(i);
      }

      if (bucket.isInContactWith(ro.loc)) {      //checks to see if drop is touching bucket
        println("im in a cup");
        ro.reset();                          //if above is true, reset dro
        r.remove(i);
        if (ro.ewNasty()) {
          println("ewwwwww");
          ewNo+=1;
        } else {
          yaass+=1;
        }
      }
      
      if(bucket.amIFull()){
        println("YA DID IT OLD SPORT!");
      }
    }

    //Point Sytem
    textAlign(CENTER);
    textSize(100);
    fill(255);
    text(yaass, 3*width/4, height/4-50);
    fill(102, 153, 0);
    text(ewNo, 3*width/4, height/4+50);
    theBucketSlayer.update();
  }
}
void keyPressed() {
  if (keyCode==ENTER) {
    mode=1;
  } 
  if (keyCode==ESC) {
    exit();
  }
  if (keyCode==BACKSPACE) {
    mode=0;
  }
}