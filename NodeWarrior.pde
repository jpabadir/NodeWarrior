
Player player;
NodeController nodeController;
ArrayList<Projectile> projectiles;
EnemyBoss boss;
EnemyController enemyController;
SceneController sceneController;
ArrayList<Projectile> projectilesToBeAdded;
Timer gameTimer;
double bestTime;

void setup() {
  strokeWeight(2);
  size(1200, 700);
  rectMode(CENTER);
  sceneController = new SceneController();
  sceneController.restart();
  bestTime = 100000;
}

void draw() {
  sceneController.update();
}

void mouseClicked() {
  if (sceneController.scene != sceneController.MAIN) {
    sceneController.restart();
    sceneController.setScene(sceneController.MAIN);
  }
}
