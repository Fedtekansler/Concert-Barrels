public interface Model {
  
  public View getView();
  
  /* Players */
  public void resetPlayers();
  public Player getPlayerById(int id);
  public List<Player> getPlayers();
  public boolean allActiveVoted();
  public void playerOnScreen(int who, float x, float y);
  public void playerOffScreen(int who);
    
  
  /* FOR GAME DRIVER */
  public void addQuiz(Quiz q);
  public void setSpotify(Spotify spotify);
  public void setPong(Pong pong);
  
  /* Game */    
  public Game getGame();  
  public void setGame(Game g);
  public void endGame();
  public Game getSpotifyGame();
  public Game getPongGame();
  public void toNextQuiz();
  public Game getNextQuiz();    
  public void announceWinner();
  public void announceSpotifyWinner();
  
  /* To handle amount of players */
  public int getNextSesId();
  public void updateNextSesId();
  
  /* CONTROLLER COMMANDS */
  public void vote(int who, int what);          
  
  /* TO HANDLE EVENT LOOP WITH MANY REQUESTS */
  // This is needed for the mutable methods on the model
  public void release();  
  public boolean take();
  
  
  /** answers on whether or not the player is already added **/
  public boolean contains(int who);
  
  public void add(int who);
  
  /** For broadcast adds **/
  public void add(int who, Coaster coaster);
  
  public void hibernate();
  
  


  
  /* FOR TESTING IN TERMINAL */
  public void printOptions();
  public void printVotes();
}
