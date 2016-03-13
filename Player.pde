public class Player {
  private int id;
  private int points;
  private Coaster coaster;
  private int lastSeen;
  private boolean isActive;
  private boolean isOn;
  private float x;
  private float y;
  
  public Player(int symid) {
    id = symid;
    points = 0;
    x = 0;
    y = 0;    
  }
  
  public void move(float x, float y) {
    coaster.move(x,y);
  }
  
  public float getX() {
    return x;
  }
  public float getY() {
    return y;
  }
  
  public void setCoaster(Coaster coaster) {
    this.coaster = coaster;
  }
  
  public String getIcon() {
    return coaster.getIcon();
  }
  
  public boolean isActive() {
    return isActive;
  }
  
  public void on(float x, float y) {
    isActive = true;  
    isOn = true;    
    coaster.move(x,y);
    coaster.show();      
  }
   
  public void off() {
    coaster.hide();    
    isOn = false;
    lastSeen = millis() / 1000;
    
    // Det her er en players timer, der gør dem inaktive efter x sekunder.
    /*final Thread t1 = new Thread("thread1") {            
        public void run() {          
          while (!Player.this.isOn && Player.this.isActive) {
            int secsSinceSeen = millis() / 1000 - Player.this.lastSeen;                        
            if (secsSinceSeen > 5) {
              println("INACTIVE: " + Player.this.getCoaster().getColor().getName());
              isActive = false;
            }
            try {this.sleep(1000);} catch(Exception e) {}
          }              
        }    
    };           
    t1.start();*/
    
    //v.fadeOutCoaster(getId());  
  }
  
  public Coaster getCoaster() {
    return coaster;
  }
  
  public void addPoints(int win) {
    points = points + win;
  }
  
  public int getPoints() {
    return points;
  }
  
  public int getId() {
    return id;
  }
  
  public String toString() {
    return "Player " + id + " (" + points + ")";
  }
}
