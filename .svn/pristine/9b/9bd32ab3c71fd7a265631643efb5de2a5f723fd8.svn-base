/**
 * This class is used to Send messages to the bar
 * When a winner in spotify is chosen a message will be send thorugh this.
 * ATM it broadcasts, that might not be the best solution.
 */
public class SpotifySender {

  protected DatagramSocket socket = null;

  public void broadcast(String winner) {
    // open socket
    try {
      socket = new DatagramSocket(4445);
    } 
    catch (Exception e) {
      println("Could not create server");
    }

    // send message
    try {
      // Prepare message
      byte[] buf = new byte[512];
      String dString = winner + ",nothingHere";
      buf = dString.getBytes();
      // send message to the listening clients
      InetAddress group = InetAddress.getByName("239.255.100.100");
      DatagramPacket packet;
      packet = new DatagramPacket(buf, buf.length, group, 4466);
      socket.send(packet);
    } 
    catch (IOException e) {
      e.printStackTrace();
    }

    // close socket
    socket.close();
  }
}

