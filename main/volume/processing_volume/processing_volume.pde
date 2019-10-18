import processing.sound.*;
import processing.serial.*;

AudioIn in;
Amplitude amp;
int bands = 512;
float[] spectrum = new float[bands];
Serial port; 
String portname = "COM5";
int baudrate = 9600;
int value = 0;

void setup() {
  size(100, 100);
  background(255);
  port = new Serial(this, portname, baudrate);
  println(port);
  
  in = new AudioIn(this, 0);
  in.start();
  
  amp = new Amplitude(this);
  amp.input(in);
}


void draw() {
  background(255);
  println("Previous Volume: " + port.read());

  int vol = (int) (amp.analyze() * 400);
  println("Volume: " + vol);
    
  port.write(vol);
  
  delay(50);
  
}
