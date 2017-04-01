class burbuja{
  int x,y;
  burbuja(int posX,int posY){
  x=posX;
  y=posY;
  }
void draw(){
  fill(random(0,255),random(0,255),random(0,255));
  ellipse(x,y,100,100);
}
void update(){
y = y - 2;
x+=random(-5,5);
}
void borde(){
if(y<0){
  y=height;
}
if(x<0 || x>width){
x=width/2;
}
}
}