#include <Adafruit_NeoPixel.h>

#define PIN 6

#define NUMPIXELS 550

Adafruit_NeoPixel pixels = Adafruit_NeoPixel(NUMPIXELS, PIN, NEO_GRB + NEO_KHZ800);


void setup() {
  //create serial communication at 9600 baud rate
  pixels.begin();
}

void loop() {
        for(int i=50; i<NUMPIXELS; i++) {
          pixels.setPixelColor(i, pixels.Color(30, 15, 0));
        }
        pixels.show();
      /*for (int j = 100; j>0; j = j-1){
        for(int i=0; i<NUMPIXELS; i++) {
          pixels.setPixelColor(i, pixels.Color(90, j, 23+j));
        }
        delay(20);
        pixels.show();
      }
      /*for (int j = 0; j<140; j = j+1){
        for(int i=0; i<NUMPIXELS; i++) {
          pixels.setPixelColor(i, pixels.Color(j+23, j+23, 70));
        }
        pixels.show();
      }
      for (int j = 140; j>0; j = j-1){
        for(int i=0; i<NUMPIXELS; i++) {
          pixels.setPixelColor(i, pixels.Color(j+23, j, 70));
        }
        pixels.show();
      }*/

}
