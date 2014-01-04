boolean run;
int points=0;
int oldtime= 0;
int newtime= 0;
int changetime= 0;
int index= 1; 
PImage city, mrraindrop;
Raindrop[] r = new Raindrop[1000];
Cat[]c = new Cat[200];
Dog[]d= new Dog[200];
Catcher c1;
void setup() {
  size(700, 700);
  colorMode(HSB, 360, 100, 100);
  city= loadImage ("city.jpg");
  mrraindrop= loadImage("mr raindrop.jpg.png");
  imageMode(CENTER);
  for (int i = 0; i < c.length; i++) {
    c[i] = new Cat();
    if (mouseX <= width/2 && mouseX >= width/4 && mouseY <= height/2 && mouseY >= height/4 && points >= 50 || points<=-5 ) {
      i=0;
    }
  }

  for (int i = 0; i < r.length; i++) {
    r[i] = new Raindrop();
    if (mouseX <= width/2 && mouseX >= width/4 && mouseY <= height/2 && mouseY >= height/4 && points >= 50 || points<=-5 ) {
      i=0;
    }
  }
  for (int i = 0; i < d.length; i++) {
    d[i] = new Dog();
    if (mouseX <= width/2 && mouseX >= width/4 && mouseY <= height/2 && mouseY >= height/4 && points >= 50 || points<=-5 ) {
      i=0;
    }
    //these create cats, dogs, and raindrops that will fall
  }
  c1= new Catcher();
  //this calls apon a new catcher
}

void draw() {
  background(150);
  if (run == true) {
    //this all will happen if run equals true
    image(city, width/2, height/2, width, height);
    //this fills the background with the city image
    fill(0);
    textSize(25);
    text(points, 50, 50);
    //this displays the points on the screen


    if (points >= 50) {
      textSize(30);
      fill(255, 0, 0);
      textAlign(CENTER);
      text("you win!", width/2, height/4);
      text("play again", width/2, height/2);
      //this is what is displayed if you win, when the points are greater than or equal to fifty
    }
    if (points<= -5) {
      textSize(30);
      fill(255, 0, 0);
      textAlign(CENTER);
      text("you suck at this game", width/2, height/4);
      text("play again", width/2, height/2);
      //this is what is displayed if you lose, when the points are less than or equal to negative five
    }
    newtime= millis();
    changetime= newtime - oldtime;
    //this sets the change in time

    for (int i = 0; i < index ; i++) {
      r[i].display();
      r[i].drop();
      c1.checkCatcher(r[i]);
      c[i].display();
      c[i].fall();
      d[i].display();
      d[i].fall();
      c1.checkCatcher(c[i]);
      c1.checkCatcher(d[i ]);
      //this displays, moves, and checks the position relative to the catcher of the raindrops, cats, and dogs

    }
if (changetime>= 500) {
      oldtime= newtime;

      if (index< r.length) {
        index++;
      }
      //this makes it so the raindrops will fall at the given time interval
    }
    if (changetime>= 1000) {
      oldtime=newtime;
      if (index< c.length) {
        index++;
      }
      if (index<d.length) {
        index++;
        //this makes it so the cats and dogs will start falling at the given time interval
      }
    }
    c1.display();
    c1.update();
    //this displays and updates the catcher with each frame
  }
  else {
    background(mouseX);
    image(mrraindrop, width/2, height/2, width, height);
    textSize(28);
    fill(0, 100, 100);
    text ("IT'S RAINING CATS AND DOGS!", width/3.2, height/6);
    text("[PRESS ANY KEY TO START]", width/12, height/2.5);
 //this text and image are what will appear on the screen if run is not true, effectivley being a start screen
  }
}

void keyPressed() {
  run = true;
  //this means if you press a key, the game will start running
}
void mousePressed() {
  if (mouseX <= width/2 && mouseX >= width/4 && mouseY <= height/2 && mouseY >= height/4 && points >= 50 || points<=-5 ) {
    points = 0;
    //this means if you press a certain location on the screen (where it says play again) and your score is either a winning or losing score, your points go to zero
    index=1;
  }
}

