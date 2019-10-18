import processing.sound.*;
import processing.serial.*;

//Audio Analysis
AudioIn in;
FFT fft;
int bands = 512;
float[] spectrum = new float[bands];

//Serial Info
Serial port; 
String portname = "COM4";
int baudrate = 9600;
int value = 0;
int previous = 0;

void setup() {
  //visualization size
  size(1500, 1000);
  background(255);
  
  //set up serial port
  port = new Serial(this, Serial.list()[0], baudrate);
  
  //set up fft analysis
  in = new AudioIn(this, 0);
  in.start(); //use system default microphone input
  fft = new FFT(this, bands);
  fft.input(in);
}


void draw() {
  //visualization specs
  background(255);
  strokeWeight(5);
  
  //get fft spectrum
  fft.analyze(spectrum);
  
  //xylophone specs
  //bottom row of xylophone
  //F G A B C D E F G A B C D E F G A B C
  int[] xylo_bot = {16, 18, 20, 23, 24, 27, 31, 32, 36, 41, 46, 49, 55, 61, 65, 73, 82, 92, 97};
  
  int[] key_played = new int[19];
  
  //map out spectrum colors for each xlophone bottom row key
  for(int i = 0; i < bands; i++){
    if (i == xylo_bot[0]) {
      key_played[0] = (int) (spectrum[i] * 500);
      stroke(255, 180, 0);
    } else if (i == xylo_bot[1]) {
      key_played[1] = (int) (spectrum[i] * 500);
      stroke(255, 0, 0);
    } else if (i == xylo_bot[2]) {
      key_played[2] = (int) (spectrum[i] * 500);
      stroke(255, 255, 0);
    } else if (i == xylo_bot[3]) {
      key_played[3] = (int) (spectrum[i] * 500);
      stroke(255, 100, 0);
    } else if (i == xylo_bot[4]) {
      key_played[4] = (int) (spectrum[i] * 500);
      stroke(255, 0, 255);
    } else if (i == xylo_bot[5]) {
      key_played[5] = (int) (spectrum[i] * 500);
      stroke(0, 255, 0);
    } else if (i == xylo_bot[6]) {
      key_played[6] = (int) (spectrum[i] * 500);
      stroke(0, 0, 255);
    } else if (i == xylo_bot[7]) {
      key_played[7] = (int) (spectrum[i] * 500);
      stroke(170, 80, 90);
    } else if (i == xylo_bot[8]) {
      key_played[8] = (int) (spectrum[i] * 500);
      stroke(80, 70, 0);
    } else if (i == xylo_bot[9]) {
      key_played[9] = (int) (spectrum[i] * 500);
      stroke(255, 255, 80);
    } else if (i == xylo_bot[10]) {
      key_played[10] = (int) (spectrum[i] * 500);
      stroke(255, 0, 78);
    } else if (i == xylo_bot[11]) {
      key_played[11] = (int) (spectrum[i] * 500);
      stroke(0, 255, 0);
    } else if (i == xylo_bot[12]) {
      key_played[12] = (int) (spectrum[i] * 500);
      stroke(0, 0, 255);
    } else if (i == xylo_bot[13]) {
      key_played[13] = (int) (spectrum[i] * 500);
      stroke(255, 0, 255);
    } else if (i == xylo_bot[14]) {
      key_played[14] = (int) (spectrum[i] * 500);
      stroke(255, 180, 0);
    } else if (i == xylo_bot[15]) {
      key_played[15] = (int) (spectrum[i] * 500);
      stroke(170, 80, 90);
    } else if (i == xylo_bot[16]) {
      key_played[16] = (int) (spectrum[i] * 500);
      stroke(0, 0, 255);
    } else if (i == xylo_bot[17]) {
      key_played[17] = (int) (spectrum[i] * 500);
      stroke(255, 0, 0);
    } else if (i == xylo_bot[18]) {
      key_played[18] = (int) (spectrum[i] * 500);
      stroke(0, 255, 0);
    } else {
      stroke(128, 128, 128);
    }
    
    //draw spectrum lines
    line( i*3, height, i*3, (height - spectrum[i]*height*10));
  }
  
  //send data to arduino
  for (int i=0; i<key_played.length; i++) {
    if (key_played[i] > 25) {
      if (i != previous) {
        port.write(i);
        previous = i;
        break;
        
      }
      
    }
  }
  


  
  
}
