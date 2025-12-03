//import processing.sound.*;
ArrayList<Ball> balls;
Physics physics;




void setup(){
  noStroke();
  size(400,400);
  background(255);
  
  balls = new ArrayList<Ball>();
  physics = new Physics();
}

void draw(){
  //set a box, trap all fruit inside.
  fill(#08C5FC);
  rect(40,100,320,280);
  for (Ball b:balls){
    b.display();
  }
  
}

void mousePressed(){
  balls.add(new Ball(mouseX,100,10));

}
