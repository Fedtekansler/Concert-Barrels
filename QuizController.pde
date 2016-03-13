public class QuizController implements Controller {    
  Model m;

  public QuizController(Model m) {    
    this.m = m;
  } 
    
  public void choose(int who, int what) {
    if (m.getGame().contains(who)) {    
      m.vote(who, what);    
      if (m.getGame().allActiveVoted()) thread("nextQuestion");
    } else {
      println("YOU DID NOT JOIN QUIZ");
    }
  }  

  /* In this controller it does not add a new player.
   You can only reappear if you've already been added */
  public void playerOnScreen(int who, int what, float x, float y) {  
    if (m.getGame().contains(who)) { // checks whether "who" joined game    
       // A CHOICE
      if (what != APPEARED && what != CENTER_ID) choose(who, what); // only LOCAL update in quiz            
      m.playerOnScreen(who, x, y);      
    }              
  }

  /* A player lifts his beer */
  public void playerOffScreen(int who) {
    if (m.getGame().contains(who)) { // checks whether "who" joined game    
      m.playerOffScreen(who);
    }
  }
  
  public void movePlayer(int who, int what, float x, float y) {
    if (m.getGame().contains(who)) { // checks whether "who" joined game
      m.getPlayerById(who).move(x,y);
    }
  }
  
  public String toString() {
    return "QUIZ CONTROLLER";
  }
  
  
  public void add(int who) {
    throw new RuntimeException("Not needed in this class.");
  }
  public void addUpdate(int who) {
    throw new RuntimeException("Not needed in this class.");
  }
  // no broadcasts in quiz mode
  public void choiceUpdate(int who, int what) {
    throw new RuntimeException("Not needed in this class.");
  }
  
}

