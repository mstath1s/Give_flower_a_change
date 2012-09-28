import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.signals.*;
import ddf.minim.effects.*;

Minim minimObject;
AudioPlayer player;
AudioInput input;
AudioOutput out;
FFT fft;
SquareWave square;
LowPassSP lowpass;
BeatDetect beat;
BeatListener bl;

float kickSize, snareSize, hatSize, sphereSize, alphaSize;

ArrayList particles;
ParticleGenerator particleGenerator;
//Particle[] particles;
int NUM_PARTICLES = 600;
int LIFESPAN = 120;
//PVector acceleration = new PVector(0f, 0.025);

float particle_size  = 0.4;
int alpha_value = 150;
int window_height = 500;
int window_width = 900;
color greenish = color(250, 250, 255,alpha_value -110);
color yellowish = color(190, 190, 100,alpha_value);
color yellow = color(255, 204, 0);

boolean isStopped = false;

Particle a;
Flower flower = new Flower();
/////////// -------------   Setup and initialization --- ///////////////
void setup() {
  size (900, window_height);
  background(51);
  smooth();
  
  particles = new ArrayList();
  a = new Particle();
  a.location = new PVector(window_width/2f + 100, window_height/2f);
  a.fixed = true;
  a.mass = 5.0;
  particles.add(a);
  particleGenerator = new ParticleGenerator(particles, a );
 
 
  soundController.initialize(); 
  startSound();
  startFFT();
  startBeatDetection();
 // player = minimObject.loadFile("Audio/09 - High Low Middle.mp3"); 
}



void startSound(){
  minimObject = new Minim(this);
  player = minimObject.loadFile("Audio/09 - High Low Middle.mp3");
  isStopped  = false;
  input = minimObject.getLineIn();  
  player.play();
}

void startBeatDetection(){
 beat = new BeatDetect(player.bufferSize(), player.sampleRate());
 beat.setSensitivity(10);  
 kickSize = snareSize = hatSize = sphereSize =  16;
 alphaSize = 200;
  // make a new beat listener, so that we won't miss any buffers for the analysis
  bl = new BeatListener(beat, player);  
  textFont(createFont("akaDylanPlain", 16));
  textAlign(CENTER);
  
  String[] fontList = PFont.list();

}

void startFFT(){
 
fft = new FFT(player.bufferSize(), player.sampleRate());
out = minimObject.getLineOut(Minim.STEREO, 512);
}
void stop(){
 if(!isStopped){
   isStopped  = true;
    player.close();
    input.close();
    minimObject.stop();
 }
}

///////////////// --------------  Draw functions -------------/////

void draw() {
  background(51);
  stroke(255, 150, 0);
  fill (255, 204, 0);

   flower.draw_flowers();
   particleGenerator.draw_particles(particles);
   fftAnalysis();
   drawBeatDetection();

}


void fftAnalysis(){
  fft.forward(player.mix); 
  stroke (255, 0,0,128);
  for (int i = 0; i < fft.specSize(); i ++)
   line (i + 100 , window_height, i + 100, window_height - fft.getBand(i) * 1.2) ;
   
  stroke(255); 
}

void drawBeatDetection(){
  fill(255);
  if ( beat.isKick() ) kickSize = 32;
  if ( beat.isSnare() ) snareSize = 32;
  if ( beat.isHat() ) {hatSize = 32; alphaSize = 150;}
  
  if (beat.isOnset(2) ) sphereSize = 32;
  
  fill(0,constrain (140 * 0.9 ,140,  250), 0, alphaSize);
  textSize(kickSize);
  text("KICK", width/4, height/2);
  
  textSize(snareSize);
  fill(0,0,constrain (140 * 0.9 ,140,  250), alphaSize);
  text("SNARE", width/2, height/2);
  
  fill(constrain (140 * 0.9 ,140,  250), 0, 0, alphaSize); 
  textSize(hatSize);
  text("HAT", 3*width/4, height/2);
  
  fill (240, 30, 0, 130);
  ellipse (100, 100, sphereSize, sphereSize);
  
  kickSize = constrain(kickSize * 0.85, 16, 32);
  snareSize = constrain(snareSize * 0.99, 16, 32);
  hatSize = constrain(hatSize * 0.99, 16, 32);
  
  alphaSize = constrain (alphaSize * .97, 0, 150);
  sphereSize = constrain (sphereSize* 0.99, 16, 32);
}





///////// -------    GUI ----------------/////////////////
void keyPressed(){ 
   if(keyCode == ENTER )     stop();    
   if(keyCode == BACKSPACE) startSound();   
}

void mouseDragged() {
  particles.add(new Particle());
}


void mousePressed(){
// particles  = new Particle[NUM_PARTICLES];
// for(int i = 0; i < NUM_PARTICLES; i ++){
// fill (greenish);
// particles[i] = new Particle();
// 
// }
// //resetParticles();
// drawParticles(mouseX, mouseY);
}

