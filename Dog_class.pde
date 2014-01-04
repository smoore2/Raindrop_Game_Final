class Dog {
  PVector loc, vel;
  int d= 60; 
  PImage dog;

  Dog() {
    loc= new PVector(random(width), random(-width*10,-d));
    //this controls the location at which the dog will fall, a random x value
    vel= new PVector (0, random(3, 4));
    //this controls the speed at which the dog will fall
    dog= loadImage("dog.png");
    imageMode(CENTER);
    //this is the image that will be falling
  }

  void display() {
    image(dog, loc.x, loc.y, d, d);
    //this creates the dog at a random width and a set height with a size of d
  }

  void fall() { 
    loc.add(vel);
    //this causes the dog to fall
  }
}

