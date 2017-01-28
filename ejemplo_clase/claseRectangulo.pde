class rectangulo {
  float x;
  float y;
  color color1;
  rectangulo() {
    x = 0;
    y = 0;
    color1 = color(255, 255, 255);
  }
  void mover(){
    x = mouseX;
    y = mouseY;
  }
  void pintar(){
    fill(color1);
    rect(x, y, 100, 100);
  }
  void cambiarColor(){
    color1 = color(random(255), random(255), random(255));
  }
}