/**
* This class repressent the bubbles pressent at start. Theese will fly out to coasters when placed.
*/


class Bubble {
  float radius;
  PVector point, target, movement, bounceVector, realPosition;
  float orbitAngle = 0;
  float orbitSpeed = TWO_PI/360.0;
  boolean bubbleOrbit = false;
  Coaster coaster;
  int alphaValue = 255;
  color ccolor;
  
  public Bubble(float x, float y, float radius) {
    point = new PVector(x, y);
    realPosition = new PVector(x,y);
    target = new PVector(x, y);
    movement = new PVector(0,0);
    this.radius = radius;
    ccolor = #FFFFFF;
  }
  
  public void scaleAndMove(float x, float y, float radius) {
    point.x = x;
    point.y = y;
    this.radius = radius;
  }
  
  public void setColor(color c) {
    ccolor = c;
  }
  
  public void draw() {
    pushMatrix();
    if(coaster!=null) {
      coaster = coaster.coasterToOrbit(this);
      if(!coaster.isVisible()) {
        bubbleOrbit(false);
        coaster = null;
      }
    }
    move();
    handleOrbit();    
    fill(ccolor, alphaValue);
    strokeWeight(1);
    noStroke();
    /*if (bubbleOrbit) */
    if (ccolor != WHITE) lights();    
    sphere(this.radius);
    noLights();
    stroke(50);
    popMatrix();
  }
  
  //Helper method, handles wether or not to orbit a coaster.
  private void handleOrbit() {
    if(bubbleOrbit) {
      movement.x = 0;
      movement.y = 0;
      orbitAngle += orbitSpeed*10;
      if(orbitAngle == TWO_PI)
      {
        orbitAngle = 0;
      }
      movement.y = (int)(sin(orbitAngle)*(((radio*3))/2));
      movement.x = (int)(cos(orbitAngle)*(((radio*3))/2));
      point.x += movement.x;
      point.y += movement.y;
      translate(point.x, point.y , 0); 
    } else {
      handleCollision();
      translate(point.x, point.y , 0); 
    }
  }
  
  //Helper method, handles the bouncing of the walls, and moving around when not orbiting
  private void handleCollision() {
    //We create a vector, we can use to check if we are at the wall.
    bounceVector = new PVector(height/2 - point.x, height/2 - point.y);
    //If we are at the wall, we should do the trick of bouncing
    if(bounceVector.mag() > sqrt((height/2 - this.radius) * (height/2 - this.radius))) {
      //We normalize the vector, and project it to our movement vector
      bounceVector.normalize();
      float projection = movement.x * bounceVector.x + movement.y * bounceVector.y;
      //We subtract the projection from movement vector
      movement.x = -(projection * bounceVector.x);
      movement.y = -(projection * bounceVector.y);
      bounceVector = new PVector(height/2 - point.x, height/2 - point.y);      
      while(bounceVector.mag() > sqrt((height/2 - this.radius) * (height/2 - this.radius))) {
        point.x += movement.x;
        point.y += movement.y;
        bounceVector = new PVector(height/2 - point.x, height/2 - point.y);
      }
    } else {
      point.x += movement.x;
      point.y += movement.y;
    }
  }
  
  public void move() {
    if(coaster != null) {
      point.x = coaster.getX();
      point.y = coaster.getY();
    }
  }
  
  public void setPosition(float x, float y) {
    point.x = x;
    point.y = y;
  }
  
  public void chooseCoaster(Coaster c) {
    coaster = c;
  }
  
  public float getX() {
    return point.x;
  }

  public float getY() {
    return point.y;
  }
  
  public float getR() {
   return radius; 
  }
  
  public void setStartAngle(float coasterX, float coasterY) {
    PVector angleVector = new PVector(point.x - coasterX, point.y - coasterY);
    PVector zeroAngle = new PVector(1,0);
    float angle = PVector.angleBetween(angleVector, zeroAngle);
    orbitAngle = (TWO_PI/360)*degrees(angle);
    if(coasterY > point.y) {
      orbitAngle += (TWO_PI)-2*angle;
    }
  }
  
  public void bubbleOrbit(boolean b) {
    //This is a hack to give the ball the right position when it stop orbit
    if(b == false) {
      
      movement.y = (int)(sin(orbitAngle)*(((radio*3))/2))/5;
      movement.x = (int)(cos(orbitAngle)*(((radio*3))/2))/5;
    }
    //We set wether or not bubbleOrbit is true or false
    bubbleOrbit = b;
  }
  
  public boolean isInOrbit() {
    return bubbleOrbit;
  }
  
  public void fadeIn() {
    Ani fadeInAni = new Ani(this, 4, "alphaValue", 255);
    fadeInAni.seek(0);
    fadeInAni.resume();
  }

  public void fadeOut() {    
    Ani fadeOutAni = new Ani(this, 4, "alphaValue", 0);
    fadeOutAni.seek(0);
    fadeOutAni.resume();
  }
 
}  
