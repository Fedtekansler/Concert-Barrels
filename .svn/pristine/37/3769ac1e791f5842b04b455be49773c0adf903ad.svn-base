public class SpotifyController implements Controller {  
  MessageSender sender;
  Model m;

  public SpotifyController(Model m, MessageSender sender) {
    this.sender = sender;
    this.m = m;
  } 

  // no players are added during quiz
  public void add(int who) {
    if (!m.contains(who)) {
      m.add(who);      
    }
  }
  public void addUpdate(int who) {
    throw new RuntimeException("Not needed in this class.");
  }
    
  public void choose(int who, int what) {    
    m.getSpotifyGame().vote(who, what);        
  }


  /* BROADCASTS choice to distributed barrel system */
  public void choiceUpdate(int who, int what) {  
    sender.broadcast(who, what);
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
      
      
      if (what == APPEARED || what == CENTER_ID) { // no choice                  
      } else { // a choice
        choose(who, what); // THIS IS THE ONLY COMMITTED LOCALLY      
        choiceUpdate(who, what); // BROADCAST update - only to tell "what"
      }
      m.playerOnScreen(who, x, y);
    }
  }

  /* A player lifts his beer */
  public void playerOffScreen(int who) {    
    m.playerOffScreen(who);
  }
  
  public void movePlayer(int who, int what, float x, float y) {
    m.getPlayerById(who).move(x,y);
  }
  
  public String toString() {
    return "SPOTIFY CONTROLLER";
  }
}

