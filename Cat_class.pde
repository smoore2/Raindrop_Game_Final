class Cat {
  PVector loc, vel;
  int d= 80;
  PImage cat;

  Cat() {
    loc= new PVector(random(width), random(-width*10,-d));
    //this controls the location at which the cat will fall, a random x value
    vel= new PVector (0, random(3, 4));
    //this controls the speed at which the cat will fall
    cat= loadImage("cat.png");
    imageMode(CENTER);
    //this is the image that will be falling
  }

  void display() {
    image(cat, loc.x, loc.y, d, d);
    //this creates the cat at a random width and a set height with a size of d
  }

  void fall() { 
    loc.add(vel);
    //this causes the cat to fall
  }
}

