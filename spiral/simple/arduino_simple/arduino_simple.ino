#include <Adafruit_NeoPixel.h>

#define PIN 6

#define NUMPIXELS 350

Adafruit_NeoPixel pixels = Adafruit_NeoPixel(NUMPIXELS, PIN, NEO_GRB + NEO_KHZ800);

int colors[6][3] = {{150, 0, 0},{0, 150, 0}, {0, 0, 150},
                  {150, 150, 0}, {150, 0, 150}, {0, 150, 150}};

int idx = 0;

void setup() {
  pixels.begin();
  
}

void loop() {
  pixelControl();
  idx++;
  delay(100);
 

}


void pixelControl() {
  //every 6 pixels index 0 and 5 match
  for(int i=0; i<165; i++) {
    if (i % 5 == 0) {
      int cidx = idx % 5;
      uint32_t color = pixels.Color(colors[cidx][0], colors[cidx][1], colors[cidx][2], 50);
      pixels.setPixelColor(i, color);
    } else if (i % 5 == 1) {
      int cidx = idx + 1 % 5;
      uint32_t color = pixels.Color(colors[cidx][0], colors[cidx][1], colors[cidx][2], 50);
      pixels.setPixelColor(i, color);
    } else if (i % 5 == 2) {
      int cidx = idx + 2 % 5;
      uint32_t color = pixels.Color(colors[cidx][0], colors[cidx][1], colors[cidx][2], 50);
      pixels.setPixelColor(i, color);
    } else if (i % 5 == 3) {
      int cidx = idx + 3 % 5;
      uint32_t color = pixels.Color(colors[cidx][0], colors[cidx][1], colors[cidx][2], 50);
      pixels.setPixelColor(i, color);
    } else {
      int cidx = idx + 4 % 5;
      uint32_t color = pixels.Color(colors[cidx][0], colors[cidx][1], colors[cidx][2], 50);
      pixels.setPixelColor(i, color);
    }
  }
  pixels.show();
}
