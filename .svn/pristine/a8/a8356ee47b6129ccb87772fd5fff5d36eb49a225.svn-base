class GameDriver {    
  //int maxSecs;
  //int secsLeft;  
  String info;
  Model m;
  int s;
  boolean isQuiz = false;
  boolean isSpotify = false;
  int start = 0;
  Spotify spotify;

  public GameDriver(Model m) {    
    this.m = m;
  }    

  public void setupGames() {
    System.out.println(":::: GD: Setup game ::::: ");        
    
    setupQuizzes();
    setupQuizzes();
    setupQuizzes();
    setupQuizzes();
    
    spotify = new Spotify(m);
    
    setupSpotify();
    setupSpotify();
    setupSpotify();
    setupSpotify();
    
    m.setSpotify(spotify);
    
    Pong pong = new Pong(m);
    m.setPong(pong);            
  }
  
  
  
  public void setupQuizzes() {
    /***************************************************/
    /************** Set 1 ******************************/
    /***************************************************/
    //Question 1
    final String[] s1q1 = {"3", "2", "4", "5"};
    final String[] s1q1p = {"3.png", "2.png", "4.png", "5.png"}; 
    
    //Question 2
    final String[] s1q2 = {"3", "2", "4", "1"};
    final String[] s1q2p = {"s1q2p1.png", "s1q2p2.png", "s1q2p3.png", "s1q2p4.png"}; 
    
    //Question 3
    final String[] s1q3 = {"Pop", "Rock", "Disco", "Heavy Metal"};
    final String[] s1q3p = {"s1q3p1.jpg", "s1q3p2.jpg", "s1q3p3.jpg", "s1q3p4.jpg"}; 
    
    //Question 4
    final String[] s1q4 = {"Nickelback", "Offspring", "U2", "Seether"};
    final String[] s1q4p = {"s1q4p1.png", "s1q4p2.png", "s1q4p3.jpg", "s1q4p4.jpg"}; 
    
    //Question 5
    final String[] s1q5 = {"3", "2", "4", "5"};
    final String[] s1q5p = {"s1q5p1.jpg", "s1q5p2.jpg", "s1q5p3.png", "s1q5p4.png"}; 
       
    List<Option> s1q1List = new ArrayList<Option>();
    List<Option> s1q2List = new ArrayList<Option>();
    List<Option> s1q3List = new ArrayList<Option>();
    List<Option> s1q4List = new ArrayList<Option>();
    List<Option> s1q5List = new ArrayList<Option>();
    
    /***************************************************/
    /************** Set 2 ******************************/
    /***************************************************/    
        //Question 1
    final String[] s2q1 = {"København", "Paris", "London", "Berlin"};
    final String[] s2q1p = {"s2q1p1.jpg", "s2q1p2.jpg", "s2q1p3.jpg", "s2q1p4.jpg"}; 
    
    //Question 2
    final String[] s2q2 = {"Danmark", "Sverige", "Norge", "Tyskland"};
    final String[] s2q2p = {"s2q2p1.jpg", "s2q2p2.jpg", "s2q2p3.jpg", "s2q2p4.jpg"}; 
    
    //Question 3
    final String[] s2q3 = {"3", "2", "4", "1"};
    final String[] s2q3p = {"3.png", "2.png", "4.png", "1.png"};
    
    //Question 4
    final String[] s2q4 = {"Bil", "Potteplante", "Bænk", "Hund"};
    final String[] s2q4p = {"s2q4p1.jpg", "s2q4p2.jpg", "s2q4p3.jpg", "s2q4p4.jpg"}; 
    
    //Question 5
    final String[] s2q5 = {"Spejl", "Himmel", "Helvede", "Larm"};
    final String[] s2q5p = {"s2q5p1.jpg", "s2q5p2.jpg", "s2q5p3.jpeg", "s2q5p4.jpg"}; 
       
    List<Option> s2q1List = new ArrayList<Option>();
    List<Option> s2q2List = new ArrayList<Option>();
    List<Option> s2q3List = new ArrayList<Option>();
    List<Option> s2q4List = new ArrayList<Option>();
    List<Option> s2q5List = new ArrayList<Option>(); 
    for (int i = 0; i<4; i++) {
      /***************************************************/
      /************** Option Quiz 1 ***********************/
      /***************************************************/      
      Option os1q1 = new Option(s1q1[i], s1q1p[i], v.getOptionCircles().get(i), i);
      s1q1List.add(os1q1);
      Option os1q2 = new Option(s1q2[i], s1q2p[i], v.getOptionCircles().get(i), i);
      s1q2List.add(os1q2);
      Option os1q3 = new Option(s1q3[i], s1q3p[i], v.getOptionCircles().get(i), i);
      s1q3List.add(os1q3);
      Option os1q4 = new Option(s1q4[i], s1q4p[i], v.getOptionCircles().get(i), i);
      s1q4List.add(os1q4);
      Option os1q5 = new Option(s1q5[i], s1q5p[i], v.getOptionCircles().get(i), i);
      s1q5List.add(os1q5);
      
      /***************************************************/
      /************** Option Quiz 2 ***********************/
      /***************************************************/      
      Option os2q1 = new Option(s2q1[i], s2q1p[i], v.getOptionCircles().get(i), i);
      s2q1List.add(os2q1);
      Option os2q2 = new Option(s2q2[i], s2q2p[i], v.getOptionCircles().get(i), i);
      s2q2List.add(os2q2);
      Option os2q3 = new Option(s2q3[i], s2q3p[i], v.getOptionCircles().get(i), i);
      s2q3List.add(os2q3);
      Option os2q4 = new Option(s2q4[i], s2q4p[i], v.getOptionCircles().get(i), i);
      s2q4List.add(os2q4);
      Option os2q5 = new Option(s2q5[i], s2q5p[i], v.getOptionCircles().get(i), i);
      s2q5List.add(os2q5);
    } 
    // Questions of quiz    
    for (int i = 0; i<100; i++) {
      /***************************************************/
      /************** Setup Quiz 1 ***********************/
      /***************************************************/
      Quiz quiz1 = new Quiz(m);       
      Question q1 = new Question("Hvor mange bandmedlemmer er der i Lars and The Hands of Light?", 20, s1q1List.get(3), s1q1List, "lp.png", ""); 
      Question q2 = new Question("Hvem er ikke med i The Killers?", 20, s1q2List.get(3), s1q2List, "lp.png", "");
      Question q3 = new Question("Hvem har flest followers på Spotify?", 20, s1q3List.get(2), s1q3List, "lp.png", "");
      Question q4 = new Question("Radar samarbejder med Aarhus Filmfestival under hvilket navn?", 20, s1q4List.get(0), s1q4List, "lp.png", "");
      Question q5 = new Question("Hvilket online medie gør Radar sig brug af?", 20, s1q5List.get(0), s1q5List, "lp.png", "");    
      quiz1.add(q1);
      quiz1.add(q2);
      quiz1.add(q3);
      quiz1.add(q4);
      quiz1.add(q5);     
      m.addQuiz(quiz1);
      
      /***************************************************/
      /************** Setup Quiz 2 ***********************/
      /***************************************************/
      Quiz quiz2 = new Quiz(m);       
      Question q1s2 = new Question("Hvem er gift med Justin Timberlake?", 20, s2q1List.get(2), s2q1List, "lp.png", ""); 
      Question q2s2 = new Question("Hvem fik blottet sit bryst under en Super Bowl?", 20, s2q2List.get(0), s2q2List, "lp.png", "");
      Question q3s2 = new Question("Hvor mange er i familie i Lars and The Hands of Light?", 20, s2q3List.get(1), s2q3List, "lp.png", "");
      Question q4s2 = new Question("Hvilken sanger har været dommer i X-Factor (US)?", 20, s2q4List.get(3), s2q4List, "lp.png", "");
      Question q5s2 = new Question("Hvilket band har lavet sangen Courage?", 20, s2q5List.get(1), s2q5List, "lp.png", "");    
      quiz2.add(q1s2);
      quiz2.add(q2s2);
      quiz2.add(q3s2);
      quiz2.add(q4s2);
      quiz2.add(q5s2);      
      m.addQuiz(quiz2);      
    }
  }

  
  /***************************************/    
  /********* OPTIONS FOR SPOTIFY *********/
  /***************************************/

  public void setupSpotify() {        
    
    
    
    /* OPTION STRING ARRAYS */
    //final String[] spotOps1 = {"Get Lucky\n(Daft Punk)", "Kids\n(MGMT)", "Jesus Fever\n(Kurt Vile)", "Last Nite\n(The Strokes)"};
    //final String[] spotOps2 = {"ag", "erg", "erg", "agaga"};
    final String[] spotOps1 = {"Mirrors\n(Justin Timberlake)", "Beauty and a Beat\n(Justin Bieber)", "Get Lucky\n(Daft Punk)", "Blurred Lines\n(Robin Thicke)"};
    final String[] spotOps2 = {"Ghost Trains\n(Erlend Oye)", "Hey!\n(Darkness Falls)", "Space For Rent\n(Who Made Who)", "Light Years\n(Peder)"};
    final String[] spotOps3 = {"Pompeii\n(Bastille)", "Only Teardrops\n(Emmelie de Forest)", "United\n(Nik&Jay)", "22\n(Taylor Swift)"};
    final String[] spotOps4 = {"Hope In The Mirror\n(Zoot Woman)", "Loose Yourself To Jenny\n(Kasper Bjørke)", "Bless You\n(Lulu Rouge)", "Min Klub Først\n(Rosa Lux)"};
    final String[] spotOps5 = {"Elephant\n(Mads Langer)", "Die Young\n(Ke$ha)", "Kiss You\n(One Direction)", "Locked Out of Heaven\n(Bruno Mars)"};
    final String[] spotOps6 = {"These Streets\n(Trolle Siebenhaar)", "Terminal One\n(When Saints Go Machine)", "Killer Bee\n(Vinnie Who)", "The King & I\n(Mads Björn)"};
    final String[] spotOps7 = {"Please Don't Say You Love Me\n(Gabrielle Aplin)", "Feel This Moment\n(Pitbul ft. Christina Aguilera)", "We Are Never Ever Getting Back Together\n(Taylor Swift)", "Heart Attack\n(Demi Lovato)"};
    final String[] spotOps8 = {"Goodnight And Go\n(Imogen Heap)", "Broken Hearts\n(Kiss Kiss Kiss)", "Sentimentally Falling\n(The Rumor Said Fire)", "Club Thing\n(Yoav)"};
    final String[] spotOps9 = {"Over Byen\n(Noah)", "What The Hell\n(Avril Lavigne)", "Viva La Vida\n(Coldplay)", "Unfaithful\n(Rihanna)"};
    final String[] spotOps10 = {"Spinning For The Course\n(I got You On Tape)", "Broadway Ukulele\n(Hess is More)", "Essentials\n(The Broken Beats)", "Let's Head Out\n(Figurines)"};
    final String[] spotOps11 = {"Scream & Shout\n(will.i.am ft. Britney Spears)", "Hey Love\n(Quadron)", "When I Was Your Man\n(Bruno Mars)", "Din For Evigt\n(Burhan G)"};
    
    
    /* OPTION LISTS PREPARED */
    List<Option> spotList1 = new ArrayList<Option>();
    List<Option> spotList2 = new ArrayList<Option>();
    List<Option> spotList3 = new ArrayList<Option>();
    List<Option> spotList4 = new ArrayList<Option>();
    List<Option> spotList5 = new ArrayList<Option>();
    List<Option> spotList6 = new ArrayList<Option>();
    List<Option> spotList7 = new ArrayList<Option>();
    List<Option> spotList8 = new ArrayList<Option>();
    List<Option> spotList9 = new ArrayList<Option>();
    List<Option> spotList10 = new ArrayList<Option>();
    List<Option> spotList11 = new ArrayList<Option>();
    
    
    /* ADD OPTION OBJECTS TO LIST */
    for (int i = 0; i<4; i++) {
      Option o1 = new Option(spotOps1[i], "", v.getOptionCircles().get(i), i);
      Option o2 = new Option(spotOps2[i], "", v.getOptionCircles().get(i), i);
      Option o3 = new Option(spotOps3[i], "", v.getOptionCircles().get(i), i);
      Option o4 = new Option(spotOps4[i], "", v.getOptionCircles().get(i), i);
      Option o5 = new Option(spotOps5[i], "", v.getOptionCircles().get(i), i);
      Option o6 = new Option(spotOps6[i], "", v.getOptionCircles().get(i), i);
      Option o7 = new Option(spotOps7[i], "", v.getOptionCircles().get(i), i);
      Option o8 = new Option(spotOps8[i], "", v.getOptionCircles().get(i), i);
      Option o9 = new Option(spotOps9[i], "", v.getOptionCircles().get(i), i);
      Option o10 = new Option(spotOps10[i], "", v.getOptionCircles().get(i), i);
      Option o11 = new Option(spotOps11[i], "", v.getOptionCircles().get(i), i);
      spotList1.add(o1);
      spotList2.add(o2);
      spotList3.add(o3);
      spotList4.add(o4);
      spotList5.add(o5);
      spotList6.add(o6);
      spotList7.add(o7);  
      spotList8.add(o8);  
      spotList9.add(o9);  
      spotList10.add(o10);  
      spotList11.add(o11);  
    }
    
    /* SETUP QUESTIONS AND ADD TO SPOTIFY OBJECT */
    
    String spotInfo = "";
    String spotUrl = "spot-play.png";
    
    for (int i = 0; i<100; i++) {
      Question spotQ1 = new Question(spotInfo, 20, spotList1, "spotify.png", spotUrl);    
      spotify.add(spotQ1);
      Question spotQ2 = new Question(spotInfo, 20, spotList2, "spotify.png", spotUrl);
      spotify.add(spotQ2);
      
      Question spotQ3 = new Question(spotInfo, 20, spotList3, "spotify.png", spotUrl);    
      spotify.add(spotQ3);
      Question spotQ4 = new Question(spotInfo, 20, spotList4, "spotify.png", spotUrl);
      spotify.add(spotQ4);
      Question spotQ5 = new Question(spotInfo, 20, spotList5, "spotify.png", spotUrl);
      spotify.add(spotQ5);
      Question spotQ6 = new Question(spotInfo, 20, spotList6, "spotify.png", spotUrl);
      spotify.add(spotQ6);
      Question spotQ7 = new Question(spotInfo, 20, spotList7, "spotify.png", spotUrl);
      spotify.add(spotQ7);
      Question spotQ8 = new Question(spotInfo, 20, spotList8, "spotify.png", spotUrl);
      spotify.add(spotQ8);
      Question spotQ9 = new Question(spotInfo, 20, spotList9, "spotify.png", spotUrl);
      spotify.add(spotQ9);
      Question spotQ10 = new Question(spotInfo, 20, spotList10, "spotify.png", spotUrl);
      spotify.add(spotQ10);
      Question spotQ11 = new Question(spotInfo, 20, spotList11, "spotify.png", spotUrl);
      spotify.add(spotQ11);
    }
        
  }  
  
  
  
  
    /*******************************************************************************************************************/
    /************** SELVHENTER AFTEN ***********************************************************************************/
    /*******************************************************************************************************************/
  
  
  public void setupQuizzesSelvhenter() {
     /***************************************************/
    /************** Set 1 ******************************/
    /***************************************************/
    //Question 1
    final String[] s1q1 = {"3", "2", "4", "5"};
    final String[] s1q1p = {"3.png", "2.png", "4.png", "5.png"}; 
    
    //Question 2
    final String[] s1q2 = {"Rock", "Punk Rock", "Pop", "Jazz"};
    final String[] s1q2p = {"s1q2p1.jpg", "s1q2p2.jpg", "s1q2p3.jpg", "s1q2p4.jpg"}; 
    
    //Question 3
    final String[] s1q3 = {"Violin", "Saxofon", "Basun", "Fløjte"};
    final String[] s1q3p = {"s1q3p1.jpg", "s1q3p2.jpg", "s1q3p3.jpg", "s1q3p4.png"}; 
    
    //Question 4
    final String[] s1q4 = {"Æbler og pærer", "Hvid Dværg", "Kvalme", "Ude på landet"};
    final String[] s1q4p = {"s1q4p1.jpg", "s1q4p2.jpg", "s1q4p3.jpg", "s1q4p4.jpg"}; 
    
    //Question 5
    final String[] s1q5 = {"3", "2", "4", "5"};
    final String[] s1q5p = {"3.png", "2.png", "4.png", "5.png"}; 
       
    List<Option> s1q1List = new ArrayList<Option>();
    List<Option> s1q2List = new ArrayList<Option>();
    List<Option> s1q3List = new ArrayList<Option>();
    List<Option> s1q4List = new ArrayList<Option>();
    List<Option> s1q5List = new ArrayList<Option>();
    
    /***************************************************/
    /************** Set 2 ******************************/
    /***************************************************/    
        //Question 1
    final String[] s2q1 = {"København", "Paris", "London", "Berlin"};
    final String[] s2q1p = {"s2q1p1.jpg", "s2q1p2.jpg", "s2q1p3.jpg", "s2q1p4.jpg"}; 
    
    //Question 2
    final String[] s2q2 = {"Danmark", "Sverige", "Norge", "Tyskland"};
    final String[] s2q2p = {"s2q2p1.gif", "s2q2p2.jpg", "s2q2p3.jpg", "s2q2p4.png"}; 
    
    //Question 3
    final String[] s2q3 = {"3", "2", "4", "1"};
    final String[] s2q3p = {"3.png", "2.png", "4.png", "1.png"};
    
    //Question 4
    final String[] s2q4 = {"Bil", "Potteplante", "Bænk", "Hund"};
    final String[] s2q4p = {"s2q4p1.jpg", "s2q4p2.jpg", "s2q4p3.jpg", "s2q4p4.jpg"}; 
    
    //Question 5
    final String[] s2q5 = {"Spejl", "Himmel", "Helvede", "Larm"};
    final String[] s2q5p = {"s2q5p1.jpg", "s2q5p2.jpg", "s2q5p3.jpg", "s2q5p4.jpg"}; 
       
    List<Option> s2q1List = new ArrayList<Option>();
    List<Option> s2q2List = new ArrayList<Option>();
    List<Option> s2q3List = new ArrayList<Option>();
    List<Option> s2q4List = new ArrayList<Option>();
    List<Option> s2q5List = new ArrayList<Option>();
    
    /***************************************************/
    /************** Set 3 ******************************/
    /***************************************************/    
        //Question 1
    final String[] s3q1 = {"Roskilde", "Skive", "Skanderborg", "Northside"};
    final String[] s3q1p = {"s3q1p1.jpg", "s3q1p2.jpg", "s3q1p3.jpg", "s3q1p4.jpg"}; 
    
    //Question 2
    final String[] s3q2 = {"Køkken", "Badeværelse", "Værelse", "Stue"};
    final String[] s3q2p = {"s3q2p1.jpg", "s3q2p2.jpg", "s3q2p3.jpg", "s3q2p4.jpg"}; 
    
    //Question 3
    final String[] s3q3 = {"3", "2", "4", "1"};
    final String[] s3q3p = {"3.png", "2.png", "4.png", "1.png"};
    
    //Question 4
    final String[] s3q4 = {"Afrika", "Asien", "Sydamerika", "Nordamerika"};
    final String[] s3q4p = {"s3q4p1.jpg", "s3q4p2.jpg", "s3q4p3.jpg", "s3q4p4.jpg"}; 
    
    //Question 5
    final String[] s3q5 = {"Sort", "Grøn", "Rød", "Gul"};
    final String[] s3q5p = {"s3q5p1.jpg", "s3q5p2.jpg", "s3q5p3.jpg", "s3q5p4.jpg"}; 
       
    List<Option> s3q1List = new ArrayList<Option>();
    List<Option> s3q2List = new ArrayList<Option>();
    List<Option> s3q3List = new ArrayList<Option>();
    List<Option> s3q4List = new ArrayList<Option>();
    List<Option> s3q5List = new ArrayList<Option>();    
    
    /***************************************************/
    /************** Set 4 ******************************/
    /***************************************************/    
        //Question 1
    final String[] s4q1 = {"Chicks", "Agnes Obel", "The Ravonettes", "Choir of Young Believers"};
    final String[] s4q1p = {"s4q1p1.jpg", "s4q1p2.jpg", "s4q1p3.jpg", "s4q1p4.jpg"}; 
    
    //Question 2
    final String[] s4q2 = {"Radar Skærm", "Radar REC", "Real", "8220"};
    final String[] s4q2p = {"s4q2p1.png", "s4q2p2.png", "s4q2p3.jpg", "s4q2p4.jpg"}; 
    
    //Question 3
    final String[] s4q3 = {"Youtube", "Twitter", "LinkedIn", "Dailymotion"};
    final String[] s4q3p = {"s4q3p1.jpg", "s4q3p2.jpg", "s4q3p3.png", "s4q3p4.png"};
    
    //Question 4
    final String[] s4q4 = {"Torsdag", "Lørdag", "Fredag", "Søndag"};
    final String[] s4q4p = {"s4q4p1.jpg", "s4q4p2.jpg", "s4q4p3.jpg", "s4q4p4.jpg"}; 
    
    //Question 5
    final String[] s4q5 = {"Fona", "Blockbuster", "Stereo Studio", "Føtex"};
    final String[] s4q5p = {"s4q5p1.jpg", "s4q5p2.jpg", "s4q5p3.jpg", "s4q5p4.jpg"}; 
       
    List<Option> s4q1List = new ArrayList<Option>();
    List<Option> s4q2List = new ArrayList<Option>();
    List<Option> s4q3List = new ArrayList<Option>();
    List<Option> s4q4List = new ArrayList<Option>();
    List<Option> s4q5List = new ArrayList<Option>();        
    for (int i = 0; i<4; i++) {
      /***************************************************/
      /************** Option Quiz 1 ***********************/
      /***************************************************/      
      Option os1q1 = new Option(s1q1[i], s1q1p[i], v.getOptionCircles().get(i), i);
      s1q1List.add(os1q1);
      Option os1q2 = new Option(s1q2[i], s1q2p[i], v.getOptionCircles().get(i), i);
      s1q2List.add(os1q2);
      Option os1q3 = new Option(s1q3[i], s1q3p[i], v.getOptionCircles().get(i), i);
      s1q3List.add(os1q3);
      Option os1q4 = new Option(s1q4[i], s1q4p[i], v.getOptionCircles().get(i), i);
      s1q4List.add(os1q4);
      Option os1q5 = new Option(s1q5[i], s1q5p[i], v.getOptionCircles().get(i), i);
      s1q5List.add(os1q5);
      
      /***************************************************/
      /************** Option Quiz 2 ***********************/
      /***************************************************/      
      Option os2q1 = new Option(s2q1[i], s2q1p[i], v.getOptionCircles().get(i), i);
      s2q1List.add(os2q1);
      Option os2q2 = new Option(s2q2[i], s2q2p[i], v.getOptionCircles().get(i), i);
      s2q2List.add(os2q2);
      Option os2q3 = new Option(s2q3[i], s2q3p[i], v.getOptionCircles().get(i), i);
      s2q3List.add(os2q3);
      Option os2q4 = new Option(s2q4[i], s2q4p[i], v.getOptionCircles().get(i), i);
      s2q4List.add(os2q4);
      Option os2q5 = new Option(s2q5[i], s2q5p[i], v.getOptionCircles().get(i), i);
      s2q5List.add(os2q5);
      
      /***************************************************/
      /************** Option Quiz 3 ***********************/
      /***************************************************/      
      Option os3q1 = new Option(s3q1[i], s3q1p[i], v.getOptionCircles().get(i), i);
      s3q1List.add(os3q1);
      Option os3q2 = new Option(s3q2[i], s3q2p[i], v.getOptionCircles().get(i), i);
      s3q2List.add(os3q2);
      Option os3q3 = new Option(s3q3[i], s3q3p[i], v.getOptionCircles().get(i), i);
      s3q3List.add(os3q3);
      Option os3q4 = new Option(s3q4[i], s3q4p[i], v.getOptionCircles().get(i), i);
      s3q4List.add(os3q4);
      Option os3q5 = new Option(s3q5[i], s3q5p[i], v.getOptionCircles().get(i), i);
      s3q5List.add(os3q5);     

      /***************************************************/
      /************** Option Quiz 4 ***********************/
      /***************************************************/      
      Option os4q1 = new Option(s4q1[i], s4q1p[i], v.getOptionCircles().get(i), i);
      s4q1List.add(os4q1);
      Option os4q2 = new Option(s4q2[i], s4q2p[i], v.getOptionCircles().get(i), i);
      s4q2List.add(os4q2);
      Option os4q3 = new Option(s4q3[i], s4q3p[i], v.getOptionCircles().get(i), i);
      s4q3List.add(os4q3);
      Option os4q4 = new Option(s4q4[i], s4q4p[i], v.getOptionCircles().get(i), i);
      s4q4List.add(os4q4);
      Option os4q5 = new Option(s4q5[i], s4q5p[i], v.getOptionCircles().get(i), i);
      s4q5List.add(os4q5);         
    }
    
    // Questions of quiz    
    for (int i = 0; i<10; i++) {
      /***************************************************/
      /************** Setup Quiz 1 ***********************/
      /***************************************************/
      Quiz quiz1 = new Quiz(m);       
      Question q1 = new Question("Hvor mange bandmedlemmer er der i Selvhenter?", 20, s1q1List.get(3), s1q1List, "lp.png", ""); 
      Question q2 = new Question("Hvilken genre er Selvhenter blandt andet inspireret af?", 20, s1q2List.get(0), s1q2List, "lp.png", "");
      Question q3 = new Question("Hvilket instrument spiller Selvhenter ikke?", 20, s1q3List.get(3), s1q3List, "lp.png", "");
      Question q4 = new Question("Hvilken sang af Selvhenter er mest populær på Spotify?", 20, s1q4List.get(0), s1q4List, "lp.png", "");
      Question q5 = new Question("Hvor mange kvinder er det i Selvhenter?", 20, s1q5List.get(3), s1q5List, "lp.png", "");    
      quiz1.add(q1);
      quiz1.add(q2);
      quiz1.add(q3);
      quiz1.add(q4);
      quiz1.add(q5);      
      m.addQuiz(quiz1);
      
      /***************************************************/
      /************** Setup Quiz 2 ***********************/
      /***************************************************/
      Quiz quiz2 = new Quiz(m);       
      Question q1s2 = new Question("Hvor hører Selvhenters bookere til?", 20, s2q1List.get(3), s2q1List, "lp.png", ""); 
      Question q2s2 = new Question("Hvilket land er Selvhenter fra?", 20, s2q2List.get(0), s2q2List, "lp.png", "");
      Question q3s2 = new Question("Hvor mange i Selvhenter spiller trommer?", 20, s2q3List.get(1), s2q3List, "lp.png", "");
      Question q4s2 = new Question("Hvad er i baggrunden af Selvhenters albumcover?", 20, s2q4List.get(1), s2q4List, "lp.png", "");
      Question q5s2 = new Question("Hvad er i beskrivelsen af Zerka Lox Quito af Radar?", 20, s2q5List.get(0), s2q5List, "lp.png", "");    
      quiz2.add(q1s2);
      quiz2.add(q2s2);
      quiz2.add(q3s2);
      quiz2.add(q4s2);
      quiz2.add(q5s2);      
      m.addQuiz(quiz2);      
      
      /***************************************************/
      /************** Setup Quiz 3 ***********************/
      /***************************************************/
      Quiz quiz3 = new Quiz(m);       
      Question q1s3 = new Question("Hvilken festival har Selvhenter spillet på før?", 20, s3q1List.get(0), s3q1List, "lp.png", ""); 
      Question q2s3 = new Question("Hvilket rum indgår i navnet på Selvhenters hjemmeside?", 20, s3q2List.get(0), s3q2List, "lp.png", "");
      Question q3s3 = new Question("Hvor mange album har Selvhenter udgivet?", 20, s3q3List.get(3), s3q3List, "lp.png", "");
      Question q4s3 = new Question("Hvilken verdensdel har Selvhenter også optrådt?", 20, s3q4List.get(1), s3q4List, "lp.png", "");
      Question q5s3 = new Question("Hvilken farve er blikfang på Selvhenters albumcover?", 20, s3q5List.get(1), s3q5List, "lp.png", "");    
      quiz3.add(q1s3);
      quiz3.add(q2s3);
      quiz3.add(q3s3);
      quiz3.add(q4s3);
      quiz3.add(q5s3);      
      m.addQuiz(quiz3); 

      /***************************************************/
      /************** Setup Quiz 4 ***********************/
      /***************************************************/
      Quiz quiz4 = new Quiz(m);       
      Question q1s4 = new Question("Sonja Labianca er associeret med hvilket band?", 20, s4q1List.get(3), s4q1List, "lp.png", ""); 
      Question q2s4 = new Question("Radar samarbejder med Aarhus Filmfestival under hvilket navn?", 20, s4q2List.get(0), s4q2List, "lp.png", "");
      Question q3s4 = new Question("Hvilke af disse online medier bruger Radar?", 20, s4q3List.get(0), s4q3List, "lp.png", "");
      Question q4s4 = new Question("Hvornår er der igen koncert på Radar?", 20, s4q4List.get(2), s4q4List, "lp.png", "");
      Question q5s4 = new Question("Hvilken forretning sælger også billetter til Radar?", 20, s4q5List.get(2), s4q5List, "lp.png", "");    
      quiz4.add(q1s4);
      quiz4.add(q2s4);
      quiz4.add(q3s4);
      quiz4.add(q4s4);
      quiz4.add(q5s4);      
      m.addQuiz(quiz4);
    }
  } 
  
  
}
