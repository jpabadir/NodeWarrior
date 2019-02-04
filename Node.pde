class Node {
  float x;
  float y;

  float radius;
  float maxRadius;
  float volatileRadius;
  float growthRate;
  boolean isFlagged = false;

  Node(float x, float y, float maxRadius) {
    this.x = x;
    this.y = y;
    radius = 10;
    this.maxRadius = maxRadius;
    //growthRate = random(0, 5);
    growthRate = 20;
    volatileRadius = maxRadius + 2;
  }

  void update() {
    if(isFlagged) {
      return; 
    }
    
    fill(0, 200, 0);
    if (radius < maxRadius) {
      radius += (1 / (radius * 10)) * growthRate;
    }
    ellipse(x, y, radius * 2, radius * 2);

    if (isCollidingWithPlayer()) {

      for (int i = 0; i < radius / 5; i++) {
        PVector v = player.getVelocity();
        v.rotate(radians(random(-20, 20)));
        projectiles.add(new Projectile(x, y, v));
      }
      isFlagged = true;
    }

    textSize(15);
    fill(255, 255, 255);
    textAlign(CENTER, CENTER);
    text(radius, x, y);
  }

  void absorbProjectile() {
    if(isFlagged) {
      return; 
    }
    radius++;
    if (radius > volatileRadius) {
      for (int i = 0; i < radius / 5; i++) {
        PVector v = player.getVelocity();
        v.rotate(radians(random(0, 360)));
        projectilesToBeAdded.add(new Projectile(x, y, v));
      }
      isFlagged = true;
    }
  }

  boolean isCollidingWithPlayer() {
    return dist(x, y, player.x, player.y) < radius;
  }
}
