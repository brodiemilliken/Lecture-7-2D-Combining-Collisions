class Ball{
  PVector pos, vel, acc;
  float radius, diameter, mass;
  public Ball(float x, float y, float speed, float dir, float m){
    pos = new PVector(x,y);
    vel = new PVector(speed * cos(dir), speed * sin(dir));
    acc = new PVector(0,0);
    mass = m;
    updateWidth(); //Makes the balls radius mass dependent
  }
  
  void show(){
    noStroke();
    fill(255);
    ellipse(pos.x,pos.y, diameter, diameter);
  }
  
  void move(){
    vel.add(acc);
    pos.add(vel);
    acc.set(0,0);
  }
  
  void bounce(){
    if (pos.x < radius || pos.x > width - radius) vel.x *= -1;
    if (pos.y < radius || pos.y > height - radius) vel.y *= -1; 
  }
  
  boolean touching(Ball b){
    PVector thisPos = pos.copy();    
    thisPos.sub(b.pos);
    //If the balls are touching then we say they collided
    if (thisPos.mag() < radius + b.radius){
      collide(b);
      return true;
    }
    return false;
  }
  
  void collide(Ball b){    
    //Math to collide balls
    PVector m1 = this.vel.mult(this.mass);
    PVector m2 = b.vel.mult(b.mass);
    
    m1.add(m2);
    mass += b.mass;
    m1.div(this.mass);
    updateWidth();
    balls.remove(b);
  }
  
  void updateWidth(){
    //This function can be set to be whatever you want
    diameter = pow(mass,0.5);
    radius = diameter /2;
  }

}
