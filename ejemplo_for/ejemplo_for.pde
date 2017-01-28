PImage img1 , img2;
int actualframe=1;
int totalframe=2;

void setup() {
  size(640, 360);
  img1 = loadImage("001.png");
   img2 = loadImage("002.png");
}
void draw() {
  background(50, 100, 0);
  if (actualframe == 1)  image(img1, width/2, height/2);
  else  image(img2, width/2, height/2);
}
 void keyPressed() {
   actualframe = actualframe +1;
   if(actualframe > totalframe) actualframe = 1;
   
 }