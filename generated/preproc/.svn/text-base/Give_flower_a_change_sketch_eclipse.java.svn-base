import processing.core.*; 
import processing.xml.*; 

import ddf.minim.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class Give_flower_a_change_sketch_eclipse extends PApplet {



float core_radius = 10.0f;
float stem_size = 20.5f;
float particle_size  = 0.4f;
int alpha_value = 150;
int window_height = 200;
int greenish = color(250, 250, 255,alpha_value -110);
int yellowish = color(190, 190, 170,alpha_value);
int yellow = color(255, 204, 0);

public void draw_stem(float x_start, float line_height) {

  stroke(greenish);
  strokeWeight(2);
  float scaled_height = random(1.0f , 5.8f) * line_height;
  line (x_start, window_height, x_start ,window_height -  line_height);
}

public void draw_core(float stem_x, float top_of_stem ) {
  noStroke();
  fill(yellowish);
  float scaled_radius = random(1, 2) * core_radius;
  ellipse(stem_x, window_height - top_of_stem, scaled_radius, core_radius);
}


public void draw_flower( float position_x) {

  float scaled_stem_size = random(1.0f , 1.4f) * stem_size;
  draw_stem(position_x, scaled_stem_size);
  draw_core(position_x, scaled_stem_size);
}


public void drawParticles(float x, float y){
  float time =  millis();
  float x_time = time% 1000;
 
  ellipse (x_time,y, particle_size, particle_size);
  

}



public void setup() {
  size (900, window_height);
  
  background(51);
  smooth();
 
  
  for(int i = 0; i< 200; i++ ) {
     float random_x  = random(0.0f, 950.0f);
     draw_flower(random_x);
  }
}
public void draw() {
  //  background(51);
  stroke(255, 150, 0);
  fill (255, 204, 0);
  int x  =( int)random(10, 200);
//  ellipse(x *x,3 *x +200, 20, 20);
}


public void mousePressed(){
 drawParticles(mouseX, mouseY);

}


    static public void main(String args[]) {
        PApplet.main(new String[] { "--bgcolor=#ECE9D8", "Give_flower_a_change_sketch_eclipse" });
    }
}
