import java.util.*;

class Quiz implements Game {  
  List<Question> questions;  
  Map<Player, Integer> playerPoints;
  Question current;
  boolean started;
  int next = 0;
  Integer points = 0;
  Player currentWinner;
  View v;
  Model m;
  Question startQ;
  int quizSesId = 0; // for quiz players

  public Quiz(Model m) {
    this.questions = new ArrayList<Question>();
    this.playerPoints = new HashMap<Player, Integer>();   
    this.started = false;
    this.m = m;      
  }
  
  public boolean allActiveVoted() {  
    return getCurrentQuestion().playersThatVoted().size() == playerPoints.keySet().size();
  }
  
  public boolean isStarted() {
    return this.started;
  }
  public void start() {
    println("QUIZ STARTED");
    started = true;
    setupStartQuestion();
    v.toQuiz(startQ);
    resetQuestions();        
  }
  
  public void addPlayer(int who) {
    if (quizSesId > MAX_ID) {
      println("NO MORE PLAYERS JOIN QUIZ");
    } else {
      playerPoints.put(m.getPlayerById(who), 0);
      v.setPlayerIcon(quizSesId, m.getPlayerById(who).getIcon(), m.getPlayerById(who).getCoaster().getColor());
      quizSesId += 1;
    }
  }
  
  public boolean contains(int who) {
    for (Player pp: playerPoints.keySet()) {
      if (pp.getId() == who) {
        return true;
      }
    }
    return false;
  }
  
  private void setupStartQuestion() {
    List<Option> options = new ArrayList<Option>();
    Option op1 = new Option("", "fortryd.png", v.getCircleById(0), 0);
    Option op2 = new Option("", "start.png", v.getCircleById(1), 1);
    Option op3 = new Option("", "tuborg.png", v.getCircleById(2), 2);
    options.add(op1); options.add(op2); options.add(op3);
    this.startQ = new Question("", 0, options, "", "");    
  } 
  
  private void resetQuestions() {
    for (Question q : questions) {
      q.reset();
    }
  }
  
  public void end() {
    this.started = false;        
  }
  
  public void setView(View v) {
    this.v = v;
  }
  
  public void vote(int who, int what) {
    Question q = getCurrentQuestion();    
    Option choice = q.getOptionById(what);
    Player p = m.getPlayerById(who);
    q.playerVote(p,choice);
  }
  
  public Question getCurrentQuestion() {
    return current;
  }

  public void add(Question q) {
    if (questions.size() == 0) current = q; // initial question        
    questions.add(q);
  }

  /* Runs the next question. If no more questions, terminate quiz */
  public void nextQuestion() {    
    if (started  && playerPoints.keySet().size() >= 2) {      
      for (Player p : m.getPlayers()) {
        if (playerPoints.get(p) == null) p.off();
      }
      int currentQ = next;
      next = next + 1;

      int lastId = questions.size()-1;
      if (currentQ > lastId) {                
        thread("endQuizAndShowGames"); // sleeps and fades in order to not collide with fade out of question                
      } else {
        current = questions.get(currentQ);        
        current.addPlayers(m.getPlayers());
        v.toQuestion(current); // UPDATES VIEW WITH NEW QUESTION!
      }            
    }
  }    

  public void endQuestion() {
    if (started) {                  
      v.showRightAnswer(current.getWinnerOption());      
      trackPoints();
      current.updateWinners();            
      current.reset();      
    }
  }
  
  public void announceWinner() {
    v.showWinnerOfQuiz(getWinner());    
  }
 
  private void trackPoints() {
    for (Player p: current.getWinners()) {
      if (playerPoints.get(p) == null) {
        println("No new player can join quiz");
        //playerPoints.put(p, current.getWinnerPoints());
      } else {
        points = playerPoints.get(p);
        playerPoints.put(p, (points + current.getWinnerPoints()));
      }
    }
    decideWinner();    
  }
  
  private void decideWinner() {
    Integer highest = 0;    
    for (Player pp: playerPoints.keySet()) {
      println("Player " + pp.getId() + ": " + playerPoints.get(pp));
      if (playerPoints.get(pp) > highest) {
        highest = playerPoints.get(pp);
        currentWinner = pp;
        println("Highest number of points: " + highest + " Player: " + pp.getId());
      } else {
       println("Not higher than highest points");
      }
    }
  }
  
  public Player getWinner() {    
    return currentWinner;
  }
  
  public void printOptions() {
    println("Options: " + current.getOptions());
  }

  public void printVotes() {
    println("Model:");
    Map<Option, Integer> numberVotes = current.getVotes();
    for (Option o : numberVotes.keySet()) {
      println("Option " + o.getId() + ": " + numberVotes.get(o));
    }
  }
  
  public String toString() {
    return "Quiz: (" + questions + ")";
  }
}

