public class ConcreteModel implements Model {
  Game game;
  List<Player> players;
  List<Player> activePlayers;  
  View v;  
  boolean mutex;      // holds access to model so that no mutable methods are called more than once.
  boolean started;    // is true when the barrel is ACTIVE!
  boolean timerStarted;
  int startTime = 0;  
  int maxSecs = 0;  
  List<Quiz> quizzes;
  Spotify spotify;  
  Pong pong;
  Quiz nextQuiz;
  int nextSesId = 0;  
  
  public ConcreteModel(View v) {    
    this.v = v;
    this.players = new ArrayList<Player>();
    for (int id = 0; id<TOTAL_PLAYER_IDS; id++) {      
      players.add(new Player(id));
    }
    this.activePlayers = new ArrayList<Player>();        
    this.mutex = false; 
    this.started = false;
    this.timerStarted = false;    
    this.quizzes = new ArrayList<Quiz>();    
    setGame(new ChooseGame(v,this));        
    nextQuiz = null;        
  }
  
  public void playerOnScreen(int who, float x, float y) {    
    getPlayerById(who).on(x,y);    
  }
  
  public void playerOffScreen(int who) {
    getPlayerById(who).off();
  }
    
  public void resetPlayers() {    
    this.activePlayers = new ArrayList<Player>();
    v.resetCoasters();
    getGame().getCurrentQuestion().reset();
  }
   
  public void setSpotify(Spotify spotify) {
     this.spotify = spotify;     
  }
  
  public void setPong(Pong pong) {
     this.pong = pong;     
  }
  
  public void addQuiz(Quiz q) {
    quizzes.add(q);
  }    
  
  public Game getPongGame() {
    return pong;
  }
  
  public Game getSpotifyGame() {
    return spotify;
  }
  
  public Game getNextQuiz() {
    return nextQuiz;
  }  
  
  /* Setup to loop through quizzes such that it never gets out of bounds */
  public void toNextQuiz() {    
    if (nextQuiz == null) {
      nextQuiz = quizzes.get(0);
    } else {
      int next = quizzes.indexOf(nextQuiz)+1;
      if (next > quizzes.size()-1) {
        nextQuiz = quizzes.get(0);
      } else {
        nextQuiz = quizzes.get(next);
      }
    }          
    println("::::::::::: STARTING NEXT QUIZ:::::::::::::::");
  }
   
  public void endGame() {       
    game.end();
    setGame(new ChooseGame(v,this));
    game.start();    
  }
  
  public void announceWinner() {
    game.announceWinner();
  }
  
  public void announceSpotifyWinner() {
    getSpotifyGame().announceWinner();
    setGame(new ChooseGame(v, this));
    game.start();
  }
  
  public void vote(int who, int what) {
    if (getPlayerById(who) == null) {
      try {Thread.sleep(100);} catch(Exception e) {} // THIS SLEEP IS SO THAT A PLAYER CAN BE SAFELY ADDED BEFORE VOTING DIRECTLY      
    }        
    game.vote(who, what);                
  }
  
  public void updateNextSesId() {
    nextSesId += 1;
  }
  
  public int getNextSesId() {
    return nextSesId;
  }
  
  public void setGame(Game g) {
    this.game = g;    
    this.game.setView(v);        
  }    
  
  public Game getGame() {return game;}
  public View getView() {return v;}
  public void release() {mutex = false;}  
  
  
  public boolean take() {
    if (mutex) return false;
    mutex = true;
    return mutex;
  }  

  public void add(int who) {    
    println("ACTIVE: " + activePlayers);
    // If this is the first player, the INTERFACE STARTS!!
    if (activePlayers.size() == 0) {
      this.started = true;
      game.start();                           
    }
                
      Coaster coaster = v.getCoasterById(who);    
      Player p = fetchPlayer(who);
      p.setCoaster(coaster);
      activePlayers.add(p);    
  }
  
  public void add(int who, Coaster coaster) {
    Player p = fetchPlayer(who);
    p.setCoaster(coaster);
    activePlayers.add(p);  
  }
  
  private Player fetchPlayer(int id) {
    Player who = null;
    for (Player p : players) {
      if (p.getId() == id) who = p;      
    }
    return who;
  }

  public void hibernate() {
    if (started) {
      started = false;
      v.toLogo();
    }
  }    
  
  public Player getPlayerById(int id) {
    Player who = null;
    for (Player p : activePlayers) {
      if (p.getId() == id) who = p;      
    }
    return who;
  }    
  
   
  /** answers on whether or not the player is already added **/
  public boolean contains(int who) {
    return getPlayerById(who) != null;
  }
  
  

  public List<Player> getPlayers() {
    return activePlayers;
  }
  
  public boolean allActiveVoted() {
    return getGame().allActiveVoted();
  }

  public void printOptions() {
    game.printOptions();
  }
  
  public void printVotes() {
    game.printVotes();
  }  
    
}
