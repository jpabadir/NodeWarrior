
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

  void play() {
    background(255);
    player.display();
    nodeController.update();
    boss.update();
    enemyController.update();

    ArrayList<Projectile> flaggedProjectiles = new ArrayList();
    for (Projectile p : projectiles) {
      if (p.isFlagged) {
        flaggedProjectiles.add(p);
      }
      p.update();
    }
    
    projectiles.removeAll(flaggedProjectiles);
  }

  void gameOver() {
    background(0);
    fill(255, 0, 0);
    textAlign(CENTER, CENTER);
    textSize(60);
    text("GAME OVER! CLICK MOUSE TO PLAY AGAIN", width / 2, height / 2);
  }
}
