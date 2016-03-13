class StartController implements Controller {
  MessageSender sender;
  Model m;  
  boolean firstVote = true;  

  public StartController(Model m, MessageSender sender) {
    this.sender = sender;
    this.m = m;    
  }   

  public void add(int who) {        
    if (!m.contains(who)) {
      m.add(who);      
    }
  }

  /* CHOOSE OVER NETWORK not needed for the start controller */
  /* Only updates model on the 3 possible choices of option IDs */
  public void choose(int who, int what) {        
    if (what == 0 || what == 1 || what == 2) m.vote(who, what);        
  }


  // no broadcast of choice in start interface
  public void choiceUpdate(int who, int what) {
    throw new RuntimeException("Not needed in this class.");
  }


  /* BROADCAST when player is added */
  public void addUpdate(int who) {
    throw new RuntimeException("Not needed in this class.");
  }

  /* A player places his beer on the screen.
   Comments:
   In this controller the players are added.
   You appear if you are one of the first MAX_PLAYERS players
   If they are within a choice circle the WHAT will be commited.
   The WHAT can be one of 3 choices from the start interface */
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
        println("::::::: NEW PLAYER ::::::: ("+who +")");
      }

    }    
    
    if (m.contains(who)) {
      // SLEEEEEEP so that the player is SAFELY ADDED before making a choice
      try {Thread.sleep(100);} catch(Exception e) {}
      
      
      if (what == APPEARED || what == CENTER_ID) { // no choice                  
      } else { // a choice        
        choose(who, what); // only LOCAL update
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
    return "START CONTROLLER";
  }
}

