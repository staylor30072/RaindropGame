  //TIMER
class Timer{
  //declarations
  int tim1,tim2;
  color t;
  
  Timer(){
  tim1=0;
  tim2=0;
  t=color(255);
  }
  
  void display(){
  textAlign(CENTER);
  textSize(200);
  stroke(t);
  text(tim2, width/4, height/4);
  }
  
  void update(){  
  tim1+=1;
  if (tim1%6==0) {
    tim2+=1;
  }
  fill(t);
  textAlign(CENTER);
  textSize(200);
  text(tim2, width/4, height/4);
  }
}