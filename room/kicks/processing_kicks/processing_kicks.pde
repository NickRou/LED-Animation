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

//variables
int w_h = 500; //window height
int w_w = 1500; //window width

void setup() {
  //visualization size
  size(1500, 500);
  background(255);
  
  //set up serial port
  //port = new Serial(this, Serial.list()[0], baudrate);
  
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
  
  //track bass and clap in respective ranges
  int bass = 0;
  int[] bass_range = {0, 15};
  
  int clap = 0;
  int[] clap_range = {285, 300};
  
  
   for(int i = 0; i < bands; i++){
     stroke(128, 128, 128);
     //update/visualize bass value
     if (i >= bass_range[0] && i <= bass_range[1]) {
       bass += (int) (spectrum[i] * 500);
     }
     //update/visualize clap value
     else if (i >= clap_range[0] && i <= clap_range[1]) {
         clap += (int) (spectrum[i] * 10000);
     }
      //draw spectrum lines
      line( i*3, height, i*3, (height - spectrum[i]*height*10));
    
    } 
  
  //modify bass/clap values by range
  bass = bass/(bass_range[1] - bass_range[0]);
  clap = clap/(clap_range[1] - clap_range[0]);
  
  //threshold values
  int clap_thresh = 80;
  int bass_thresh = 65;
  
  //visualization stuff
  stroke(255, 0, 0);
  line(bass_range[0], (w_h - bass_thresh), bass_range[1]*3, (w_h - bass_thresh));
  rect(bass_range[0], (w_h - bass), (bass_range[1] - bass_range[0])*3, (w_h - bass));
  stroke(0, 0, 255);
  line(clap_range[0]*3, (w_h - clap_thresh), clap_range[1]*3, (w_h - clap_thresh));
  rect(clap_range[0]*3, (w_h - clap), (clap_range[1] - clap_range[0])*3, (w_h - clap));
  
    
  //print statments
  println("Bass: " + bass);
  println("Clap: " + clap);

  /*
  //send data to Arduino
  if (clap > 80 && bass < 70) {
    port.write(1);
  } else if (clap < 200 && bass >= 65) {
    port.write(2);
  }
  */


  
  
}
