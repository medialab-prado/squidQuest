
burbuja [] burbujas ;

void setup(){
size(640,480, FX2D);
burbujas = new burbuja[30];
for(int i= 0;i<burbujas.length;i++){
  burbujas[i]= new burbuja(int(random(0,width)),height+int(random(200,500)));
}
}

void draw(){
background(0);
for(int i= 0;i<burbujas.length;i++){
burbujas[i].update();
burbujas[i].draw();
burbujas[i].borde();
}
}