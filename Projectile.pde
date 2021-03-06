class Projectile {
  float x; 
  float y;
  float radius;
  PVector velocity;
  color c;
  boolean isFlagged;

  Projectile(float x, float y, PVector v) {
    this.x = x;
    this.y = y;
    velocity = v.mult(0.5);
    radius = 5;
    c = color(random(0, 255), random(0, 255), random(0, 255));
  }

  void update() {
    if(isFlagged) {
     return; 
    }
    
    x += velocity.x;
    y += velocity.y;
    fill(c);
    ellipse(x, y, radius * 2, radius * 2);
    if(isCollidingWithBoss() && !isFlagged) {
      boss.takeDamage();
      isFlagged = true;
    }
    if(isOffScreen()) {
      isFlagged = true;
    }
    
    for(Enemy enemy: enemyController.enemies) {
      if(isCollidingWithEnemy(enemy)) {
        isFlagged = true;
        enemy.health--;
        if(enemy.health <= 0) {
          enemy.isFlagged = true;  
        }
      }
    }
    
    for(Node node: nodeController.nodes) {
      if(isCollidingWithNode(node)) {
        node.absorbProjectile();
        isFlagged = true;
      }
    }
  }

  boolean isOffScreen() {
    return(x > width + radius || x < -radius || y > height + radius || y < -radius);
  }

  boolean isCollidingWithBoss() {
    return dist(x, y, boss.x, boss.y) < this.radius + boss.radius;
  }
  
  boolean isCollidingWithEnemy(Enemy enemy) {
      return dist(x, y, enemy.x, enemy.y) < radius + enemy.size / 2; 
  }
  
  boolean isCollidingWithNode(Node node) {
    return dist(x, y, node.x, node.y) < radius + node.radius;
  }
}
