class Fondo {
  ArrayList<Burbuja> Burbujas = new ArrayList<Burbuja>();
  PVector gravity;
  float rate, nIndex;
  boolean create;
  Fondo(float rate_) {
    rate=rate_;
    gravity=new PVector(0, -0.02);
    create=false;
    nIndex=0;
  }
  void anima() {
    update();
    create();
  }
  void update() { //por cada bola aplica fuerzas, actualiza y borra las burbujas que sobrepasan el borde superior
    for (int i=0; i<Burbujas.size(); i++) {
      Burbuja bol = Burbujas.get(i);
      bol.applyForce(new PVector(-0.0147, 0));
      bol.applyForce(gravity);
      bol.go();
      if (bol.edge()) {
        Burbujas.remove(i);
      }
    }
    //println(Burbujas.size() +" " + frameRate );//debug
  }
  void create() { //crea nuevas burbujas
    nIndex+=1;
    for (int i = 0; i<1; i++) {
      Burbujas.add(new Burbuja(noise(nIndex)*(width+width*1.8)-width*.2, 20+noise(nIndex+1)*30));//posicion x y radio
      nIndex+=.1;
    }
  }
}


class Burbuja {
  int birth, life;// vida para transpariencia
  PVector pos, vel, aceleration;
  float rad;
  Burbuja (float x, float rad_) {
    pos = new PVector(x, height+rad_/2);
    vel = new PVector(0, 0);
    aceleration = new PVector(0, 0);
    rad = rad_;
    birth = frameCount;
  }

  void go() {
    update();
    jiggle();
    disp();
    life = birth-frameCount;
  }
  void update() {
    vel.add(aceleration);
    pos.add(vel);
    aceleration.mult(0);
  }
  void jiggle() { //hace vibrar la burbuja hacia todos los lados 
    int amount = 3;
    pos.x+=random(-amount, amount);
    pos.y+=random(-amount, amount);
  }
  void disp() {
    fill(32, 104, 165, map(life, 0, 600, 120, 255));
    stroke(27, 72, 111, map(life, 0, 200, 130, 255));
    ellipse(pos.x, pos.y, rad, rad);
  }
  boolean edge() { // prueba si esta fuera de la pantalla
    if (pos.y<-rad/2 || pos.x<-rad/2) {
      return true;
    } else {
      return false;
    }
  }
  void applyForce(PVector force) {
    aceleration.add(force);
  }
}