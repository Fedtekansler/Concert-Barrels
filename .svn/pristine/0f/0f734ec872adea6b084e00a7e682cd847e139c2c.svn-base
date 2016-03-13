/**
 * This class is used to Send messages to other barrels
 * When events happen that other should know about this class should be used
 */
public class MessageSender {

  protected DatagramSocket socket = null;

  public void broadcast(int who, int what) {
    println("SENDING A MESSAGE: " + who + "," + what);
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
      String dString = who + "," + what;
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
  
  
  public void sendSpotifyMessage(String winner) {
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
      String dString = winner + ",spotifyMessage";
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

