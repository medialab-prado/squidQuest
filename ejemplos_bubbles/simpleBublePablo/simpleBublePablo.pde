
Burbuja miBurbuja1;
Burbuja miBurbuja2;
Burbuja miBurbuja3;

void setup(){
  size(640, 480);
  miBurbuja1 = new Burbuja(width/3, (int)random(height), "buo.svg");
  miBurbuja2 = new Burbuja(width/2, (int)random(height), "ghost.svg");
  miBurbuja3 = new Burbuja(width/1, (int)random(height), "squid.svg");
  

}

void draw(){
  //background(0);

  miBurbuja1.update();
  miBurbuja1.draw();
  
    miBurbuja2.update();
  miBurbuja2.draw();
  
    miBurbuja3.update();
  miBurbuja3.draw();
  
}