void setup(){
 PImage im = loadImage("lab3start.png");
 color b = color(0,0,0);
 color w = color(255,255,255);
 color left = w,right = w, bottom = w, top = w;
 im.loadPixels();
 size(1000,1000);
 
 im.filter(THRESHOLD);

for (int y = 0; y < im.height; y++) {
    for (int x = 0; x < im.width; x++) {
      color c = im.get(x,y);
      if (c == b){
        if (x > 5){
          left = im.get(x-5,y);
        }
        if (y > 5){
          top = im.get(x,y-5);
        }
        if (x < im.height - 5){
          bottom = im.get(x+5,y);
        }
        if (x < im.width - 5){
          right = im.get(x,y+5);
        }
        if ((left == w) & (right == w) & (top == w) & (bottom == w)){
        color yellow = color(255,0,0);
        im.set(x,y,yellow);
      }
     
    }
  }
 }
 
 updatePixels();
 int count = 0;
 for (int i = 0; i < (im.width*im.height)-im.width; i++) {
   if ((im.pixels[i] == color(255,0,0))&(im.pixels[i+1] == color(255,0,0))&(im.pixels[i+2] != color(255,0,0))){
     count += 1;
   }
 }

 print(count);
 
  image(im,0,0);
}
void draw(){}  
