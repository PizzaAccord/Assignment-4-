class Physic{
  float gravity = 0.5;
  float bounce = 0.2;
  
  void applyGravityToBall(Ball b){
   b.speed.y += gravity;
   }
   
   void handleBoundaryCollision(Ball b) {
    if (b.pos.y + b.r > height) {
      b.pos.y = height - b.r;
      b.speed.y *= -bounce;
      b.speed.x *= 0.98; 
      if (abs(b.speed.y) < 0.2) b.speed.y = 0;
    }
    

    if (b.pos.y - b.r < 0) {
      b.pos.y = b.r;
      b.speed.y *= -bounce;
    }
    if (b.pos.x - b.r < 0) {
      b.pos.x = b.r;
      b.speed.x *= -bounce;
    }
    if (b.pos.x + b.r > width) {
      b.pos.x = width - b.r;
      b.speed.x *= -bounce;
    }
  }
  
  void handleBallCollisions(ArrayList<Ball> balls) {
    for (int i = 0; i < balls.size(); i++) {
      Ball a = balls.get(i);
      for (int j = i + 1; j < balls.size(); j++) {
        Ball b = balls.get(j);
        
        float dx = b.pos.x - a.pos.x;
        float dy = b.pos.y - a.pos.y;
        float dist = sqrt(dx*dx + dy*dy);
        float minDist = a.r + b.r;
        
        if (dist < minDist && dist > 0) {
          float overlap = minDist - dist;
          
          float nx = dx / dist;
          float ny = dy / dist;
          
          a.pos.x -= nx * overlap * 0.5;
          a.pos.y -= ny * overlap * 0.5;
          b.pos.x += nx * overlap * 0.5;
          b.pos.y += ny * overlap * 0.5;
          
          float relVx = b.speed.x - a.speed.x;
          float relVy = b.speed.y - a.speed.y;
          float relspeedAlongNormal = relVx * nx + relVy * ny;
          
          if (relspeedAlongNormal < 0) {
            float impulse = -(1 + bounce) * relspeedAlongNormal / 2.0;
            float impulseX = impulse * nx;
            float impulseY = impulse * ny;
            
            a.speed.x -= impulseX;
            a.speed.y -= impulseY;
            b.speed.x += impulseX;
            b.speed.y += impulseY;
          }
        }
      }
    }
  }
}
