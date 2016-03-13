class ChooseGame implements Game {
  boolean started = false;
  View v;
  Model m;
  Quiz q;
  Question whatGame;  // the question of which game to play
  
  public ChooseGame(View v, Model m) {    
    this.v = v;
    this.m = m;
    if (startController != null) {
      v.setController(startController);
      println("::::: start c: "+startController);
    }
  }  
  
  public void start() {
    started = true;
    nextQuestion();
  }
  public void end() {
    started = false;    
  }
  
  public void vote(int who, int what) {                      
    switch (what) {
      case 0: m.setGame(m.getSpotifyGame());              
        break;
      case 1: m.setGame(m.getPongGame());
        break;
      case 2: 
              m.toNextQuiz(); // model has a selection of quizzes, picks the next
              m.setGame(m.getNextQuiz());                            
        break;
      case 3: println("3 - no option");
        break;
      default: println("NOTHING WAS CHOSEN!");
        break;
    }
    println("::::::::: Game chosen: " + m.getGame() + "::::::::::");
    v.resetCircles();
    m.getGame().start();        
  }
  
  // not needed because response is immediate in ChooseGame
  public void announceWinner() {    
  }
  
  public void setView(View v) {
    this.v = v;    
  }
  public boolean isStarted() {
    return started;
  }
    
  public Question getCurrentQuestion() {
    return whatGame;
  }  
  
  public void nextQuestion() {
    createGameOptions(); 
    v.toGames(whatGame); 
  }
  
  public void createGameOptions() {
    List<Option> gameOptions = new ArrayList<Option>();             
    gameOptions.add(new Option("", "spotify.png", v.getCircleById(0),0));    
    gameOptions.add(new Option("", "pong.png", v.getCircleById(1),1));
    gameOptions.add(new Option("", "music.jpg", v.getCircleById(2),2));
    whatGame = new Question("", 0, gameOptions, "", "");    
  }
  
  /* methods for Quiz */
  public void add(Question q) {}
  public void endQuestion() {} 
  public void printOptions() {}
  public void printVotes() {}   
  public boolean allActiveVoted() { throw new RuntimeException("Not needed for this game"); }
  
  public String toString() {
    return "Choose game";
  }
  
  public Player getWinner() {return null;}
  public void addPlayer(int who) {}
  public boolean contains(int who) {return false;}
}
