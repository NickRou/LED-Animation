#include <Adafruit_NeoPixel.h>

#define PIN 6

#define NUMPIXELS 550

Adafruit_NeoPixel pixels = Adafruit_NeoPixel(NUMPIXELS, PIN, NEO_GRB + NEO_KHZ800);

int previous;


void setup() {
  //create serial communication at 9600 baud rate
  Serial.begin(9600);
  pixels.begin();
  previous = 0;
}

void loop() {
  int vol = Serial.read();

  if (vol == -1) {
    pixelControl(previous);
  } else {
    vol *= 6;
    pixelControl(vol);
    previous  = vol;
  }
}

void pixelControl(int volume) {
  for(int i=NUMPIXELS; i>volume; i--) {
        pixels.setPixelColor(i, pixels.Color(0, 0, 0));
  }
  pixels.show();
  
  for(int i=50; i<volume; i++) {
        if (i< 236) {
          pixels.setPixelColor(i, pixels.Color(255, 0, 0));
        } else {
          pixels.setPixelColor(i, pixels.Color(0, 255, 0));
        }
  }
  pixels.show();
}
