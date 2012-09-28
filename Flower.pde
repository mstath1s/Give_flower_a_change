class Flower {
  float core_radius;
  float stem_size;
  //float window_height;
 
 
 
  Flower(){
   core_radius = 10.0;
   stem_size = 20.5;
  // window_height = 200;
  }
  
  
  void draw_stem(float x_start, float line_height) {

    stroke(greenish);
    strokeWeight(2);
    float scaled_height = random(1.0 , 5.8) * line_height;
    line (x_start, window_height, x_start ,window_height -  line_height);
    print (window_height);
  }

  void draw_core(float stem_x, float top_of_stem ) {
    noStroke();
    fill(yellowish);
    float scaled_radius = noise(stem_x + 0.5)*2 * core_radius;
    ellipse(stem_x, window_height - top_of_stem, scaled_radius, core_radius);
  }


  void draw_flower( float position_x) {

    float scaled_stem_size = noise(position_x)* 3 * stem_size;
    draw_stem(position_x, scaled_stem_size);
    draw_core(position_x, scaled_stem_size);
  }

  void draw_flowers(){
   for(int i = 0; i< 400; i++ ) {
     float random_x  = random(0.0, 950.0);
     draw_flower(noise(i) * 2000 - 600);
   } 
  
  }


}
