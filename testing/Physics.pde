//给球加重力
class Physic {
  float gravity = 0.4;

  float bounce = 0.3; 
  float restitution = 0.2;
  
  void applyGravityToBall(Ball b) {
    b.speed.y += gravity;
  }
  
  void handleBoundaryCollision(Ball b) {
    //check bottom collision
    if (b.pos.y + b.r > height) {
      b.pos.y = height - b.r;
      b.speed.y *= -bounce;
    }
    
    //check top collision
    if (b.pos.y - b.r < 0) {
      b.pos.y = b.r;
      b.speed.y *= -bounce;
    }
    
    //check left collision
    if (b.pos.x - b.r < 0) {
      b.pos.x = b.r;
      b.speed.x *= -bounce;
    }
    
    //check right collision
    if (b.pos.x + b.r > width) {
      b.pos.x = width - b.r;
      b.speed.x *= -bounce;
    }
  }
  
  void handleBallCollisions(ArrayList<Ball> balls) {
    ArrayList<Ball> toRemove = new ArrayList<Ball>();
    ArrayList<Ball> toAdd    = new ArrayList<Ball>();
    
    for (int i = 0; i < balls.size(); i++) {
      Ball a = balls.get(i);
      for (int j = i + 1; j < balls.size(); j++) {
        Ball b = balls.get(j);
        
        float dx = b.pos.x - a.pos.x;
        float dy = b.pos.y - a.pos.y;
        float dist = sqrt(dx*dx + dy*dy);
        //because circle radius = r*2
        float minDist = a.r /2 + b.r/2;
        
        if (dist > 0 && dist < minDist) {
          float overlap = minDist - dist;
          
          float nx = dx / dist;
          float ny = dy / dist;
          
          a.pos.x -= nx * overlap /2;
          a.pos.y -= ny * overlap /2;
          b.pos.x += nx * overlap /2;
          b.pos.y += ny * overlap /2;
          
          float relVx = b.speed.x - a.speed.x;
          float relVy = b.speed.y - a.speed.y;
          float relVelAlongNormal = relVx * nx + relVy * ny;
          
          if (relVelAlongNormal < 0) {
            float impulse = -(1 + restitution) * relVelAlongNormal / 2.0;
            float impulseX = impulse * nx;
            float impulseY = impulse * ny;
            
            a.speed.x -= impulseX;
            a.speed.y -= impulseY;
            b.speed.x += impulseX;
            b.speed.y += impulseY;
          }
          
            //当两个球等级相等并且不是最大等级时
          if (a.level == b.level && a.level < TotalLevel-1) {
            //排除球已经被merge的情况
            if (!toRemove.contains(a) && !toRemove.contains(b)) {
              float newX = (a.pos.x + b.pos.x) /2;
              float newY = (a.pos.y + b.pos.y) /2;
              
              Ball merged = new Ball(newX, newY, a.level + 1);
              
              merged.speed.x = (a.speed.x + b.speed.x) /2;
              merged.speed.y = (a.speed.y + b.speed.y) /2;
              
              toRemove.add(a);
              toRemove.add(b);
              toAdd.add(merged);
            }
          }
        }
      }
    }

    
    for (Ball b : toRemove) {
      balls.remove(b);
    }
    balls.addAll(toAdd);
  }
}
