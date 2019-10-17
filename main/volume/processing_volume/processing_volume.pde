import processing.sound.*;
import processing.serial.*;

AudioIn in;
Amplitude amp;
int bands = 512;
float[] spectrum = new float[bands];
Serial port; 
String portname = "COM4";
int baudrate = 9600;
int value = 0;

void setup() {
  size(1500, 1000);
  background(255);
  port = new Serial(this, Serial.list()[0], baudrate);
  println(port);
  
  in = new AudioIn(this, 0);
  in.start();
  
  amp = new Amplitude(this);
  amp.input(in);
}


void draw() {
  background(255);
  
  int vol = (int) amp.analyze() * 100;
  
  port.write(vol);
  
}
