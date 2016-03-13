import java.util.concurrent.*;
import de.looksgood.ani.*;
import java.io.*;
import java.net.*;
import java.util.*;

import TUIO.*;

/* VIEW RELATED constants */
public final static int screenSize = 800;
public final static int FONT_SIZE0 = 50;
public final static int FONT_SIZE1 = 25;
public final static int FONT_SIZE2 = 20;
public final static int FONT_SIZE3 = 15;
public final static color BLACK = #000000;
public final static color WHITE = #FFFFFF;
public final static color BLUE = #0055e2;
public final static color RED = #cc0000;

/* MODEL RELATED constants */
public final static int CENTER_ID = 800;
public final static int BG_ID = 801;
public final static int TOTAL_PLAYER_IDS = 10;
public final static int MAX_PLAYERS = 5;
public final static int MAX_ID = MAX_PLAYERS-1;
public final static int APPEARED = 1000; // this is magic number for a symbol ID appearing and not choosing anything
public final static int OTHER_BARREL = 1001; // ONLY for Spotify broadcasts. So that no player info is sent.


TuioProcessing tuioClient;
ArrayBlockingQueue<Integer> addList = new ArrayBlockingQueue<Integer>(100);
//Creates the sender/client for this barrel  
MessageSender sender = new MessageSender();
float radio;
float rotate = 0;
PFont font;
PFont boldFont;

float threadTimer = 0;

// MVC pattern
Model m; // model
View v; // view
Controller startController; // start controller
Controller quizStartController; // for quiz start
Controller quizController; // for quiz
Controller spotifyController; // for Spotify
Controller pongController; // for pong
Controller nullController; // for transitions

GameDriver gd; //The game driver is a separate controller that controls actions over TIME

boolean isAdmin;
int admin = 10;
int admin2 = 16;

void setup() {  
  size(screenSize, screenSize, OPENGL);
  tuioClient = new TuioProcessing(this);
  Ani.init(this);


  v = new ConcreteView();                              // view
  m = new ConcreteModel(v);                            // model
  v.learnModel(m);
  
  
  startController = new StartController(m, sender); // controller    
  spotifyController = new SpotifyController(m, sender);
  quizStartController = new QuizStartController(m, sender);
  quizController = new QuizController(m);
  pongController = new PongController(m);  
  nullController = new NullController();
  v.setController(startController); // called here because view should be initiated before model    
  

  gd = new GameDriver(m);
  gd.setupGames();  

  radio = height/16;
  
  /* The barrel is connected to the network group */
  //Creates the listener that will recieve events from other barrels
  MessageReceiver receiver = new MessageReceiver(v, m);
  receiver.start();


  noiseDetail(8);
  frameRate(20); 
  hint(ENABLE_DEPTH_SORT);
  hint(DISABLE_DEPTH_TEST);

  font = createFont("Helvetica", FONT_SIZE1, true);  
  //font = loadFont("Sommet Rounded Regular.otf");
  //boldFont = loadFont("Sommet Rounded Bold.otf");  
  textFont(font);//,FONT_SIZE1);
  
  //isAdmin = false;
}

void draw() {
  // BACKGROUND GREY TO SEE INTERFACE SIZE
  // background(50, 50, 50);    
  background(0);
  
  /**** Draw logo */
  v.drawLogo();
  
  //v.drawBubbles();  
  v.drawCoasters();
    
  /***** Update model */
  //m.update();
}


void addTuioObject(TuioObject tobj) {
  //Check if object is added to screen  
  if(tobj != null) {
    if ((millis() - threadTimer) >= 8) {
      if(!addList.contains(tobj.getSymbolID())) {
        threadTimer = millis();
        addList.add((int)tobj.getSymbolID());
        (new AddThread(tobj.getSessionID(), (int)tobj.getSymbolID())).start();
      }
    }
  }

}

void addAfterFilter(TuioObject tobj) {
  if(tobj != null) {
    int symid = (int)tobj.getSymbolID();
    int sesid = (int)tobj.getSessionID();  
    /*if (symid == admin2) {    
      v = new ConcreteView();
      m = new ConcreteModel(v);
      v.setController(startController); println("::::: start c: "+startController);    
      println("::::::: RESET ALL PLAYERS IN MODEL :::::");
    }  
    else if (symid == admin) {
      isAdmin = true;
      nextQuestion();
    }
    else {*/
      if (symid <= 4) v.addCoaster(symid, getX(tobj), getY(tobj));
    //}
  }
}


