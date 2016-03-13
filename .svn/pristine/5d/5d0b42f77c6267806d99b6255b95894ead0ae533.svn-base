import java.util.*;

class Pong implements Game {    
  Map<Player, Integer> playerPoints = new HashMap<Player, Integer>();
  boolean started;
  int points = 0;
  Player currentWinner;
  View v;
  Model m;

  public Pong(Model m) {
    this.started = false;
    this.m = m;   
  }  

  public boolean isStarted() {
    return this.started;
  }
  public void start() {
    this.started = true;    
    v.toPong();
  }
  
  public void vote(int who, int what) {   
    v.growToStart(); 
    endQuestion();  
  }
  
  public void announceWinner() {
    throw new RuntimeException("Not yet implemented");
  }
    
  public void end() {
    this.started = false;    
  }
  
  public void setView(View v) {
    this.v = v;
  }    

  public void endQuestion() {
    if (started) {                  
      thread("endPongAndShowGames"); // sleeps and fades in order to not collide with fade out of question                      
    }    
  }
 
  public void trackPoints() {        
    throw new RuntimeException("Not yet implemented");
  }
  
  public void decideWinner() {
    throw new RuntimeException("Not yet implemented");
  }
  
  
  
  
  
  
  public boolean allActiveVoted() {  
    throw new RuntimeException("Not needed for this game");
  }  
    
  public Question getCurrentQuestion() {
    throw new RuntimeException("Not needed for this game");
  }

  public void add(Question q) {    
    throw new RuntimeException("Not needed for this game");
  }
  public void nextQuestion() {
    throw new RuntimeException("Not needed for this game");    
  }   
  
  public void printOptions() {
    throw new RuntimeException("Not needed for this game");    
  }

  public void printVotes() {
    throw new RuntimeException("Not needed for this game");
  }
  
  public String toString() {
    return "PONG";
  }
  
  private void resetQuestions() {    
    throw new RuntimeException("Not needed for this game");
  }
  
  
  public void addPlayer(int who) {
    throw new RuntimeException("Not needed for this game");
  }
  public Player getWinner() {    
    throw new RuntimeException("Not needed for this game");
  }
  public boolean contains(int who) {
    throw new RuntimeException("Not needed for this game");
  }
}

