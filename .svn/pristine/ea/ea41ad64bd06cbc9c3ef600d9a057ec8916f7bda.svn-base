/**
 * This class is used to receive all the data that other barrels are sending
 * It should also handle the received data and call the right methods
 */
public class MessageReceiver extends Thread {
  MulticastSocket socket = null;
  InetAddress group = null;  
  boolean listening = true;
  View v;
  Model m;

  public MessageReceiver(View v, Model m) {
    // get a datagram socket
    try {
      socket = new MulticastSocket(4466);
    } 
    catch (Exception e) {
      println("Could not create client socket");
    } 
    try {
      group = InetAddress.getByName("239.255.100.100");
    } 
    catch (Exception e) {
      println("Could not create client group");
    } 
    try {
      socket.joinGroup(group);
    } 
    catch (Exception e) {
      println("Could not join client group");
    }
    
    this.v = v;
    this.m = m;
  }

  public void run () {
    // send request
    while (listening) {
      try {
        DatagramPacket packet;
        byte[] buf = new byte[512];
        packet = new DatagramPacket(buf, buf.length);
        socket.receive(packet);   
        println("Received");
        String received = new String(packet.getData()).trim();
        int splitPoint1 = received.indexOf(",");
        
        //if this is a spotify winner message ignore it
        if(received.substring(splitPoint1 + 1, received.length()).equals("spotifyMessage")) {
          println("A spotify message was send to bar");
          continue;
        }       
       
        //if this is a message from bar to change song handle it.
        if(received.substring(splitPoint1 + 1, received.length()).equals("nextSpotifyQuestion")) {
          println("Got a call from bar to change spotify vote to new song");
          Spotify s = (Spotify)m.getSpotifyGame();
          println(s);
          s.announceWinner();
          s.barCallStart(m.getGame());
          //s.nextQuestion();
          continue;
        }    
        
        int who = new Integer(received.substring(0, splitPoint1));
        int what = new Integer(received.substring(splitPoint1 + 1, received.length()))  ;

        // pass result to controller
        if (what == 1000) {
          println("Player added");
          //spotifyController.add(who); // if magic number is 1000 it is an ADD broadcast
        }  else {
          spotifyController.choose(who, what); // for CHOICE broadcasts
          println("player chose");
        }
      } 
      catch (Exception e) {
        e.printStackTrace();
        listening = false;
      }
    }
    try {
      socket.leaveGroup(group);
    } 
    catch (Exception e) {
      println("Could not leave group");
    }
    socket.close();
  }
}

