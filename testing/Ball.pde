class Ball{
  PVector pos;
  float r;
  PVector speed;
  color c;
  
  Ball (float x,float y,float r){
    pos = new PVector(x,y);
    speed = new PVector(0,0);
    this.r = r;
    color c = (#12FF2F);
    
  }
  void update(){
    pos.add(speed);
  }
  
  void display(){
    fill(c);
    circle(pos.x,pos.y,r);
  }
}
