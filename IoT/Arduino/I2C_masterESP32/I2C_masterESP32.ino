#include <Wire.h>
#include <Adafruit_MLX90614.h>
// #include <LiquidCrystal_I2C.h>

Adafruit_MLX90614 mlx = Adafruit_MLX90614();
// LiquidCrystal_I2C cki(0x27, 16, 2);
const byte address = 0x04;

void setup() {
  Serial.begin(9600);
  Wire.begin();
  mlx.begin();

  // cki.init();
  // cki.backlight();
}

void loop() {
  if (Serial.available()) {
    char c = Serial.read();
    Wire.beginTransmission(address);  //보내겠다고 신호
    Serial.println(c);
    Wire.write(c);
    // delay(2000);
    Wire.endTransmission();  //다 보냈다고 신호
  }
  // cki.setCursor(0, 0);
  // cki.print("Env =");
  // cki.print();
  // cki.setCursor(0, 1);
  // cki.print("Object =");
  // cki.print(mlx.readObjectTempC());
}
