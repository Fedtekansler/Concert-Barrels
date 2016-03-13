public class AddThread extends Thread {
  
  private long sesid;
  private int symid;
  
  public AddThread(long id, int symid) {
    sesid = id;
    this.symid = symid;
    
  }
  
  public void run() { 
      try {
        Thread.sleep(80);
      } catch(Exception e) {
        System.out.println("Failed to sleep");
      }
      TuioObject tobj = tuioClient.getTuioObject(sesid);
      if(tobj != null){
        //System.out.println("Was good enough and added");
        addAfterFilter(tobj);
      }
      else {
        //System.out.println("Was just an add glitch");
      }
      addList.remove(symid);
      
      try {
        Thread.sleep(1000);
      } catch(Exception e) {
        System.out.println("Failed to sleep");
      }
      Vector v = tuioClient.getTuioObjects();
      boolean isGone = true;
      for(Object o : v) {
        TuioObject t = (TuioObject)o;  
        if(t.getSymbolID() == symid) {
          isGone = false;
        }      
      }
      if(isGone){
        //System.out.println("Was good enough and removed");
        removeAfterFilter(symid);
      }
      }
}
