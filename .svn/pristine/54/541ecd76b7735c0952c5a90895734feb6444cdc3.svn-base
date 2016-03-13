public class Question {
  String q; // the question
  int winnerPoints; // how many points the winner gets
  Option winnerOption; // the players with this choice get winnerPoints after timeout
  List<Player> players; // the current players at all barrels
  List<Option> options; // the options of this question
  boolean winnersUpdated; // the winners can only receive the points once from this question!  
  String bgUrl;
  String centerUrl;

  public Question(String q, int winnerPoints, Option winnerOption, List<Option> options, String bgUrl, String centerUrl) {
    this(q, winnerPoints, options, bgUrl, centerUrl);
    this.winnerOption = winnerOption;
  }  
  
  /* THIS CONSTRUCTOR IS FOR VOTES, WHEN MOST VOTES IS THE WINNER OPTION */
  public Question(String q, int winnerPoints, List<Option> options, String bgUrl, String centerUrl) {
    this.q = q;
    this.winnerPoints = winnerPoints;    
    this.players = new ArrayList<Player>();
    this.options = options;
    this.winnersUpdated = false;
    this.bgUrl = bgUrl;
    this.centerUrl = centerUrl;
  }
  
  public String getQ() {return q;}
  public String getBg() {return bgUrl;}
  public String getCenter() {return centerUrl;}
  
  /* If winnerOption is selected in constructed, return.
  Otherwise calculate from options */
  public Option getWinnerOption() {
    if (winnerOption != null) return winnerOption;
    Option mostVoted = options.get(0);
    for (Option o : options) {
     if (o.getVotes() > mostVoted.getVotes()) {
      mostVoted = o;
     }
    }
    return mostVoted; 
  }

  public void reset() {
    this.players = new ArrayList<Player>(); // new empty list
    for (Option o : options) {
      o.resetPlayers();
    }    
  }
  
  public void addPlayers(List<Player> players) {
    this.players = players;    
  }
  
  /* Removes a certain player from all options */
  private void removePlayer(Player p) {
     for (Option o : options) {
       if (o.getPlayers().contains(p)) {
         o.removePlayer(p);
       }
     }
  }
  
  /*
  public void gameVote(Player p, Option choice) {
    removePlayer(p);
    choice.addPlayer(p); // add player to the choice        
  }*/

  /* Add / change player's vote to this choice */
  public void playerVote(Player p, Option choice) {    
    removePlayer(p);
    choice.addPlayer(p); // add player to the choice            
    //if (allActiveVoted()) thread("nextQuestion");
  } 
 
  /*public boolean allActiveVoted() {
     List<Player> activePlayers = new ArrayList<Player>(); 
     for (Option o : options) {
       activePlayers.addAll(o.getPlayers());
     }         
     return activePlayers.size() == m.getPlayers().size();
  }*/
  
  public List<Player> playersThatVoted() {
    List<Player> activePlayers = new ArrayList<Player>(); 
     for (Option o : options) {
       activePlayers.addAll(o.getPlayers());
     }         
     return activePlayers;
  }
     

  /** Returns the winners of this question **/
  public List<Player> getWinners() {    
    return getWinnerOption().getPlayers();
  }
  
  public int getWinnerPoints() {
    return winnerPoints;
  }

  public void updateWinners() {
    if (!winnersUpdated) {    
      for (Player p : getWinners()) {
        p.addPoints(winnerPoints);
      }
    }
    winnersUpdated = true;
  }

  public void printPlayers() {
    for (Player p : getWinners()) {
      println("Q: Player " + p.getId() + " has " + p.getPoints() + "points.");
    }
  }

  public void printQ() {
    println(q);
  }

  public List<Option> getOptions() {
    return options;
  }

  public Option getOptionById(int id) {
    Option what = null;
    for (Option o : options) {
      if (o.getId() == id) what = o;      
    }
    if (what == null) println("no object for id " + id);
    return what;      
  }  

  public Map<Option, Integer> getVotes() {
    Map<Option, Integer> numberVotes = new HashMap<Option, Integer>();

    // add the options
    for (Option o : options) {
      numberVotes.put(o, o.getPlayers().size());
    }
    return numberVotes;
  }
  
  public String toString() {
    return "Question: " + q;
  }

}

