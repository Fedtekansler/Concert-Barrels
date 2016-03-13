/**
 * This class repressent the graphics at a coaster, when placed on the table
 * An instance should be made every time a beer has been put on the table
 */

class Coaster {
  int i = 0;
  float x;
  float y;
  float z;
  float time;
  float increment;   
  //Alpha and Ani are used to fade in and out
  int alphaValue = 0;
  //Ani fadeAni;
  Color ccolor;
  int symid;  
  int sesid;
  boolean on; // to know when to draw it
  boolean visible; // to know when to react to it in view
  ArrayList<Coaster> intersectingCoasters = new ArrayList<Coaster>();
  String iconUrl;
  
  public Coaster(Color c, int sesid) {
    this.x = 0;
    this.y = 0;
    this.z = 0;    
    time = 0.0;
    increment = 0.01;    
    this.symid = 0;
    this.sesid = sesid;
    this.on = false;
    this.visible = false;
    this.ccolor = c;
    this.iconUrl = "p-" + ccolor.getName() + ".png";
  }

  /*public Coaster(float x, float y, Color c, int symid, int sesid) {    
    this.x = x;
    this.y = y;
    this.z = 0;    
    time = 0.0;
    increment = 0.01;
    ccolor = c;
    this.symid = symid;    
    this.sesid = sesid;
    this.visible = false;
    this.on = false;
  }*/
  
  public String getIcon() {return iconUrl;}
  public Color getColor() {return ccolor;}
  public int getSesId() {return sesid;}
  public int getSymId() {return symid;}
  public void setSymId(int symid) {this.symid = symid; println("Symid " + symid);}
  
  public void show() {
    on = true;
    visible = true;
    fadeIn();
  }
  
  public void hide() {
    visible = false;
    fadeOut();
  }
  
  public boolean isVisible() {
    return visible;
  }

  public void draw() {    
    if (on) {
      //Moves the coaster to the right place and draws it
      pushMatrix();
      translate(x, y, 0); 
      noStroke();
      float n = noise(time)*radio/2;
      time += increment;
      int[] rgb = ccolor.getRGB();
      for (int i = 0; i <= 10; i++) {
        //The second argument is used for the fade-in and -outs        
        fill(rgb[0], rgb[1]+(i*1), rgb[2]+(i*25), (alphaValue-100)+i*10);      
  
        ellipse(0, 0, (radio*3)-(i*n), (radio*3)-(i*n));
      }
      // 0, 144, 255
      stroke(rgb[0], rgb[1], rgb[2], alphaValue);
      strokeWeight(2);
      noFill();
      ellipse(0, 0, (radio*3)+10, (radio*3)+10);
      stroke(50);
      popMatrix();
    }    
  }

  //Method to choose the coaster to orbit
  public Coaster coasterToOrbit(Bubble b) {
    Coaster result = this;
    float current = height;
    for(Coaster c : intersectingCoasters) {
      PVector lengthVector = new PVector(b.getX() - c.getX(), b.getY() - c.getY());
      if (current > lengthVector.mag()) {
        current = lengthVector.mag();
        result = c;
        b.setStartAngle(result.getX(), result.getY());
      }
    }
    return result;
  }

  public void move(float x, float y) {
    this.x = x;
    this.y = y;
  }
  public void setZ(float value) {
    z = value;
  }

  public float getX() {
    return x;
  }
  public float getY() {
    return y;
  }
  public float getZ() {
    return z;
  } 
  
  public float getR() {
    return radio*2.4;
  } 
  
  public void updateIntersectingCoasters(ArrayList<Coaster> list) {
    intersectingCoasters = list;
  }    

  //Below here we have the the two animations, nothing special here

  private void fadeIn() {    
    Ani fadeInAni = new Ani(this, 2, "alphaValue", 220);
    fadeInAni.seek(0);
    fadeInAni.resume();
  }

  private void fadeOut() {    
    Ani fadeOutAni = new Ani(this, 2, "alphaValue", 0);
    fadeOutAni.seek(0);
    fadeOutAni.resume();
  }

  public String toString() {
    return "Coaster " + symid;
  }
 
  public Coaster clone() {
    try {
      return (Coaster)super.clone();
    } catch(Exception e){ return null; }
  }
}

