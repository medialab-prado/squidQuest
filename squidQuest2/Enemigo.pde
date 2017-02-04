class Enemigo {
  float posXenemigo;
  float posYenemigo;
  float tamanoenemigo;
  float velocidadenemigo;
  PImage bomba;
  int timeColisionEnemigo;
  Boolean isColisionEnemigo = false;

  void setup() {
    bomba = loadImage ("bomba.png");
    posXenemigo = random (width);
    posYenemigo = random (height);
    tamanoenemigo = 50;
    velocidadenemigo =random (-1, -3);
  }
  void draw() {
    posXenemigo = posXenemigo+velocidadenemigo;
    image (bomba, posXenemigo, posYenemigo, tamanoenemigo, tamanoenemigo);
    if (posXenemigo < -tamanoenemigo/2) {
      posXenemigo = width + tamanoenemigo/2;
    }
    int tiempoColisionandoEnemigo = millis() - timeColisionEnemigo;
    if (tiempoColisionandoEnemigo > 1000) {
      isColisionEnemigo = false;
    }


    float distanciaEnemigo =  dist( posXenemigo, posYenemigo, posX, posY);
    if (distanciaEnemigo < 50) {
      if (!isColisionEnemigo) {
        isColisionEnemigo = true;
        tint(87, 46, 255);

        println("colisiona");
      }
    } else {
      fill(255);
      //DETECTAR COLISION AQUÍ
      // isColisionEnemigo = false;
      if (mouseY>0) {
      }
    }
  }
}