PImage calamar;
PImage calamarMuerto;
float posCalamarX;
float posCalamarY;
float tamano;
int timeColision = 0;
Boolean isColision = false;

//PVector pos1, pos2, pos3, pos4, pos5;
ArrayList<PVector> minas = new ArrayList<PVector>();

int espacioVertical=100;
int posicionYInicial=10;
float velocidadMinas=-3;
float y = random(0, 0);
float x = random(1250, 1250);
//variables Enemigo
Enemigo enemigo = new Enemigo();
ArrayList<Enemigo> enemigos = new ArrayList<Enemigo>();

void setup() {
  size(1000, 700);
  for (int i = 0; i < 10; i++) {
    Enemigo e = new Enemigo();
    enemigos.add(e);
    e.setup(i);
    //e.draw();
  }

  /* for (int i = 0; i < 4; i = i+1) {
   PVector v = new PVector(width-random(100, 500), posicionYInicial+espacioVertical*i+1);
   minas.add( v );
   }*/

  calamar = loadImage ("calamar.png");
  calamarMuerto = loadImage ("calamar muerto.png");
  imageMode(CENTER);
  posCalamarX = 100;
  posCalamarY = 200;
  tamano = 75;
}

void update() {

  //Calculo por cada enemigo
  for (int i = 0; i < 10; i++) {
    Enemigo enemigo = enemigos.get(i);
    enemigo.update();

    if (enemigo.isColisionEnemigo == true) {
      isColision = true;
      timeColision = millis();
      //println("Colisionando en millis ="+str(millis()));
    }
  }

  //Calculo general
  int tiempoColisionando = millis() - timeColision;
  if (tiempoColisionando > 1000) {
    isColision = false;
  }
}


void draw () {
  background (0);

  for (int i = 0; i < 10; i++) {
    Enemigo enemigo = enemigos.get(i);
    enemigo.draw();
  }


  if (isColision)
    tint(random (0, 255), random (0, 255), random (0, 255));
  else 
  tint(255, 255, 255);

  image (calamar, posCalamarX, posCalamarY, tamano, tamano);

  tint(255, 255, 255);

  //esto es para mover el calamar según el ratón

  float tempDist = dist(mouseX, mouseY, posCalamarX, posCalamarY);

  if (tempDist > 10) {

    if (posCalamarY > mouseY) {
      posCalamarY = posCalamarY -3;
    }
    if (posCalamarY < mouseY) {
      posCalamarY = posCalamarY +3;
    }
    if (posCalamarY < 31) {
      posCalamarY =31;
    }
    if (posCalamarY > width) {
      posCalamarY = width;
    }
    if (posCalamarY < 100) {
      posCalamarY = posCalamarY -2;
    }
    if (posCalamarY > 300) {
      posCalamarY = posCalamarY +2;
    }


    if (posCalamarX > mouseX) {
      posCalamarX = posCalamarX -3;
    }
    if (posCalamarX < mouseX) {
      posCalamarX = posCalamarX +3;
    }
  }

  update();
}