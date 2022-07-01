ArrayList<Ball> balls;
void setup(){
  fullScreen();
  //How many balls we want
  balls = new ArrayList<Ball>();
  
  //Randomize balls
  for (int i = 0; i < 1000; i++){
    float x = random(0,width);
    float y = random(0,height);
    float speed = 5;
    float dir = random(0,TWO_PI);
    float mass = random(10,100);
    
    balls.add(new Ball(x,y,speed,dir,mass));  
  }
}

void draw(){
  background(0);
  
  //Double loop to make sure we check every ball for a collision
  for (int i = 0; i < balls.size(); i++){
    for (int j = i + 1; j < balls.size(); j++){
      //Only if we collide do we need to decrement j to prevent an out of bounds error
      if (balls.get(i).touching(balls.get(j))) j--; 
    }
    //Call all other ball methods like usual
    balls.get(i).move();
    balls.get(i).bounce();
    balls.get(i).show();   
  }
}
