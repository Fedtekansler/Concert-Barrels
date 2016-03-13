public class ConcreteView implements View {

  Controller c; // controller to execute events on
  Logo logo;
  color cc = #FFFFFF;
  Coaster[] coasters;  
  String timeText;  
  boolean firstVote = true;  
  Model m;

  public ConcreteView() {
    logo = new Logo(cc);    
    coasters = new Coaster[MAX_PLAYERS];    
    timeText = "";           
    setupCoasters();
  }
  
  public void learnModel(Model m) {
    this.m = m;
  }

  public void setupCoasters() {
    /*********************************/
    /* GENERATE COLOR FOR each coaster */
    Color[] colors = {
      Color.YELLOW, Color.RED, Color.GREEN, Color.BLUE, Color.PURPLE
    }; 
    for (int i = 0; i<MAX_PLAYERS; i++) {
      Coaster coaster = new Coaster(colors[i], i);
      coasters[i] = coaster;
    }
  }

  public void setController(Controller c) {
    this.c = c;
    println("::: C: " + c);
  }  

  public void drawLogo() {
    logo.drawLogo();
  }

  public void toGames(Question q) {
    setController(startController); // global variable for start controller
    logo.fadeInGameOptions(q);
  }            

  public void toLogo() {
    logo.transformToLogo();
  }

  public void toPong() {
    logo.transformToPong();    
    setController(pongController); // global variable for Pong controller
    println("::::: c: "+pongController);
  }

  public void growToStart() {
    logo.growToStart();
  }

  public void toSpotify(Question q) {
    logo.transformToSpotify(q);
    setController(spotifyController); // global variable for Spotify controller
    println("::::: c: "+spotifyController);
  }

  public void toQuiz(Question q) {
    logo.transformToQuizStart(q);
    setController(quizStartController); // global variable for quiz controller
    println("::::: c QS: "+getController());
  } 

  public void toQuestion(Question q) {    
    logo.transformToQuestion(q);    
    setController(quizController); // global variable for quiz controller
    println("::::: c: "+quizController);
  }

  public void fadeInSet() {
    logo.fadeInSet();
  }

  public void fadeOutSet() {
    logo.fadeOutSet();
  }    

  public List<Circle> getOptionCircles() {
    return logo.getOptionCircles();
  }

  public Circle getCircleById(int id) {
    return logo.getCircleById(id);
  }
  
  public Controller getController() {
    return c;
  }

  public void resetCircles() {
    logo.resetCircles();
  }


  /* Called in the draw LOOP from radar */
  public void drawCoasters() {
    /**** Draw coaster icon */
    for (int i=0;i<MAX_PLAYERS;i++) { 
      if (coasters[i] != null) { 
        coasters[i].updateIntersectingCoasters(coasterIntersectCoaster(coasters[i]));
        coasterIntersectBubble(coasters[i]);
        //Draw the coaster
        coasters[i].draw();
      }
    }
  }

  public void addCoaster(int symid, float x, float y) {                    
    /* CHECK IF PLAYER CHOSE SOMETHING AND TELL CONTROLLER */
    Circle cWithin = withinOptionCircle(x, y);      
    if (cWithin != null) {   
      println("In VIEW: choice called: " + symid + "," + cWithin.getId());      
      c.playerOnScreen(symid, cWithin.getId(), x, y); // VOTE
    } else if (withinCenter(x,y)) {
      c.playerOnScreen(symid, CENTER_ID, x, y); // the center is hit
    } else {
      c.playerOnScreen(symid, APPEARED, x, y); // NO VOTE, player just appeared
    }    
    //Handler for the back button on spotify interface
    if (withinSpotifyBackButton(x,y) && m.getGame().toString().equals("SPOTIFY")) {
      logo.getSpotifyBackButton().hideSpotifyButton();
      resetCircles();
      thread("leaveSpotify");
    }
    
  }  

  public void resetCoasters() {    
    coasters = new Coaster[MAX_PLAYERS];
  }

  public Coaster getCoasterBySesId(int sesid) {    
    return coasters[sesid];
  }


  public void removeCoaster(int symid) {         
    if (m.contains(symid))
      if (getCoasterById(symid) != null) c.playerOffScreen(symid);
  }

  public void updateCoaster(int symid, float x, float y) {
    if (m.contains(symid)) {
      Circle circle = withinOptionCircle(x,y);
      if (circle != null) c.movePlayer(symid,circle.getId(),x,y);
      else c.movePlayer(symid,APPEARED,x,y);
    }   
  }

  /** Answers on whether or not a given coaster by id is within an option/circle's range **/
  public Circle withinOptionCircle(float x, float y) {    
    Circle within = null;    
    for (Circle c : logo.getOptionCircles()) {
      if ((x >= c.getX()-c.getR() && x <= c.getX()+c.getR())
        && (y >= c.getY()-c.getR() && y <= c.getY()+c.getR())) {
        within = c;
      }
    }
    return within;
  }

  public boolean withinCenter(float x, float y) {
    Circle center = logo.getCenter();
    return ((x >= center.getX()-center.getR() && x <= center.getX()+center.getR())
      && (y >= center.getY()-center.getR() && y <= center.getY()+center.getR()));
      
  }
  
  public boolean withinSpotifyBackButton(float x, float y) {
    Circle backButton = logo.getSpotifyBackButton();
    return ((x >= backButton.getX()-backButton.getR() && x <= backButton.getX()+backButton.getR())
      && (y >= backButton.getY()-backButton.getR() && y <= backButton.getY()+backButton.getR()));
      
  }

  // Answers on wether or not a given coaster is on top of a bubble, if yes, it makes the bubble orbit it.
  private void coasterIntersectBubble(Coaster coaster) {    
    Bubble intersect = null;
    for (Bubble b : logo.getAllBubbles()) {
      if ((coaster.getX() >= b.getX()-b.getR()*3.4 && coaster.getX() <= b.getX()+b.getR()*3.4)
        && (coaster.getY() >= b.getY()-b.getR()*3.4 && coaster.getY() <= b.getY()+b.getR()*3.4)
        && b.isInOrbit() == false && coaster.isVisible()) {
        b.chooseCoaster(coaster);
        b.bubbleOrbit(true);
        b.setStartAngle(coaster.getX(), coaster.getY());
      }
    }
  }

  // Answers on wether or not a given coaster is on top of another coaster. If yes it adds it to its set.
  private ArrayList<Coaster> coasterIntersectCoaster(Coaster self) {
    ArrayList<Coaster> intersect = new ArrayList<Coaster>();
    for (int i = 0; i < MAX_PLAYERS; i++) {
      if (coasters[i] != null && coasters[i].isVisible() == true) {
        if ((self.getX() >= coasters[i].getX()-coasters[i].getR() && self.getX() <= coasters[i].getX()+coasters[i].getR())
          && (self.getY() >= coasters[i].getY()-coasters[i].getR() && self.getY() <= coasters[i].getY()+coasters[i].getR())) {
          //println(self + " This is intersect " + coasters[i]);
          intersect.add(coasters[i]);
        }
      }
    }
    return intersect;
  }

  public void setMessage(String t) {
    logo.setCenterText(t);
  }

  public void setPlayerIcon(int sesid, String imgUrl, Color theColor) {
    logo.setPlayerIcon(sesid, imgUrl, theColor);
    
  }

  public void showSpotifyChoice(Option o) {
    logo.showSpotifyChoice(o);
  }

  public void showRightAnswer(Option o) {
    logo.showWinnerOption(o);
  }
  
  public void winnerCountdown() {
    logo.winnerCountdown();
  }

  public void showWinnerOfQuiz(Player p) {
    logo.showWinner(p);
  }


  public Coaster getCoasterById(int symid) {
    //return playerCoasters.get(symid);
    for (Coaster coaster : coasters) {
      if (coaster.getSymId() == symid) {
        return coaster;
      }
    }
    return null;
  }
}

