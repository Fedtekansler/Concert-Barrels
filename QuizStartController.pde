public class QuizStartController implements Controller {    
  Model m;
  MessageSender sender;
  boolean firstVote = true;  

  public QuizStartController(Model m, MessageSender sender) {
    this.sender = sender;
    this.m = m;    
  }

 
  public void choose(int who, int what) {             
    if (what == 0 || what == 3) { // FORTRYD
      m.setGame(new ChooseGame(v, m));
      m.getGame().start();      
      
    } else if (what == 1) { // START
      m.getGame().nextQuestion();      
    } else if (what == 2) { // ADD PLAYER TO QUIZ
      if (m.getGame().contains(who)) {
        println("Player already added to quiz");
      } else {
        m.getGame().addPlayer(who);
      }      
    }      
  }  
  
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
    return "QUIZ START";
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

