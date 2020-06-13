PImage img;
PGraphics canvas;

void setup(){
  size(500, 500);
  img = loadImage("Nurie Test.png");
  img.resize(width, height);
  canvas = createGraphics(width, height);
  colorMode(RGB, 255, 255, 255, 1);
  //image(img, 0, 0, width, height);
  
  for(int i = 0; i < img.width; i++){
    for(int j = 0; j < img.height; j++){
      color c = img.pixels[j*img.width+i];
      float red = red(c);
      float green = green(c);
      float blue = blue(c);
      float diffr = 255-red;
      float diffg = 255-green;
      float diffb = 255-blue;
      float diff = (diffr + diffg + diffb)/3/255;
      img.pixels[j*img.width+i] = color(red(c), green(c), blue(c), diff);
    }
  }
  
  background(100);
  canvas.beginDraw();
  canvas.noFill();
  canvas.background(255);
  canvas.strokeWeight(50);
  canvas.stroke(255, 0, 0);//set brush color
  canvas.endDraw();
}

void draw(){
  
  loadPixels();
  for(int i = 0; i < width; i++){
    for(int j = 0; j < height; j++){
      color baseC = pixels[j*img.width+i];
      color imgC = img.pixels[j*img.width+i];
      color canvC = canvas.pixels[j*width+i];
      float a = alpha(imgC);
      pixels[j*width+i] = color(red(canvC)*(1-a)+red(imgC)*a, green(canvC)*(1-a)+green(imgC)*a, blue(canvC)*(1-a)+blue(imgC)*a);
    }
  }
  updatePixels();
  canvas.beginDraw();
  if(mousePressed){
    canvas.point(mouseX, mouseY);
  }
  canvas.endDraw();
}
