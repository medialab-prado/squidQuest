color fondo;
rectangulo figura;

void setup() {
  rect(30, 20, 55, 55);
  size(600, 600);
  fondo = color(80, 20, 20);
  figura = new rectangulo();
}

void draw() {
  background(fondo);
  figura.mover();
  figura.pintar();
}

void keyPressed() {
  if (key == 'a') {
    fondo = color(60, 40, 10);
  }
  if (key == 'b'){
    figura.cambiarColor();
  }
}