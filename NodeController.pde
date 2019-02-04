class NodeController {
  ArrayList<Node> nodes;
  
  float lowerX;
  float upperX;
  
  Timer timer;
  float spawnTime;
    
  int maxNodes;
  
  NodeController() {
   nodes = new ArrayList();
   lowerX = 100;
   upperX = width - 300;
   timer = new Timer();
   spawnTime = 0.5;
   maxNodes = 30;
   createNodes(5);
  }
  
  void update() {
    if(timer.time > spawnTime && nodes.size() < maxNodes) {
      createNode();
      timer.time= 0;
    }

    ArrayList<Node> collidedNodes = new ArrayList(); 
    for(Node node: nodes) {
      node.update();
      if (node.isFlagged) {
       collidedNodes.add(node); 
      }
    }
    
    nodes.removeAll(collidedNodes);
    
    timer.update();
  }
  
  // helpers
  private void createNodes(int amount) {
    for(int i = 0; i < amount; i++) {
      float x = random(lowerX, upperX);
      float y = random(0, height);
      nodes.add(new Node(x, y, 30));  
    }
  }
  
  private void createNode() {
   createNodes(1); 
  }
}
