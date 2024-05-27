#include <Wire.h>
#include <Adafruit_MLX90614.h>
#include <LiquidCrystal_I2C.h>

Adafruit_MLX90614 mlx = Adafruit_MLX90614();
LiquidCrystal_I2C cki(0x27, 16, 2);

void setup() {
  Serial.begin(9600);
  mlx.begin();

  cki.init();
  cki.backlight();
}

void loop() {
  cki.setCursor(0, 0);
  cki.print("Env =");
  cki.print(mlx.readAmbientTempC());
  cki.setCursor(0, 1);
  cki.print("Object =");
  cki.print(mlx.readObjectTempC());

  delay(2000);
}
