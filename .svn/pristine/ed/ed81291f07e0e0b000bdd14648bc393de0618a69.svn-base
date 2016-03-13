public class PongController implements Controller {    
  Model m;
  boolean ending = false;

  public PongController(Model m) {    
    this.m = m;
  } 

  public void choose(int who, int what) {  
    m.vote(who, what);
  }  

  /* In this controller it does not add a new player.
   You can only reappear if you've already been added */
  public void playerOnScreen(int who, int what, float x, float y) {
    if (m.getNextSesId() > MAX_ID) { // WE HIT THE LIMIT OF PLAYERS        
      println(":::::: NO MORE PLAYERS CAN JOIN!! ::::::"); // TODO: SHOW THIS IN THE VIEW
    } else {
      if (!m.contains(who)) {        
        Coaster currentCoaster = v.getCoasterBySesId(m.getNextSesId());        
        currentCoaster.setSymId(who); // associates the current coaster with a given Player ID
        currentCoaster.move(x, y);
        m.updateNextSesId(); // Updates to next session ID, crucial for checking when MAX_PLAYERS are achieved.

        add(who);
        //addUpdate(who);        
        println("::::::: NEW SPOTIFY PLAYER ::::::: ("+who +")");
      }

    }    
    if (m.contains(who)) {
      // SLEEEEEEP so that the player is SAFELY ADDED before making a choice
      try {Thread.sleep(100);} catch(Exception e) {}
      
      if (what == CENTER_ID) { // no choice   
        choose(who, what); // only LOCAL update    
      }
      m.playerOnScreen(who, x, y);
    }
  }

  /* A player lifts his beer */
  public void playerOffScreen(int who) {        
    m.playerOffScreen(who);
    if (ending) {
      ending = false;
      //m.getGame().start();
    }
  }

  public void movePlayer(int who, int what, float x, float y) {
    m.getPlayerById(who).move(x, y);
  }

  public String toString() {
    return "PONG CONTROLLER";
  }
  
      
  public void add(int who) {
    if (!m.contains(who)) {
      m.add(who);      
    }
  }
  
  
  public void addUpdate(int who) {
    throw new RuntimeException("Not needed in this class.");
  }
  // no broadcasts in quiz mode
  public void choiceUpdate(int who, int what) {
    throw new RuntimeException("Not needed in this class.");
  }
}

