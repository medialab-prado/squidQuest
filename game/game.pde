Fondo fondo;
PImage calamar;
PImage calamarMuerto;
float posCalamarX;
float posCalamarY;
float tamano;
int timeColision = 0;
Boolean isColision = false;
int posx = 100;
int posy = 100;
PImage estrella;
int numeroVidas = 5;
Boolean heMuerto = false;
Boolean reset = false;
PFont gameOverfont;
//PVector pos1, pos2, pos3, pos4, pos5;
//ArrayList<PVector> minas = new ArrayList<PVector>();

int espacioVertical=100;
int posicionYInicial=10;
float velocidadMinas=-3;
float y = random(0, 0);
float x = random(1250, 1250);
//variables Enemigo
Enemigo enemigo = new Enemigo();
ArrayList<Enemigo> enemigos = new ArrayList<Enemigo>();

void enemigosInit(){
    for (int i = 0; i < 10; i++) {
    Enemigo e = new Enemigo();
    enemigos.add(e);
    e.setup(i);
    //e.draw();
    fondo = new Fondo(5);
  }
}

void setup() {
  size(1000, 700);
  gameOverfont = createFont("GameOver.otf", 100);
  textFont(gameOverfont);
  enemigosInit();

  /* for (int i = 0; i < 4; i = i+1) {
   PVector v = new PVector(width-random(100, 500), posicionYInicial+espacioVertical*i+1);
   minas.add( v );
   }*/

  estrella = loadImage("estrella.png");
  calamar = loadImage ("calamar.png");
  calamarMuerto = loadImage ("calamar muerto.png");
  imageMode(CENTER);
  posCalamarX = 100;
  posCalamarY = 200;
  tamano = 75;
}

void update() {
  //Calculo por cada enemigo
  for (int i = 0; i < enemigos.size(); i++) {
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
  println(frameRate);
  background (0);

  if (numeroVidas == 0) {
    //pintar GAME OVER 
    gameOver();
  }

  fondo.anima();
  for (int i = 0; i <  enemigos.size(); i++) {
    Enemigo enemigo = enemigos.get(i);
    enemigo.draw();
  }

  for (int i = 0; i < numeroVidas; i = i + 1) {
    image(estrella, posx+i*150, posy);
  }

  if (isColision) {
    if (heMuerto == false) {
      heMuerto = true;
      numeroVidas = numeroVidas -1;
    }
    tint(random (0, 255), random (0, 255), random (0, 255));
  } else {
    heMuerto = false;
    tint(255, 255, 255);
  }

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
    if (posCalamarY > height - tamano ) {
      posCalamarY = height - tamano;
    }
    /*
    if (posCalamarY < 100) {
     posCalamarY = posCalamarY -2;
     }
     if (posCalamarY > 300) {
     posCalamarY = posCalamarY +2;
     }
     */
    if (posCalamarX > mouseX) {
      posCalamarX = posCalamarX -3;
    }
    if (posCalamarX < mouseX) {
      posCalamarX = posCalamarX +3;
    }
    if (posCalamarX > width - tamano ) {
      posCalamarX = width - tamano;
    }
    if (posCalamarX < 0 + tamano ) {
      posCalamarX = 0 + tamano;
    }
  }

  update();
}
void resetGame () {
  enemigosInit();
    numeroVidas = 5;
}
void keyPressed() {
  
  if (key == 'r' ) {
    resetGame();
  }
}
void gameOver() {
  enemigos.clear();
  textAlign(CENTER);
  textSize(100);
  text("Game Over", width/2, height/2);
  textSize(50);
  text("tap R to reset", width/2, height/2 + 200);
}