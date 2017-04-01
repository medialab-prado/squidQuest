class Burbuja {
  int x, y;
  int transparenciaFrameCount = 0;
  PShape buoShape;
  
  Burbuja(int posx, int posy, String imageName) {
    x = posx;
    y = posy;
    buoShape = loadShape(imageName);
  }

  void update(){
    y-=2;
    x+=random(-5, 5);
    transparenciaFrameCount++;
  }
  
  void draw() {
    
    fill(255, 255, 255, 255 - transparenciaFrameCount);
    //ellipse(x, y, 100, 100);
    buoShape.disableStyle();
    float sizeShape = noise(frameCount);//random
    sizeShape = map(sizeShape, 0,1, 90, 120);
    shapeMode(CENTER);
    shape(buoShape, x, y, sizeShape, sizeShape);


    if (y<0) {
      y = height;
      transparenciaFrameCount = 0;
    }
    
    
  }
}