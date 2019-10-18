#include <Adafruit_NeoPixel.h>

#define PIN 6

#define NUMPIXELS 200

Adafruit_NeoPixel pixels = Adafruit_NeoPixel(NUMPIXELS, PIN, NEO_GRB + NEO_KHZ800);


void setup() {
  //create serial communication at 9600 baud rate
  Serial.begin(9600);
  pixels.begin();
}

void loop() {
  int data = Serial.read();
  //check if Serial connection valid 
  if (Serial.available() == 0) {
    switch(data) {
      case 0:
        pixelControl(255, 0, 0);
        break;
      case 1:
        pixelControl(0, 255, 0);
        break;
      case 2:
        pixelControl(0, 0, 255);
        break;
      case 3:
        pixelControl(0, 0, 255);
        break;
      case 4:
        pixelControl(80, 80, 120);
        break;
      case 5:
        pixelControl(255, 180, 0);
        break;
      case 6:
        pixelControl(255, 0, 255);
        break;
      case 7:
        pixelControl(0, 255, 255);
        break;
      case 8:
        pixelControl(255, 100, 0);
        break;
      case 9:
        pixelControl(0, 100, 255);
        break;
      case 10:
        pixelControl(60, 0, 255);
        break;
      case 11:
        pixelControl(150, 80, 0);
        break;
      case 12:
        pixelControl(200, 170, 255);
        break;
      case 13:
        pixelControl(50, 180, 70);
        break;
      case 14:
        pixelControl(50, 200, 255);
        break;
      case 15:
        pixelControl(200, 80, 70);
        break;
      case 16:
        pixelControl(160, 70, 255);
        break;
      case 17:
        pixelControl(70, 150, 255);
        break;
      case 18:
        pixelControl(100, 255, 50);
        break;
      default:
        pixelControl(0, 0, 0);
        break;
        
    }
  }

}


void pixelControl(int r, int g, int b) {
  for(int i=0; i<NUMPIXELS; i++) {
    pixels.setPixelColor(i, pixels.Color(r, g, b));
  }
  pixels.show();
}
