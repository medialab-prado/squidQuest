
class Enemigo {
  
  //Estas son las variables personales de nuestra clase Enemigo. ASi enemigo tendrá sus propios valores internos.
  int id = -1;
  float posXenemigo;
  float posYenemigo;
  float tamanoenemigo;
  float velocidadenemigo;
  PImage bomba;
  int timeColisionEnemigo;
  Boolean isColisionEnemigo = false;

  //------------------------------------------------------------------------------
  void setup(int miNuevaIdentificacion) {
    id = miNuevaIdentificacion;
    bomba = loadImage ("bomba.png");
    posXenemigo = random (width);
    posYenemigo = random (height);
    tamanoenemigo = size?50/3:50;
    velocidadenemigo = random (size?-2:-6, size?-1/1:-1);
    println ("enemigovelocidad"+str(velocidadenemigo));
  }

  //------------------------------------------------------------------------------
  //Aqui todos los calculos generales. Colisiones y otras cosas.
  void update() {
    posXenemigo = posXenemigo+velocidadenemigo;

//aquí comprobamos si nos salimos izquierda
    if (posXenemigo < 0 - tamanoenemigo/2) {
      posXenemigo = width + tamanoenemigo/2;
      posYenemigo = random(tamanoenemigo, height-tamanoenemigo);
    }

    //Calcula la colision
    float distanciaEnemigo =  dist( posXenemigo, posYenemigo, posCalamarX, posCalamarY);
    if (distanciaEnemigo < tamanoenemigo) {
        isColisionEnemigo = true;
        println("colisiona con Bomba Id = " + str(id));
    } else {
      isColisionEnemigo = false;
    }

  }

  //------------------------------------------------------------------------------
  //Aqui solo las cosas a dibujar
  void draw() {

    if (isColisionEnemigo) {
        tint(87, 46, 255);
    } else {
      tint(255, 255, 255);
      isColisionEnemigo = false;
    }
    //Pinta el enemigo aqui
    image (bomba, posXenemigo, posYenemigo, tamanoenemigo, tamanoenemigo);
  }
}