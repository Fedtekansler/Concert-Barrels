public interface View {
  /* For the state pattern */
  public void setController(Controller c);  
    
  public void drawLogo();
  
  public void learnModel(Model m);
  
  /* Transformations of view, handled by LOGO */
  public void toGames(Question q);
  public void toLogo();
  public void toPong();
  public void growToStart();
  public void toSpotify(Question q);
  public void toQuiz(Question q);  
  public void toQuestion(Question q);  
  public void fadeInSet();
  public void fadeOutSet();  
  
  /* GETTERS */
  public List<Circle> getOptionCircles();
  public Circle getCircleById(int id);
  public Coaster getCoasterById(int symid);
  public Coaster getCoasterBySesId(int sesid);
  public Controller getController();
  
  /* SETTERS */
  public void setMessage(String t);
  public void showSpotifyChoice(Option o);
  public void showRightAnswer(Option o);  
  public void showWinnerOfQuiz(Player p);
  public void winnerCountdown();
  public void resetCircles();
  public void resetCoasters();
  public void setPlayerIcon(int sesid, String imgUrl, Color theColor);    

  /* Event from radar (main class) executed on view. Sends messages to CONTROLLER */
  public void drawCoasters(); /* Called in the draw LOOP */
  public void addCoaster(int symid, float x, float y);      
  public void removeCoaster(int symid);
  public void updateCoaster(int symid, float x, float y);    
  
  /** Answers on whether or not something is within an option/circle's range **/
  public Circle withinOptionCircle(float x, float y);
  
}
