

/*

 - damage attribute is visually shown by how many spikes an enemy spikes around it # spikes = 360 / damage and then dispaly them
 - health could be border- DONE
 - speed is size  - DONE
 - color is overall power - DONE
 - spikes!!!
 
 */

class Enemy {
  float x;
  float y;
  int size;
  int speed;
  boolean isFlagged;
  int damage;
  int power;
  int health; 
  PShape shape;
  int numberSpikes;

  void init() {
    shape = createShape();
    shape.beginShape();
    numberSpikes = damage + 2;
    for (int i = 0; i < numberSpikes * 2; i++) {
      shape.vertex(0, 0);
    }
    shape.endShape(CLOSE);
  }

  void update() {
    if (isFlagged) {
      return;
    }
    PVector v = getVelocity();
    x += v.x;
    y += v.y;

    display();

    if (isCollidingWithPlayer()) {
      isFlagged = true; 
      player.takeDamage(damage);
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

  void display() {
    float angleBetweenSpikes = PI / numberSpikes;
    for (int i = 0; i < numberSpikes * 2; i++) {
      float angle = i * angleBetweenSpikes;
      int scalar = (i % 2 == 0)? size: size / 2;
      float shapeX = x + scalar * cos(angle);
      float shapeY = y + scalar * sin(angle);
      shape.setVertex(i, shapeX, shapeY);
    }
    shape.setFill(color(map(power, 1, 10, 0, 255), 0, 0));
    shape.setStrokeWeight(health);
    shape(shape);
  }
}
