#include <Adafruit_NeoPixel.h>

#define PIN 6

#define NUMPIXELS 550

Adafruit_NeoPixel pixels = Adafruit_NeoPixel(NUMPIXELS, PIN, NEO_GRB + NEO_KHZ800);


void setup() {
  //create serial communication at 9600 baud rate
  Serial.begin(9600);
  pixels.begin();
}

void loop() {
  int vol = Serial.read();
  if (Serial.available() > 0) {
    if (vol == 1) {
      for(int i=50; i<NUMPIXELS; i++) {
        pixels.setPixelColor(i, pixels.Color(200, 0, 0));
      }
      pixels.show();
    }  
  } else {
    for(int i=50; i<NUMPIXELS; i++) {
      pixels.setPixelColor(i, pixels.Color(0, 0, 0));
    }
    pixels.show();
  }

}
