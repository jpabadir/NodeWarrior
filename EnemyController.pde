
class EnemyController {
  ArrayList<Enemy> enemies;

  Timer timer;
  float spawnDelay;
  int maxTotalPower;
  int totalPower;

  EnemyController() {
    enemies = new ArrayList();
    timer = new Timer();
    spawnDelay = 3;
    maxTotalPower = 20;
  }

  void update() {
    if (timer.time > spawnDelay && totalPower < maxTotalPower) {
      createEnemy();
      timer.time= 0;
    }

    ArrayList<Enemy> collidedEnemies = new ArrayList(); 
    for (Enemy enemy : enemies) {
      enemy.update();
      if (enemy.isFlagged) {
        totalPower -= enemy.power;
        collidedEnemies.add(enemy);
      }
    }
    enemies.removeAll(collidedEnemies);

    timer.update();
  }
  
  private void createEnemy() {
      Enemy e = new Enemy();
      e.x = boss.x;
      e.y = boss.y;
      int damage = (int) random(1, 6);
      int speed = (int) random(1, 6);
      int health = (int) random(1, 6);
      e.power = damage + speed + health;
      e.damage = 1 * damage;
      e.speed = 1 * speed;
      e.health = 1 * health;
      e.size = 70 / (2 * e.speed);
      spawnDelay = e.power / 2.0;
      e.init();
      enemies.add(e);
  }
}
