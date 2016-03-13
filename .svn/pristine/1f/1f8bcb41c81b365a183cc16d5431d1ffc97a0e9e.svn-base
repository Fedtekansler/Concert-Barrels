class Logo {
  Circle bg;
  Circle center;  
  Circle spotifyBackButton;
  Circle[] circles;
  Bubble[] bubbles;
  color cc;
  final int circleAmount = 4;
  final int bubbleAmount = 5;
  List<String> imgUrls;
  PImage[] playerIcons;  
  boolean showQuizActivePlayers = false;
  int alphaValue = 0;
  ArrayList<VoteAnimation> voteAnimations = new ArrayList<VoteAnimation>();
  
  // array of vectors for circles: (x,y,radius)
  final float[][] cPos = { {height/5.8, height/2.9, height/5.9/2},
                           {height/2.5, height/5, height/10/2},
                           {height/1.35, height/2.65, height/5.5/2},
                           {height*0.63, height*0.72, height/7.5/2}                           
                            };
  final float[][] bPos = { {height/1.8, height/4.5, height/18/2},
                           {height/1.25, height/1.7, height/20/2},
                           {height*0.68, height*0.84, height/24/2},
                           {height*0.48, height*0.72, height/15/2},
                           {height*0.24, height*0.61, height/18/2}
                            };
  final float centerR = height/2.5/2;                        
  final float optionSize = height*0.11;    
  final float bubbleSize = height/35;  
  
  public Logo(color ccolor) {
    spotifyBackButton = new Circle(height/2, height/1.4, height/18, #880000);
    spotifyBackButton.setTextOnly("TILBAGE");
    spotifyBackButton.setTextColor(WHITE);
    spotifyBackButton.hideSpotifyButton();
    cc = ccolor;
    bg = new Circle(height/2, height/2, height/2, #000000); bg.setTextSize(FONT_SIZE1);
    bg.setId(BG_ID);
    
    center = new Circle(height/2, height/2, centerR, #FFFFFF);
    center.setId(CENTER_ID);    
    circles = new Circle[circleAmount];
    bubbles = new Bubble[bubbleAmount];   
    playerIcons = new PImage[MAX_PLAYERS];  
    
    // circles are numbered from left to right, top to bottom. 
    for (int i=0;i<circleAmount;i++) {            
      circles[i] = new Circle(cPos[i][0], cPos[i][1], cPos[i][2], cc);      
      circles[i].setTextSize(FONT_SIZE2);      
      circles[i].setId(i);
    }
    
    // initiate bubbles
    for (int i=0;i<bubbleAmount;i++) {      
      bubbles[i] = new Bubble(bPos[i][0], bPos[i][1], bPos[i][2]);            
    }    
     
    initPlayerIcons();    
  }
  
  private void initPlayerIcons() {
    for (int i = 0; i<MAX_PLAYERS; i++) playerIcons[i] = loadImage("p-grey.png");
  }

  
  public void drawLogo() {
    bg.draw();
    center.draw();
    spotifyBackButton.draw();
    for (int i=0;i<circleAmount;i++) {  
      circles[i].draw();       
    }
    
    if (showQuizActivePlayers) {      
      tint(255, alphaValue);
      for (int i = 0; i<MAX_PLAYERS; i++) {
        image(playerIcons[i], height/2.9 + 50*i, height/2.5);  
      }    
    }
    
    //Adding the animation when users join in
    for(VoteAnimation vA : voteAnimations) {
      if(vA.doneAnimating()) {
        vA=null;
      } else {
        vA.drawAnimation();
      }
    }
    
    for (int i=0;i<bubbleAmount;i++) {  
      bubbles[i].draw(); 
    }            
    
  }  
  
  /*******************************************************/
  /****************** TRANSFORMATIONS ********************/
  /*******************************************************/
  
   /* For circle */
  public void fadeInPlayerIcons() {
    showQuizActivePlayers = true; 
    Ani fadeInAni = new Ani(this, 4, "alphaValue", 255);
    fadeInAni.seek(0);
    fadeInAni.resume();
  }

  /* For circle */
  public void fadeOutPlayerIcons() {    
    Ani fadeOutAni = new Ani(this, 4, "alphaValue", 0);
    fadeOutAni.seek(0);
    fadeOutAni.resume();
    initPlayerIcons();    
  }  
  
  public void fadeInGameOptions(Question q) {   
    circles[2].stopPulsating(); // for pulsating "join game" in quiz start
    fadeOutPlayerIcons();
    setupGameCircles(q.getBg(), "", "", q.getOptions());
          
    circles[0].move(height*0.3,height*0.65,optionSize);
    circles[1].move(height*0.5,height*0.28,optionSize);
    circles[2].move(height*0.7,height*0.65,optionSize);
    
    // not visible in that state       
    circles[3].fadeOutCircle();
    circles[3].reset();    
    
    center.setColor(WHITE);    
    center.setImg("cb.png");
    fadeInSet();
    
    final float[][] bPos2 = { {height*0.36, height*0.25, bubbleSize}, 
                           {height*0.5, height*0.12, bubbleSize},
                           {height*0.64, height*0.25, bubbleSize},
                           {height*0.58, height*0.15, bubbleSize},
                           {height*0.42, height*0.15, bubbleSize},                                                                                    
                            };
    
    for (int i=0;i<bubbleAmount;i++) {  
      bubbles[i].setColor(BLUE); 
      bubbles[i].scaleAndMove(bPos2[i][0],bPos2[i][1],bPos2[i][2]);
    }            
    
    fadeInBubbles();    
  }    
  
  public void transformToLogo() {    
    circles[2].stopPulsating(); // for pulsating "join game" in quiz start
    for (int i=0;i<circleAmount;i++) {
      circles[i].fadeInCircle();
      circles[i].move(cPos[i][0],cPos[i][1],cPos[i][2]);           
    }
    for (int i=0;i<bubbleAmount;i++) {  
      if (!bubbles[i].isInOrbit()) bubbles[i].setPosition(bPos[i][0],bPos[i][1]);
      bubbles[i].setColor(WHITE); 
    }    
    thread("removeQuestion");
  }    

  
  private void transformToFourOptions() {
    float imgSize = height*0.1;
    float[][] cs = {{height*0.7,height*0.65,imgSize},
                    {height*0.3,height*0.65,imgSize},
                    {height*0.7,height*0.35,imgSize},
                    {height*0.3,height*0.35,imgSize}                    
                    };                        
    for (int i=0;i<circleAmount;i++) {
      circles[i].fadeInCircle();
      circles[i].move(cs[i][0],cs[i][1],cs[i][2]);      
    }
    getCircleById(3).setColor(WHITE);
    noStroke();
    fadeOutBubbles();    
    for (int i=0;i<bubbleAmount;i++) {  
      bubbles[i].setColor(BLUE); 
    }
  }
  
  public void transformToSpotify(Question q) {
    setupSpotifyCircles(q.getCenter(), q.getQ(), q.getOptions());            
    transformToFourOptions(); 
    spotifyBackButton.showSpotifyButton();  
    thread("showQuestion");
  }
  
  public Circle getSpotifyBackButton() {
    return spotifyBackButton;
  }
  
  // HELPER FOR TRANSFORM TO SPOTIFY: Sets images on the circles with pictures
  public void setupSpotifyCircles(String centerUrl, String centerText, List<Option> options) {    
    bg.setImg("spotify.png");    
    center.setImg("spot-play.png");    
    for (int i=0;i<options.size();i++) {
      Option o = options.get(i);
      o.updateCircle();
      if (o != null) {        
        circles[o.getId()].setTextOnly(o.getText());
        circles[o.getId()].fadeIn();        
      }
    }  
  }
  
  public void transformToQuizStart(Question q) {
    fadeInPlayerIcons();
    setupGameCircles(q.getBg(), q.getCenter(), q.getQ(), q.getOptions());                 
    
    circles[0].move(height*0.25,height*0.35,height*0.07);
      circles[3].move(height*0.25,height*0.35,height*0.07); // hidden
    circles[1].move(height*0.75,height*0.35,height*0.07);
    circles[2].move(height*0.5,height*0.55,height*0.09);
    circles[2].startPulsating();
    
    
    // not visible in that state       
    circles[3].fadeOutCircle();
    circles[3].reset();    
    
    center.setColor(WHITE);    
    fadeInSet();        
       
    thread("showQuestion");
  }
  
  public void transformToQuestion(Question q) {    
    circles[2].stopPulsating(); // for pulsating "join game" in quiz start
    fadeOutPlayerIcons();
    setupGameCircles(q.getBg(), q.getCenter(), q.getQ(), q.getOptions());            
    transformToFourOptions();
       
    thread("showQuestion");    
  }  
  
  // HELPER FOR TRANSFORM TO QUESTION: Sets images on the circles with pictures
  public void setupGameCircles(String bgUrl, String centerUrl, String centerText, List<Option> options) {        
    bg.setImg(bgUrl);    
    center.setImg(centerUrl);
    center.setTextOnly(centerText);    
    for (int i=0;i<options.size();i++) {
      Option o = options.get(i);
      if (o != null) {
        circles[o.getId()].setImg(o.getImgUrl());
        //circles[o.getId()].setText(o.getText());
      }      
    }      
  }
  
  public void transformToPong() {
    float fade = 80;    
    center.scaleR(centerR/4);
    center.setTextOnly("TILBAGE");
    center.fadeCircleTo(fade);
    for (int i=0; i<circleAmount; i++) {
      if (i != 3) {
        circles[i].scaleR(optionSize/4);
        circles[i].fadeCircleTo(0);
      }
    }
  }
  
  public void growToStart() {
    float fade = 80;
    center.setTextOnly("");
    center.scaleR(centerR);
    center.fadeCircleTo(255);
    for (int i=0; i<circleAmount; i++) {
      if (i != 3) {
        circles[i].scaleRUp(optionSize);
        circles[i].fadeCircleTo(255);
      }
    }  
  }
  
  public void showSpotifyChoice(Option o) {
    center.setTextOnly("I VALGTE:\n"+o.getText());
  }
  
  public void showWinnerOption(Option o) {    
    center.setImgOnly(o.getImgUrl());    
  }
  
  public void winnerCountdown() {
    center.setTextOnly("OG VINDEREN ER...");
    center.fadeIn();
  }
  
  public void showWinner(Player p) {
    if (p == null) {
      center.setTextOnly("INGEN VINDER");
    } else {
      String playerColor = p.getCoaster().getColor().getName();
      int[] cs = p.getCoaster().getColor().getRGB();
      center.setColor(color(cs[0],cs[1],cs[2]));
      String winnerText = "" + playerColor + "\n" + "Hop i baren og indkasser din rabat! Du er for awesome!";    
      center.setTextOnly(winnerText);
      center.fadeIn();
      println(winnerText);      
    }    
  }
  
  
  /*******************************************************/
  /******************** FADE IN / OUT ********************/
  /*******************************************************/
    
  public void fadeInBubbles() {
    for (int i=0;i<bubbleAmount;i++) {  
      bubbles[i].fadeIn(); 
    }
  }
  
  public void fadeOutBubbles() {
    for (int i=0;i<bubbleAmount;i++) {  
        bubbles[i].fadeOut(); 
    }
  }    
  
  /* fades in a set of images and a text in the middle */
  public void fadeInSet() {    
    bg.fadeIn();        
    center.fadeIn();
    for (int i=0;i<circleAmount;i++) {
      circles[i].fadeIn();
    }
  }
  
  public void fadeOutSet() {    
    bg.fadeOut();   
    center.fadeOut();    
    for (int i=0;i<circleAmount;i++) {
      circles[i].fadeOut();
    }
  }
 
  
  /*******************************************************/
  /**************** SETTERS / GETTERS ********************/
  /*******************************************************/  
  
  public Circle getCenter() {
    return center;
  }
  
  public Bubble getBubble(int id) {
    return bubbles[id];
  }
  
  public Circle getCircleById(int id) {
    for (Circle circle : circles) {
      if (circle.getId() == id) return circle;      
    }
    return null;
  }
  
  public List<Circle> getOptionCircles() {    
    return Arrays.asList(circles);
  }
  
  public List<Bubble> getAllBubbles() {    
    return Arrays.asList(bubbles);
  }
  
  public void resetCircles() {
    bg.reset();
    center.reset();
    for (int i=0;i<circleAmount;i++) {        
      circles[i].reset();      
    }    
  }  
  
  /* Set the text dynamically in the center circle */
  public void setCenterText(String t) {
    center.setText(t);
  }
  
  public void setCenterImg(String url) {
    center.setImg(url);
  } 
  
  public void setPlayerIcon(int sesid, String imgUrl, Color theColor) {
    playerIcons[sesid] = loadImage(imgUrl);
    voteAnimations.add(new VoteAnimation(40, theColor, height/2.7 + 50*sesid, height/2.5));   
  }
  
}
