import processing.sound.*;
import processing.serial.*;

//vars
AudioIn in;
FFT fft;
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
  
  fft = new FFT(this, bands);
  
  fft.input(in);
}


void draw() {
  background(255);
  fft.analyze(spectrum);
  strokeWeight(5);
  
  int spec_avg = 0;
  int clap = 0;
  
   for(int i = 0; i < bands; i++){
     if (i >= 1 && i <= 15) {
       spec_avg += (int) (spectrum[i] * 500);
       stroke(255, 0 , 0);
     }
     else if (i >= 285 && i <= 300) {
       clap += (int) (spectrum[i] * 10000);
       stroke(0 , 0 , 255);
      
     } else {
       stroke(0, 0, 0);
     }
    
    line( i*3, height, i*3, (height - spectrum[i]*height*10));
    
  } 
    
    println("Clap: " + clap/15);
    println("Bass: " + spec_avg/15);
    if (clap/15 > 80 && spec_avg/15 < 70) {
      port.write(1);
    } else if (clap/15 < 200 && spec_avg/15 >= 65) {
      port.write(2);
    }
  
  
  

  
  
}
