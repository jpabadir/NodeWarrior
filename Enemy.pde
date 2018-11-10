
class Enemy {
  float x;
  float y;
  float size;
  float speed;
  boolean isFlagged;

  Enemy(float x, float y, float size, float speed) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.speed = speed;
  }

  void update() {
    PVector v = getVelocity();
    x += v.x;
    y += v.y;

    fill(255, 0, 0);
    rect(x, y, size, size);
    
    if(isCollidingWithPlayer()) {
     isFlagged = true; 
     player.takeDamage();
    }
  }

  PVector getVelocity() {
    PVector velocity = (new PVector(player.x - x, player.y - y)).normalize();
    velocity.x *= speed;
    velocity.y *= speed;
    return velocity;
  }
  
  boolean isCollidingWithPlayer() {
    return dist(x, y, player.x, player.y) < (size + player.size) / 2;
  }
}
