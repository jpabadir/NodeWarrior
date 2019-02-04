
class SceneController {
  int scene = 0;

  final int MAIN = 0;
  final int GAMEOVER = 1;

  void update() {
    switch(scene) {
    case 0: 
      play(); 
      break;
    case 1: 
      gameOver(); 
      break;
    }
  }

  void setScene(int scene) {
    this.scene = scene;
  }

  void restart() {
    gameTimer = new Timer();
    player = new Player();
    nodeController = new NodeController();
    projectiles = new ArrayList();
    boss = new EnemyBoss(90 * width / 100, height / 2, 50, 100);
    enemyController = new EnemyController();
    projectilesToBeAdded = new ArrayList<Projectile>();
  }

  void play() {
    gameTimer.update();
    background(255);
    player.display();
    nodeController.update();
    boss.update();
    enemyController.update();
    
    projectiles.addAll(projectilesToBeAdded);
    projectilesToBeAdded.clear();

    ArrayList<Projectile> flaggedProjectiles = new ArrayList();
    
    for (Projectile p : projectiles) {
      if (p.isFlagged) {
        flaggedProjectiles.add(p);
      }
      p.update();
    }
    projectiles.removeAll(flaggedProjectiles);
     textSize(20);
    textAlign(CENTER, CENTER);
    fill(0);
    text(gameTimer.time, width * 0.9, height * 0.1);
  }

  void gameOver() {
    background(0);
    fill(255, 0, 0);
    textAlign(CENTER, CENTER);
    textSize(60);
    text("GAME OVER! CLICK MOUSE TO PLAY AGAIN", width / 2, height / 2);
  }
}
