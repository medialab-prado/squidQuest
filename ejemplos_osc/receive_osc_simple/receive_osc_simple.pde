/**
 * oscP5sendreceive by andreas schlegel
 * example shows how to send and receive osc messages.
 * oscP5 website at http://www.sojamo.de/oscP5
 */
 
import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

PShape myShape;
float ballPosX = 0.5;
float ballPosY = 0.5; // init pos

void setup() {
  size(400,400);
  frameRate(25);

  //setup OSC
  oscP5 = new OscP5(this, 12345);
  //myRemoteLocation = new NetAddress("127.0.0.1", 12345);
  
  //Svg
  myShape = loadShape("ghost.svg");
}


void draw() {
  background(0);  
  
  //osc1
  fill(0, 255, 0);
  
  shapeMode(CENTER);
  shape(myShape, ballPosX*width, ballPosY*height, 100, 100);
  ellipse(width/2, ballPosY*height, 10, 10);
}

void mousePressed() {

}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());
  
  if (theOscMessage.checkAddrPattern("/test") == true) {
    if (theOscMessage.checkTypetag("ff")) {
      ballPosX = theOscMessage.get(0).floatValue();
      ballPosY = theOscMessage.get(1).floatValue(); // sabemos que vale entre [0..1]
      //ballPosY = 1 - ballPosY; // invert the value
    }
  }
}