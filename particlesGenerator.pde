class ParticleGenerator{

ArrayList particles;
Particle a;
  
ParticleGenerator(ArrayList particles, Particle particle){
this.particles = particles;
this.a = particle;
//draw_particles(particles);

}

void draw_particles(ArrayList particles){

  if(abs(mouseX - pmouseX ) > 0.0001)
     particles.add (new Particle());
  for(int i = particles.size()-1 ; i>= 0; i--){
     Particle p = (Particle) particles.get(i);
     p.applyDissipativeForce( p, 0.1) ;
     p.applyAttractiveForce (this.a, p, 500f, 50f );
     if(!p.exist())
       particles.remove(i);
   }



}




}
