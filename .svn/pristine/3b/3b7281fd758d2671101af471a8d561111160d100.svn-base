public class Option {
  String imgUrl;
  List<Player> players;  
  Circle circle;
  int id;
  String text;
  boolean isVisible = true;
  
  public Option(String text, String imgUrl, Circle c, int id) {
    this.text = text;
    this.imgUrl = imgUrl;
    this.circle = c;
    this.id = id;
    this.players = new ArrayList<Player>();
  }
  
  // at end of question time, remove players for the option
  public void resetPlayers() {
    circle.removeVotes();
    players = new ArrayList<Player>(); // new empty list    
  }
  
  public void addPlayer(Player p) {
    players.add(p);        
    if (isVisible) circle.addVote(p.getCoaster()); // update circle in view accordingly    
  }
  
  public void notVisible() { isVisible = false; }
  public void setVisible() { isVisible = true; }
  
  public void updateCircle() {
    circle.addVotes(getCoasters()); // update circle in view accordingly
  }
  
  private List<Coaster> getCoasters() {
    List<Coaster> coasters = new ArrayList<Coaster>();
    for (Player p : players) {
      coasters.add(p.getCoaster());
    }
    return coasters;
  }
  
  public void removePlayer(Player p) {
    players.remove(p);
    circle.removeVote(p.getCoaster()); // update circle in view accordingly
  }
  
  public List<Player> getPlayers() {
    return players;
  }
  
  public int getVotes() {
    return players.size();
  }
  
  public int getId() {
    return id;
  }

  public String getImgUrl() {
    return imgUrl;
  }  
  
  public String getText() {
    return text;
  }
  
  public Circle getCircle() {
    return circle;
  }
  
  public int getPoints() {
    return players.size();
  }
  
  public String toString() {
    return "Option " + imgUrl + " (" + getPoints() + ")";
  }
  
 
}
