interface Game {
  public void start();
  public void end();
  public void vote(int who, int what);
  public void setView(View v);
  public boolean isStarted();    
  
  /* methods for Quiz */
  public Question getCurrentQuestion();
  public void add(Question q);  
  public void nextQuestion();
  public void endQuestion(); 
  public void printOptions();
  public void printVotes();   
  public Player getWinner();  
  public boolean allActiveVoted();
  
  public void addPlayer(int who);
  public boolean contains(int who);
  
  /* updates view at the right time */
  public void announceWinner();
  
  public String toString();
  
}
