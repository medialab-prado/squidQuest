/**
 * oscP5sendreceive by andreas schlegel
 * example shows how to send and receive osc messages.
 * oscP5 website at http://www.sojamo.de/oscP5
 */
 
import oscP5.*;
import netP5.*;
  
OscP5 oscP5;
NetAddress myRemoteLocation;

void setup() {
  size(400,400);
  frameRate(25);
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,12345);
  
  /* myRemoteLocation is a NetAddress. a NetAddress takes 2 parameters,
   * an ip address and a port number. myRemoteLocation is used as parameter in
   * oscP5.send() when sending osc packets to another computer, device, 
   * application. usage see below. for testing purposes the listening port
   * and the port of the remote location address are the same, hence you will
   * send messages back to this sketch.
   */
  myRemoteLocation = new NetAddress("127.0.0.1",12345);
}


void draw() {
  background(0);  
   fill(255, 0, 0);
  ellipse(mouseX, mouseY, 10, 10);
}

void mouseMoved() {
  /* in the following different ways of creating osc messages are shown by example */
  OscMessage myMessage = new OscMessage("/GameBlob");
  
  float osc1X = (float)mouseX/(float)width;
  float osc1Y = (float)mouseY/(float)height;
  
  myMessage.add(osc1X); /* add an float to the osc message */
   myMessage.add(osc1Y); /* add an float to the osc message */
    myMessage.add(osc1X); /* add an float to the osc message */
     myMessage.add(osc1Y); /* add an float to the osc message */

  /* send the message */
  oscP5.send(myMessage, myRemoteLocation); 
}