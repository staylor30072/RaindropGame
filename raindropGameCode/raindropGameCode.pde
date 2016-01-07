//Declaration of variables
PVector mouse;   //declare a P
int count=10;
ArrayList<Raindrop> r = new ArrayList<Raindrop>();
int rec =150;
Catcher bucket;
int yaass=0;
int ewNo=0;
int mode=0;
int tim=0;
int denom;
float frac;
int m = millis();


// On your own, create an array of Raindrop objects instead of just one
// Use the array instead of the single object
// You can start out by just using the single Raindrop as you test


void setup() {
  size(1200, 800);
  mouse = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  r.add(new Raindrop(random(width), 0));
  bucket = new Catcher(width/2, height/2);
}

void draw() {

  if (mode==0) {            //Opening screen
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
    //Resets points, timer, and bucket
    yaass=0;
    ewNo=0;
    bucket.refillMeBaby();
    tim=0;
  }

  if (mode==1) {        //Game
    mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
    background(0, 200, 255);
    bucket.update();                      //Makes bucket follow mouse
    if (m%1==0) {                //adds raindrops to the game at specific times
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
        println("hit the bottom, you missed it :(     ");
        r.remove(i);                            //if above is true remove drop from screen
      }

      if (bucket.isInContactWith(ro.loc)) {      //checks to see if drop is touching bucket
        println("im in a cup");                          //if above is true, remove drop
        r.remove(i);
        if (ro.ewNasty()) {                   //if drop is dirty, add point to dirty water droplet
          println("ewwwwww");
          ewNo+=1;
        } else {                            //if drop is clean, add point to clean water drop
          yaass+=1;
        }
      }

      if (bucket.amIFull()) {      //If the bucket is full, end the game
        println("YA DID IT OLD SPORT!");
        mode=2;
      }
    }

    //Point System Displayal
    textAlign(CENTER);
    textSize(100);
    fill(255);
    text(yaass, 3*width/4, height/4-50);
    textSize(50);
    text("Clean", 3*width/4+200, height/4-50);
    fill(102, 153, 0);
    text("Dirty", 3*width/4+200, height/4+50);
    textSize(100);
    text(ewNo, 3*width/4, height/4+50);


    //Timer
    if (frameCount%10==0) {
      tim+=1;
    }
    fill(255);
    textSize(200);
    text(tim, width/4, height/4);
  }
  if (mode==2) {      //Ending Screen
    background(0, 200, 255);

    //Final Drop Score
    textAlign(CENTER);
    textSize(100);
    fill(255);
    text(yaass, 3*width/4, height/4-50);
    textSize(50);
    text("Clean", 3*width/4+200, height/4-50);
    fill(102, 153, 0);
    text("Dirty", 3*width/4+200, height/4+50);
    textSize(100);
    text(ewNo, 3*width/4, height/4+50);

    //Timer
    fill(255);
    textSize(200);
    text(tim, width/4, height/4);

    //Drinkibility Nonsense
    if (ewNo>yaass) {    //If there are more dirty water droplets than clean water droplets
      fill(102, 153, 0);
      textSize(100);
      text("I wouldn't ", width/2, height/2-50);
      text("drink that...", width/2, height/2+50);
    }
    if (yaass>ewNo) {    //if there are more clean water droplets than dirty
      fill(255);
      textSize(100);
      text("Yum, refreshing.", width/2, height/2);
    }
    if (yaass==ewNo) {    //if there are an equal amount of water droplets
      fill(255);
      textSize(100);
      text("#BarelyDrinkable.", width/2, height/2);
    }
    //Tells player how to go back to opening page or exit game
    textSize(50);
    fill(255);
    text("Press ESC to exit", width/2, 3*height/4);
    text("Press Backspace to Begin Again",width/2, 3*height/4+50);
  }
}
void keyPressed() {
  if (keyCode==ENTER) {    //if player hits enter, enter main game sequence
    mode=1;
  } 
  if (keyCode==ESC) {    //if player hits escape, leave the program
    exit();
  }
  if (keyCode==BACKSPACE) {    //if player hits backspace, program shows opening page
    mode=0;
  }
  if (keyCode==UP) {      //If player hits up, game automatically ends (for testing purposes)
    mode=2;
  }
}