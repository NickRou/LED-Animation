import processing.sound.*;
import processing.serial.*;

//vars
AudioIn in;
FFT fft;
int bands = 512;
float[] spectrum = new float[bands];
Serial port; 
String portname = "COM5";
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
  int bass_band_start = 5;
  int bass_band_count = 10;
  int bass = 0;
  int clap = 0;
  
   for(int i = 0; i < bands; i++){
     if (i >= bass_band_start && i <= bass_band_start+bass_band_count) {
       bass += (int) (spectrum[i] * 3000);
       stroke(255, 0 , 0);
     } else {
       stroke(0, 0, 0);
     }
    
    line( i*3, height, i*3, (height - spectrum[i]*height*10));
    
  } 
    
    println("Bass: " + bass/bass_band_count);
    if (bass/bass_band_count > 20) {
      port.write(1);
    }
  
  
  

  
  
}
