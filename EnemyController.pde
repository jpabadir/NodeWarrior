
class EnemyController {
  ArrayList<Enemy> enemies;

  Timer timer;
  float spawnTime;

  EnemyController() {
    enemies = new ArrayList();

    timer = new Timer();
    spawnTime = 1;
    createEnemies(5);
  }

  void update() {
    if (timer.time > spawnTime) {
      createEnemies((int)random(3, 7));
      timer.time= 0;
    }

    ArrayList<Enemy> collidedEnemies = new ArrayList(); 
    for (Enemy enemy : enemies) {
      enemy.update();
      if (enemy.isFlagged) {
        collidedEnemies.add(enemy);
      }
    }
    enemies.removeAll(collidedEnemies);
    
    timer.update();
  }

  private void createEnemies(int amount) {
    for (int i = 0; i < amount; i++) {
      float x = boss.x;
      float y = boss.y;
      enemies.add(new Enemy(x, y, 15, 5));
    }
  }

  private void createEnemy() {
    createEnemies(1);
  }
}
