class VoteAnimation {
  
  private int alpha = 150;
  private float diameter;
  private Coaster coaster;
  private float x;
  private float y;
  private Color theColor;
  private int[] rgb;
  private int r;
  private int g;
  private int b;
  
  public VoteAnimation(float radius, Coaster coaster, float x, float y) {
    this.diameter = 2*radius;
    this.coaster = coaster;
    this.x = x;
    this.y = y;
  }
  
  public VoteAnimation(float radius, Color theColer, float x, float y) {
    this.diameter = 2*radius;
    this.coaster = null;
    this.x = x;
    this.y = y;
    rgb = theColer.getRGB();
    r = rgb[0];
    g = rgb[1];
    b = rgb[2];
  }
  
  
  public void drawAnimation() {
    if (coaster != null) {
      int[] colorOfCoaster = coaster.getColor().getRGB();
      fill(colorOfCoaster[0], colorOfCoaster[1], colorOfCoaster[2], alpha);
    } else {
      fill(r, g, b, alpha);
    }
    noStroke();
    ellipse(x, y, 1.5 * diameter, 1.5 * diameter);
    alpha -= 10;
  }
  
  public boolean doneAnimating() {
    if(alpha <= 0) {
      return true;
    }
    return false;
  }
  
}
