class Player {
  float x;
  float y;
  float size;
  float speed;
  int health;

  Player() { 
    x = width / 10;
    y = height / 2;
    speed = 10;
    size = 30;
    health = 50;
  }

  void display() {
    // movement
    PVector v = getVelocity();
    if ((dist(mouseX, mouseY, x, y) > speed)) {
      x += v.x;
      y += v.y;
    }

    fill(0, 0, 255);
    rect(x, y, size, size);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(12);
    text(health, x, y);
  }

  PVector getVelocity() {
    PVector velocity = (new PVector(mouseX - x, mouseY - y)).normalize();
    velocity.x *= speed;
    velocity.y *= speed;
    return velocity;
  }

  void takeDamage(int damage) {
    health -= damage;
    if (health <= 0) {
      sceneController.setScene(sceneController.GAMEOVER);
    }
  }
}
