
 class Particle{
    PVector location;
    PVector velocity;
    PVector acceleration;
    int age;
    color col;
    float mass;
    
    boolean fixed;
    
    PVector particle_size;

   Particle(){
     location = new PVector (mouseX, mouseY);
     velocity = new PVector(mouseX - pmouseX, mouseY - pmouseY);
     acceleration = new PVector (0,0,0);
     age = 0;
     particle_size = new PVector (5, 5);
     col = color(random(140, 200),random (100, 150),0,150);
     mass = 1f;
     
     fixed = false;
    
  }

  boolean exist()
  {
    
    if(fixed) fill (255, 0 ,0 );
    
    velocity.add(acceleration);
    location.add(velocity);
   // col =color( noise (20) * 200, 0, noise(10) *199, 180 );
    fill (col);
    ellipse(location.x, location.y, particle_size.x, particle_size.y);
    if(abs(velocity.x) <0.001 && abs(velocity.y) < 0.001 )
     return false;
    else 
      {
        age++;
        acceleration.mult(0);      
        return true;
      }
  }
  
  void applyForce(PVector force){
    acceleration.add (PVector.div(force,mass));
    
  }
  
  void applyDissipativeForce(Particle p, float friction) {
    PVector f = PVector.mult(p.velocity, -friction);
    p.applyForce(f);
  }
  
  void applyAttractiveForce(Particle a, Particle b, float strength, float minDistance){
  PVector direction = PVector.sub(a.location, b.location);
  float distance = direction.mag();
  if(distance< minDistance) distance = minDistance;
  direction.normalize();
  float force = (strength * a.mass * b.mass) / (distance * distance) ; 
  direction.mult (force);
  if(!b.fixed)  b.applyForce(direction);
  if (!a.fixed){
    direction.mult(-1f);
    a.applyForce(direction);
  }  
  
  
  
  }

}
