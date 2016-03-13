public class ARemoveThread extends Thread {
  
  private long sesid;
  private int symid;
  
  public ARemoveThread(long id, long symbolId) {
    sesid = id;
    symid = (int)symbolId;
  }
  
  public void run() { 
      try {
        Thread.sleep(80);
      } catch(Exception e) {
        //System.out.println("Failed to sleep");
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
      else {
        //System.out.println("Was just a remove glitch");
      }
      addList.remove(symid);
    }
}
