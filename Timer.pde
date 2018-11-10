class Timer {
  float time;
  
  Timer() {
   time = 0; 
  }
  
  void update() {
    time += 1 / frameRate;
  }
}
