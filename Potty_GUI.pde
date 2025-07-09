import controlP5.*; // import ControlP5
import processing.serial.*; 

Serial port; // create Serial object

ControlP5 gui; // create ControlP5 object
PFont moveFont;
PFont font;

void setup(){
  size(1000, 700); // window size (width, height)
  
  printArray(Serial.list()); // print available serial ports
  
  port = new Serial(this, "COM9", 9600); // switch out COM3 if needed
  
  //buttons
  gui = new ControlP5(this);
  
  moveFont = createFont("calibri bold", 20);
  font = createFont("calibri bold", 15);
  
  // Movement
  gui.addButton("forward")
    .setPosition(425, 450) // x-coord, y-coord
    .setSize(125, 75) // width, height
    .setFont(moveFont)
    .setColorCaptionLabel(color(65,65,65))
    .setColorBackground(color(211,211,211))
    .setColorForeground(color(211,211,211)) 
    .setColorActive(color(255,250,164));
  gui.addButton("backward")
    .setPosition(425, 550) // x-coord, y-coord
    .setSize(125, 75) // width, height
    .setFont(moveFont)
    .setColorCaptionLabel(color(65,65,65))
    .setColorBackground(color(211,211,211))
    .setColorForeground(color(211,211,211)) 
    .setColorActive(color(255,250,164));
  gui.addButton("left")
    .setPosition(290, 500) // x-coord, y-coord
    .setSize(125, 75) // width, height
    .setFont(moveFont)
    .setColorCaptionLabel(color(65,65,65))
    .setColorBackground(color(211,211,211))
    .setColorForeground(color(211,211,211)) 
    .setColorActive(color(255,250,164));
  gui.addButton("right")
    .setPosition(565, 500) // x-coord, y-coord
    .setSize(125, 75) // width, height
    .setFont(moveFont)
    .setColorCaptionLabel(color(65,65,65))
    .setColorBackground(color(211,211,211))
    .setColorForeground(color(211,211,211)) 
    .setColorActive(color(255,250,164));
    
  // Lighting
  gui.addButton("light")
    .setPosition(75, 475) // x-coord, y-coord
    .setSize(100, 65) // width, height
    .setFont(font)
    .setColorCaptionLabel(color(65,65,65))
    .setColorBackground(color(211,211,211))
    .setColorForeground(color(211,211,211)) 
    .setColorActive(color(255,250,164));
  // Take Picture
  gui.addButton("Picture")
    .setPosition(75, 550) // x-coord, y-coord
    .setSize(100, 65) // width, height
    .setFont(font)
    .setColorCaptionLabel(color(65,65,65))
    .setColorBackground(color(211,211,211))
    .setColorForeground(color(211,211,211)) 
    .setColorActive(color(255,250,164));
  //// Scoop
  //gui.addButton("Scoop")
  //  .setPosition(75, 575) // x-coord, y-coord
  //  .setSize(100, 65) // width, height
  //  .setFont(font)
  //  .setColorCaptionLabel(color(65,65,65))
  //  .setColorBackground(color(211,211,211))
  //  .setColorForeground(color(211,211,211)) 
  //  .setColorActive(color(255,250,164));
}

void draw(){
  background(0,0,0); // background color (r, g, b) 0 to 255
  
  fill(255, 255, 255); // text color (r, g, b)
  textSize(20);
  text("P.O.T.T.Y Controls", 425, 30); // text, x-coord, y-coord
}

// Sends variable to Arduino as command
void forward(){
  port.write('f');
}
void backward(){
  port.write('b');
}
void left(){
  port.write('l');
}
void right(){
  port.write('r');
}
void picture(){
  port.write('p');
}
void light(){
  port.write('t');
}
