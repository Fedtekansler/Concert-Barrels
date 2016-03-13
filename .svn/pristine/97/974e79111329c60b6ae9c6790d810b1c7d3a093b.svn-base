public interface Controller {      
    
  /* This method adds a new player id to model */
  public void add(int who);
  
  /* This method tells that a fiducial
  with symbol id "who" chose the id "what" of a circle */
  public void choose(int who, int what);
    
  /* A player sits down his beer */
  public void playerOnScreen(int who, int what, float x, float y);
  
  /* A player lifts his beer */
  public void playerOffScreen(int who); 
  
  /* A player lifts his beer */
  public void movePlayer(int who, int what, float x, float y);   
  
  /* Broadcasts these messages to all barrels (incl. itself) */
  
  public void choiceUpdate(int who, int what);
  public void addUpdate(int who);
    
}
