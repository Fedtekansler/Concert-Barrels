class AddPlayerAnimation extends Thread {
  
  private int alpha = 150;
  private float diameter;
  private float x;
  private float y;
  
  
  public AddPlayerAnimation(float radius, float x, float y) {
    this.diameter = 2*radius;
    this.x = x;
    this.y = y;
  }
  
  public void run() {
    while(!doneAnimating()) {
      fill(200, 200, 200, alpha);
      noStroke();
      ellipse(x, y, 1.5 * diameter, 1.5 * diameter);
      alpha -= 10;
      try {
        Thread.sleep(100);
      } catch (Exception e) {
      }
    }
  }
  
  public boolean doneAnimating() {
    if(alpha <= 0) {
      return true;
    }
    return false;
  }
  
}
