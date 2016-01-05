  //TIMER
class Timer{
  //declarations
  int tim1,tim2;
  
  Timer(){
  tim1=0;
  tim2=0;
  }
  
  void display(){

  textAlign(CENTER);
  textSize(200);
  text(tim2, width/4, height/4);
  }
  
  void update(){  
  tim1+=1;
  if (tim1%6==0) {
    tim2+=1;
  }
  textAlign(CENTER);
  textSize(200);
  text(tim2, width/4, height/4);
  }
}