void removeTuioObject(TuioObject tobj) { 
  
  if(tobj != null) {
    if ((millis() - threadTimer) >= 8) {
      if(!addList.contains(tobj.getSymbolID())) {
        threadTimer = millis();
        addList.add((int)tobj.getSymbolID());
        (new ARemoveThread(tobj.getSessionID(), tobj.getSymbolID())).start();
      }
    }
  }

}

void removeAfterFilter(int symid) { 
  /*if (symid == admin || symid == admin2) {
    if (symid == admin) isAdmin = false; 
  } else {
  */
    v.removeCoaster(symid);    
}

/* Maintains the coaster's position in the view */
void updateTuioObject(TuioObject tobj) {    
  int symid = (int)tobj.getSymbolID();
  if (symid == admin || symid == admin2) {}
  else {
    v.updateCoaster(symid, getX(tobj), getY(tobj));
  }
}


/** FOR MULTI-TOUCH */
void addTuioCursor(TuioCursor tcur) {
}
void removeTuioCursor(TuioCursor tcur) {
}
void updateTuioCursor(TuioCursor tcur) {
}
void refresh(TuioTime bundleTime) {
}



/********************************************/
/************* CALLBACK METHODS *************/
/********************************************/

/* This fades in the quiz */
public void showQuestion() {
  try { 
    Thread.sleep(500);
  } 
  catch(Exception e) {
  }
  v.fadeInSet();
}

/* This fades out the quiz */
public void removeQuestion() {
  try { 
    Thread.sleep(500);
  } 
  catch(Exception e) {
  }
  v.fadeOutSet();
}

public void endPongAndShowGames() {
  boolean success = m.take();  
  if (success) {
    v.setController(nullController);
    
    try {Thread.sleep(1000);} catch (Exception e) {}
    m.endGame();        
    v.setController(startController);
    
    m.release();    
  }  
}

public void leaveSpotifyAndStartVote() {
  boolean success = m.take();  
  if (success) {
      hidePlayers();
      v.setController(nullController);
        
    try {Thread.sleep(1000);} catch (Exception e) {}
    m.endGame();        
    v.setController(startController);
    showPlayers();        
    
    m.release();    
  }  
}

public void leaveSpotify() {
  boolean success = m.take();  
  if (success) {
    hidePlayers();
    v.setController(nullController);
    
    try {Thread.sleep(1000);} catch (Exception e) {}
    m.endGame();        
    v.setController(startController);        
    showPlayers();
    
    m.release();    
  }  
}

/* This fades in the game options again */
// sleeps and fades in order to not collide with fade out of question
public void endQuizAndShowGames() {
  boolean success = m.take();  
  if (success) {
    hidePlayers();
      
    v.setController(nullController);
    
    v.winnerCountdown();
    
    try {Thread.sleep(3000);} catch (Exception e) {}    
    m.announceWinner();    
    
    // time for seeing winner
    try {Thread.sleep(4000);} catch (Exception e) {}
    m.endGame();        
    v.setController(startController);    
    showPlayers();
    m.release();    
  }  
}

public void hidePlayers() {
  for (Player p : m.getPlayers()) {
    if (m.getGame().contains(p.getId()))
      m.playerOffScreen(p.getId());
  }
}

public void showPlayers() {
  for (Player p : m.getPlayers()) {
    if (m.getGame().contains(p.getId()))
      m.playerOnScreen(p.getId(), p.getX(), p.getY());
  }
}


public void nextQuestion() {        
    boolean success = m.take();  
    if (success) {
      //println("-------- Callback: ENDING QUESTION AND STARTING NEW");
      v.setController(nullController);
      hidePlayers();      
      
      // time after all active voted
      try {Thread.sleep(500);} catch (Exception e) {} 
      m.getGame().endQuestion();    
      
      // time for showing right answer
      try {Thread.sleep(3000);} catch (Exception e) {}    
      v.toLogo();
      v.resetCircles();
      
      //time before showing next question
      try {Thread.sleep(1000);} catch (Exception e) {}
            
      m.getGame().nextQuestion();
      v.setController(quizController);
      showPlayers();      
      m.release();      
    }   
}

/*public void hibernate() {
  boolean success = m.take();  
  if (success) {
    m.hibernate();
    try {
      Thread.sleep(1000);
    } 
    catch (Exception e) {
    }
    m.release();
  }
}*/


public float getX(TuioObject tobj) {  
  //return tobj.getX() * screenSize; // for testing
  return screenSize - (tobj.getX() * screenSize / 1) + 10 * tobj.getY() - 20; // for tweeking at screen
}

public float getY(TuioObject tobj) {
  //return tobj.getY() * screenSize; // for testing
  return screenSize - tobj.getY() * screenSize / 1 - 30 * tobj.getX() + 30; // for tweeking at screen
}
