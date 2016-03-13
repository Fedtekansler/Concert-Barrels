class Circle {
  float x, y;
  float radius;
  //float pFactor; // the point factor regulating the option circles' radius
  color cc;  
  PImage img;
  //boolean on; // for turning on image  
  int alphaValue = 0; //Alpha and Ani are used to fade in and out
  int circleAlpha = 255; // for circles  
  String q;  
  int id;
  boolean showImg;  
  boolean showText;
  List<Coaster> votes;
  int textSize;
  ArrayList<VoteAnimation> voteAnimations = new ArrayList<VoteAnimation>();
  color textColor = BLACK;
  float tempRadius = 0;
  boolean pulsating = false;

  public Circle(float x, float y, float radius, color ccolor) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.cc = ccolor;        
    this.q = "";       
    this.showImg = false; 
    this.showText = false;    
    votes = new ArrayList<Coaster>();
    textSize = FONT_SIZE1;    
  }    
  
  /***************************************************/
  /************** VIEW RELATED METHODS ***************/
  /***************************************************/
    
  public void startPulsating() {         
    pulsating = true;
    radius = radius - 20;
    pulsate();    
  }
  
  public void pulsate() {
    tempRadius = radius;
    Ani pulsAni = new Ani(this, 0.5, "radius", tempRadius-10, AniConstants.LINEAR, "onEnd:resetRadius");
    pulsAni.seek(0);
    pulsAni.resume();      
  }
  
  public void resetRadius() {
    radius = tempRadius;
    if (pulsating) pulsate();
  }
  
  public void stopPulsating() {
    pulsating = false;
  }
  
  public void hideSpotifyButton() {
    circleAlpha = 0;
    alphaValue = 0;
  }
  
 public void showSpotifyButton() {
    circleAlpha = 200;
    alphaValue = 200;
  }

  void draw() {      
    if (radius < 100) textSize = FONT_SIZE3;      
    noStroke();
    fill(cc,circleAlpha);
    float diameter = radius*2;
    //if (quizMode) diameter = diameter * pFactor; // if question is on, show special circle sizes
    ellipse(x, y, diameter, diameter);

    if (showImg) imgTexture();

    // in order to write text on circle
      
    if (radius < 100) {
      //textColor = BLACK;
      fill(textColor, alphaValue);
    } else {    
      if (showText) {            
        fill(textColor, alphaValue);
      } else {
        fill(textColor, 255-alphaValue);
      }  
    }
    // don't mind these weird "hacker" special cases
    if (showText) {        
      textSize(textSize); // to always fit circle
      textAlign(CENTER,TOP);
      text(q, x-radius, y-radius/4, radius*2, radius*2);
    }
    for(VoteAnimation vA : voteAnimations) {
      if(vA.doneAnimating()) {
        vA=null;
      } else {
        vA.drawAnimation();
      }
    }
    drawVotes();
  }

  void move(float newx, float newy, float newr) {    
    Ani.to(this, 1.0f, "x", newx, Ani.SINE_IN);
    Ani.to(this, 1.0f, "y", newy, Ani.SINE_IN);
    Ani.to(this, 1.0f, "radius", newr, Ani.SINE_IN);
  }

  void move(float newx, float newy) {
    move(newx, newy, radius);
  }    

  void imgTexture() {
    smooth();
    textureMode(NORMAL);    
    int numParts = 80; 

    pushMatrix();
    translate(x, y);
    beginShape();
    texture(img);
    tint(255, alphaValue);
    float theta = TWO_PI / numParts;
    for (int i=0; i<numParts; i++) {
      float angle = theta * i;
      float dx = cos(angle);
      float dy = sin(angle);
      float theX = dx * (radius-2);
      float theY = dy * (radius-2);
      
      vertex(theX, theY, (dx+1)/2, (dy+1)/2);
    }
    endShape();
    popMatrix();
  }  

  /* For circle images */
  public void fadeIn() {
    //showImg = true;
    Ani fadeInAni = new Ani(this, 4, "alphaValue", 255);
    fadeInAni.seek(0);
    fadeInAni.resume();
  }

  /* For circle images */
  public void fadeOut() {    
    //showImg = false;
    Ani fadeOutAni = new Ani(this, 4, "alphaValue", 0);
    fadeOutAni.seek(0);
    fadeOutAni.resume();
  }    
  
  /* For circle */
  public void fadeInCircle() {
    //showCircle = true;
    Ani fadeInAni = new Ani(this, 4, "circleAlpha", 255);
    fadeInAni.seek(0);
    fadeInAni.resume();
  }

  /* For circle */
  public void fadeOutCircle() {    
    //showImg = false;
    Ani fadeOutAni = new Ani(this, 4, "circleAlpha", 0);
    fadeOutAni.seek(0);
    fadeOutAni.resume();
  }
  
  /* For circle fading only a certain degree */
  public void fadeCircleTo(float v) {    
    Ani fadeAni = new Ani(this, 4, "circleAlpha", v);
    fadeAni.seek(0);
    fadeAni.resume();
    Ani fadeImgAni = new Ani(this, 4, "alphaValue", v);
    fadeImgAni.seek(0);
    fadeImgAni.resume();
  }
  
  public void scaleR(float r) {
    Ani scaleAni = new Ani(this, 1.5, "radius", r);    
    scaleAni.seek(0);
    scaleAni.resume();    
  }
  
  public void scaleRUp(float r) {
    Ani scaleAni = new Ani(this, 1.5, "radius", r, AniConstants.LINEAR, "onEnd:goToStartState");    
    scaleAni.seek(0);
    scaleAni.resume();    
  }
 
  public void goToStartState() {
    m.setGame(new ChooseGame(v,m));        
  }
  
  /***************************************************/
  /************** OVERRIDES **************************/
  /***************************************************/

  public boolean equals(Object o) {
    Circle c = (Circle)o;
    return this.id == c.getId();
  }
  
  public String toString() {
    if (id == CENTER_ID) return "CENTER";
    return "Circle #" + id;
  }
  
  
  /***************************************************/
  /******************* VOTE RINGS ********************/
  /***************************************************/
  
  public void drawVotes() {
    if (votes.size() > 0) {
      for (int i = 0; i<votes.size(); i++) {
        Coaster coaster = votes.get(i);
        int[] rgb = coaster.getColor().getRGB();
        stroke(rgb[0], rgb[1], rgb[2], alphaValue);
        strokeWeight(5);
        noFill();
        ellipse(x, y, (radius*2)+15 + i*14, (radius*2)+15 + i*14);
      }            
    }
  }
  
  public void removeVotes() {
    votes = new ArrayList<Coaster>();
  }
  
  public void addVote(Coaster coaster) { 
    voteAnimations.add(new VoteAnimation(radius, coaster, x ,y));   
    votes.add(coaster);
  }
  
  public void addVotes(List<Coaster> coasters) { 
    for (Coaster coaster : coasters) {
      voteAnimations.add(new VoteAnimation(radius, coaster, x ,y));
    }   
    votes.addAll(coasters);
  }
  
  public void removeVote(Coaster coaster) {
    votes.remove(coaster);
  }
    
  
  /***************************************************/
  /************** GETTERS AND SETTERS ****************/
  /***************************************************/
  
  public void reset() {
    q = "";
    img = null;
    removeVotes();
  }  
  
  public List<Coaster> getVotes() {
    return votes;
  }  
  
  public void setTextSize(int size) {
    textSize = size;
  }
  
  public int getId() {
    return id;
  }
  public void setId(int id) {
    this.id = id;
  }

  public float getX() {
    return x;
  }
  public float getY() {
    return y;
  }
  public float getR() {
    return radius;
  }    
  
  public void setColor(color ccolor) {
    this.cc= ccolor;
  } 
  public void showText() {
    showText = true;
  }
  
  public void hideText() {
    showText = false;
  }

  public void setImg(String url) {
    if (url == "") {
      showImg = false;
    } else {
      showImg = true;
      this.img = loadImage(url);
      showText = false;    
    }    
  }  
  
  public void setImgOnly(String url) {
    this.img = loadImage(url);
    showText = false;
    showImg = true;
  }
  
  public void setTextOnly(String txt) {
   this.q = txt;
   showText = true;
   showImg = false; 
  }
    
  public void setText(String q) {
    showText = true;
    this.q = q;
  }

  public void setTextColor(color c) {
    textColor = c;
  }  
  
  public String getText() {
    return q;
  }
}

