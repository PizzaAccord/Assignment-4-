class Ball{
  int level;
  PVector pos;
  float r;
  PVector speed;
  color c;
  
  Ball (float x,float y,int level){
    pos = new PVector(x,y);
    speed = new PVector(0,0);
    this.level = level;
    if (this.level>4){
      this.level = 4;
    }
    
    if (level == 0)      c = color(135, 206, 250);
    else if (level == 1) c = color(144, 238, 144);
    else if (level == 2) c = color(255, 215,   0); 
    else if (level == 3) c = color(255, 140,   0);
    else c = color(220,  20,  60);
    r = levelR[this.level];
  }
  void update(){
    pos.add(speed);
  }
  
  void display(){
    fill(c);
    circle(pos.x,pos.y,r);
  }
}
