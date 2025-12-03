//import processing.sound.*;
final int TotalLevel = 5;
float[] levelR = {20,30,40,50,60};
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
  
  //set a box, trap all fruit inside.
  //fill(#08C5FC);
  //rect(40,100,320,280);
  background(255);
  for (Ball b:balls){
    b.display();
  }
  
}

void mousePressed(){
  balls.add(new Ball(mouseX,100,0));

}
