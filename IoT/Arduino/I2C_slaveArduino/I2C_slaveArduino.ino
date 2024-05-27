#include <Wire.h>
// #include <Adafruit_MLX90614.h>
#include <LiquidCrystal_I2C.h>

// Adafruit_MLX90614 mlx = Adafruit_MLX90614();
LiquidCrystal_I2C cki(0x27, 16, 2);
const byte address = 0x04;

String text = "";


void setup() {
  Serial.begin(9600);
  Serial.println("I2C test !!");


  Wire.begin(address);
  
  cki.init();
  cki.backlight();
  cki.setCursor(0, 0);
  Wire.onReceive(receiveEvent);
}

void loop() {
  delay(1000);
  cki.print(text);
  text = "";

}
void receiveEvent(int howMany) {
  while (Wire.available()) {
    char c = Wire.read();
    cki.print(c);
    Serial.print(c);
    text = text + c;
  }
}
