public class SpotifyAnnouncer extends Thread {
  int startTime;
  Model m;

  public SpotifyAnnouncer(Model m) {
    this.m = m;
    this.startTime = millis() / 1000;
  }

  // START SPOTIFY TIMER, AND AFTER 1 MINUTE RESULT IS SHOWN AT BAR                  
  public void run() {    
    int secsLeft = 0;
    while (secsLeft < 15) {    
      secsLeft = millis() / 1000 - startTime;    
      try {
        this.sleep(1000);
      } 
      catch(Exception e) {
      }
      println("Counts: " + secsLeft);
    }
    m.announceSpotifyWinner();
  }
}

