/**
 * Animated Sprite (Shifty + Teddy)
 * by James Paterson.
 *
 * Press the mouse button to change animations.
 * Demonstrates loading, displaying, and animating GIF images.
 * It would be easy to write a program to display
 * animated GIFs, but would not allow as much control over
 * the display sequence and rate of display.
 */

Animation animation1, animation2; //https://processing.org/examples/animatedsprite.html
PShape mySvg1, mySvg2; //https://processing.org/examples/loaddisplaysvg.html

//Scaling graphics
float escalaFachada = 3; //4;
Boolean bSvgMode = false;

void setup() {

  size(768, 628); //(192, 157)*4 = 768*628
  background(255, 204, 0);
  frameRate(24);

  animation1 = new Animation("png/squidTerrorAnim_eyesFadeIn/squidTerror_.", 50);
  animation2 = new Animation("png/squidTerrorAnim_swim/squidTerror_.", 50);
  mySvg1 = loadShape("svg/squid_terror.svg");
  mySvg2 = loadShape("svg/squid_terror_bigEyes.svg");

}

void draw() {
  background(153, 153, 153);
  translate(40, 40); // Pintar a partir de esta coordenada para la Fachada de Medialab-Prado

  pushMatrix();
  //desplazamos la animación donde esta el raton.
  translate(mouseX-40, mouseY-40);//mouseX-animation1.sizeAnimW*2, mouseY-animation1.sizeAnimH*2);
  //scale(4); //Podriamos escalar manualmente pero suele provocar efecto de aliasing


  /////////////////
  //Anim
  // Display Fachada size or 4 times bigger
  if(bSvgMode){
    shapeMode(CENTER);
    if (mousePressed) {
        shape(mySvg2,0,0, 200, 200);
    } else { //fachada size
        shape(mySvg1,0,0, 200, 200);
    }
  }
  else{
    imageMode(CENTER);
    if (mousePressed) {
      animation2.display(0, 0);//escalaFachada*animation1.sizeAnimW, escalaFachada*animation1.sizeAnimH
    } else { //fachada size
      animation1.display(0, 0);//escalaFachada*animation1.sizeAnimW, escalaFachada*animation1.sizeAnimH
    }
  }

  popMatrix();

  //////////////////////////
  pushMatrix();
  scale(escalaFachada);
  drawFacadeContourInside();
  popMatrix();
}

void keyReleased () {
      if (key == 'b' || key == 'B') {
        bSvgMode = !bSvgMode;
      }
}

//-----------------------------------
void drawFacadeContourInside()
{
  translate(-40, -40);
stroke(255);

  //left line
  line(40, 72, 40, 196);

  //bottom
  line(40, 196, 231, 196);

  //right side
  line(231, 72, 231, 196);

  // steps
  //flat left
  line(40, 72, 76, 72);

  //vert
  line(76, 72, 76, 56);

  // hor
  line(76, 56, 112, 56);

  //vert
  line(112, 56, 112, 40);

  //top
  line(112, 40, 159, 40);

  //vert right side
  line(159, 40, 159, 56);

  //hors
  line(160, 56, 195, 56);

  //  vert
  line(195, 56, 195, 72);

  //hor
  line(196, 72, 231, 72);
}
