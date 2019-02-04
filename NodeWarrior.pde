
Player player;
NodeController nodeController;
ArrayList<Projectile> projectiles;
EnemyBoss boss;
EnemyController enemyController;
SceneController sceneController;

void setup() {
  sceneController = new SceneController();
  size(1200, 700);
  rectMode(CENTER);
  player = new Player();
  nodeController = new NodeController();
  projectiles = new ArrayList();
  boss = new EnemyBoss(90 * width / 100, height / 2, 50, 100);
  enemyController = new EnemyController();
}

void draw() {
  sceneController.update();
}
