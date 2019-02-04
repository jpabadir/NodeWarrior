
class EnemyBoss {
  float x; 
  float y;
  float radius;
  float health;
  
  EnemyBoss(float x, float y, float radius, float health) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.health = health;
  }
  
  void update() {
    fill(255, 0, 0);
    ellipse(x, y, radius * 2, radius * 2);
    textSize(15);
    fill(255, 255, 255);
    textAlign(CENTER, CENTER);
    text(health, x, y);
  }
  
  void takeDamage() {
   health--;
  }
}
