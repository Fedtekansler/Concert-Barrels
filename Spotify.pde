import java.util.*;

class Spotify implements Game {  
  List<Question> songQuestions;  
  Question current;
  boolean started;
  int next = -1; // in order to start at zero -- look in start
  Integer points = 0;  
  View v;
  Model m;  
  boolean voteStarted = false;

  public Spotify(Model m) {
    this.songQuestions = new ArrayList<Question>();   
    this.started = false;
    this.m = m;    
  }      

  public boolean isStarted() {
    return this.started;
  }
  public void start() {
    this.started = true;                
    //if (!voteStarted) next = next + 1; 
    if(next == -1) next = next + 1;  
    current = songQuestions.get(next);
    println("vote started: " + voteStarted);    
    current.addPlayers(m.getPlayers());
    println("The votes: ");
    for (Option o : current.getOptions()) {
      println(o.getPlayers());
    }
    v.toSpotify(current); // UPDATES VIEW WITH NEW VOTE!
    setVisible();
  }

  // THIS IS FOR NOT UPDATING VIEW FROM OTHER BARREL UPDATES
  public void setVisible() {
    for (Option o : current.getOptions()) {
      o.setVisible();
    }
  }    
  public void notVisible() {
    for (Option o : current.getOptions()) {
      o.notVisible();
    }
  }

  public void barCallStart(Game currentGame) {
    this.started = true;                
    if (!voteStarted) next = next + 1;   
      current = songQuestions.get(next);
      println("vote started: " + voteStarted);    
      current.addPlayers(m.getPlayers());
      println("The votes: ");
      for (Option o : current.getOptions()) {
      o.resetPlayers();
      println(o.getPlayers());
    }  
    if(currentGame == this) {
        v.toSpotify(current); // UPDATES VIEW WITH NEW QUESTION!
    }
  }   
  
  public void vote(int who, int what) {
    Question q = getCurrentQuestion();    
    Option choice = q.getOptionById(what);
    Player p = null;
    if (m.contains(who)) {      
    } else {      
      Coaster coaster = new Coaster(Color.GREY,who);
      m.add(who, coaster);
    }
    p = m.getPlayerById(who);
    q.playerVote(p,choice);           
  }
  
  public void announceWinner() {
    //voteStarted = false; // reset the vote
    //started = false;
   /*
    * Her sender vi til baren at sangen er blevet valgt. Ved ikke om det er det rigtige sted i endelig løsning.
    */      
    new MessageSender().sendSpotifyMessage(getCurrentQuestion().getWinnerOption().getText());
    println("WE ANNOUNCE WINNER THROUGH SENDER");
    //v.showSpotifyChoice(getCurrentQuestion().getWinnerOption());    
  }
  
  public void setView(View v) {
    this.v = v;
  }
  
  public Question getCurrentQuestion() {
    return current;
  }

  public void add(Question q) {
    if (songQuestions.size() == 0) current = q; // initial question        
    songQuestions.add(q);
  }

  /* Runs the next question. If no more questions, terminate quiz */
  public void nextQuestion() {  
    if (started) {        
      int lastId = songQuestions.size()-1;
      if (next > lastId) {                
        println("No more spotify songs");                 
      } 
      
      v.resetCircles(); println("resetting circles");
      
      if (!voteStarted) {
        voteStarted = true;
        thread("leaveSpotifyAndStartVote");
      } else {
        thread("leaveSpotify");
      }        
    }
  }    

  public void endQuestion() {
    if (started) {                  
      v.showSpotifyChoice(current.getWinnerOption());                                         
    } else {
      current.reset();
    }
  }  
  
  public boolean allActiveVoted() {  
    return getCurrentQuestion().playersThatVoted().size() == m.getPlayers().size();
  }
  
  public void printOptions() {
    println("Spotify options: " + current.getOptions());
  }

  public void printVotes() {
    println("Model:");
    Map<Option, Integer> numberVotes = current.getVotes();
    for (Option o : numberVotes.keySet()) {
      println("Option " + o.getId() + ": " + numberVotes.get(o));
    }
  }
  
  public String toString() {
    return "SPOTIFY";
  }
  
  // not needed in spotify
  public void addPlayer(int who) {}
  public boolean contains(int who) { return false;}
  public void end() { started = false; notVisible(); }
  public Player getWinner() { throw new RuntimeException("Should never be called"); }
}

