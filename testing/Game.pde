//import processing.sound.*;
final int TotalLevel = 5;
float[] levelR = {30,50,80,100,130};
ArrayList<Ball> balls;
Physic physic;




void setup(){
  noStroke();
  size(400,400);
  background(255);
  
  balls = new ArrayList<Ball>();
  physic = new Physic();
}

void draw(){
  for (Ball b:balls){
    physic.applyGravityToBall(b);
    b.update();
    physic.handleBoundaryCollision(b);
  }
  physic.handleBallCollisions(balls);
  
  background(255);
  for (Ball b:balls){
    b.display();
  }
  
}

void mousePressed(){
  balls.add(new Ball(mouseX,100,0));

}
