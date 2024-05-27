#include <Wire.h>

const int ledA = 2, ledB = 3, ledC = 4, ledD = 5;
const int MPU = 0x68;
int16_t GyX, GyY, GyZ;
void setup() {
  Wire.begin();
  Wire.beginTransmission(MPU);
  Wire.write(0x6B);
  Wire.write(0);
  Wire.endTransmission(true);
  pinMode(ledA, OUTPUT);
  pinMode(ledB, OUTPUT);
  pinMode(ledC, OUTPUT);
  pinMode(ledD, OUTPUT);
}

void loop() {
  Wire.beginTransmission(MPU);
  Wire.write(0x3B);
  Wire.endTransmission(false);
  Wire.requestFrom(MPU, 14, true);

  GyX = Wire.read() << 8 | Wire.read();
  GyY = Wire.read() << 8 | Wire.read();
  GyZ = Wire.read() << 8 | Wire.read();
  int16_t GX2 = map(GyX, -17000, 17000, -180, 180);
  int16_t GY2 = map(GyY, -17000, 17000, -180, 180);
  int16_t GZ2 = map(GyZ, -17000, 17000, -180, 180);
  if (GX2 < -90) {
    if (GY2 < -90) {
      digitalWrite(ledA, HIGH);
      digitalWrite(ledB, LOW);
      digitalWrite(ledC, LOW);
      digitalWrite(ledD, HIGH);
    } else if (GY2 > 90) {
      digitalWrite(ledA, HIGH);
      digitalWrite(ledB, LOW);
      digitalWrite(ledC, HIGH);
      digitalWrite(ledD, LOW);
    } else {
      digitalWrite(ledA, HIGH);
      digitalWrite(ledB, LOW);
      digitalWrite(ledC, LOW);
      digitalWrite(ledD, LOW);
    }


  } else if (GX2 > 90) {
    if (GY2 < -90) {
      digitalWrite(ledA, LOW);
      digitalWrite(ledB, HIGH);
      digitalWrite(ledC, LOW);
      digitalWrite(ledD, HIGH);
    } else if (GY2 > 90) {
      digitalWrite(ledA, LOW);
      digitalWrite(ledB, HIGH);
      digitalWrite(ledC, HIGH);
      digitalWrite(ledD, LOW);
    } else {
      digitalWrite(ledA, LOW);
      digitalWrite(ledB, HIGH);
      digitalWrite(ledC, LOW);
      digitalWrite(ledD, LOW);
    }
  }
  delay(333);
}
