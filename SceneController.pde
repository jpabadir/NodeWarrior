
class SceneController {
  int scene = 0;
  boolean hasWonOnce = false;

  final int MAIN = 0;
  final int GAMEOVER = 1;
  final int VICTORY = 2;

  void update() {
    switch(scene) {
    case 0: 
      play(); 
      break;
    case 1: 
      gameOver(); 
      break;
    case 2:
      victory();
    }
  }

  void setScene(int scene) {
    this.scene = scene;
  }

  void restart() {
    if (scene == VICTORY) {
      hasWonOnce = true; 
      if (gameTimer.time < bestTime) {
        bestTime = gameTimer.time;
      }
    }
    gameTimer = new Timer();
    player = new Player();
    nodeController = new NodeController();
    projectiles = new ArrayList();
    boss = new EnemyBoss(90 * width / 100, height / 2, 50, 50);
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
    if (hasWonOnce) {
      text(bestTime + "", width * 0.9, height * 0.1 - 25);
    } else {
      text("No best time yet", width * 0.9, height * 0.1 - 25);
    }
  }

  void gameOver() {
    background(0);
    fill(255, 0, 0);
    textAlign(CENTER, CENTER);
    textSize(50);
    text("GAME OVER! CLICK MOUSE TO PLAY AGAIN", width / 2, height / 2);
  }

  void victory() {
    background(255, 223, 0);
    textSize(30);
    text("CONGRATULATIONS! YOU'VE WON! YOUR TIME WAS " + gameTimer.time + " SECONDS", width / 2, height / 2);
    if (hasWonOnce) {
      if (gameTimer.time < bestTime) {
        text("YOU'VE BEAT THE BEST TIME", width / 2, height / 2 + 40);
      } else {
        text("YOU HAVEN'T BEAT THE BEST TIME...", width / 2, height / 2 + 40);  
        text("THE BEST TIME IS CURRENTLY " + bestTime, width / 2, height / 2 + 80);
      }
    }
  }
}
