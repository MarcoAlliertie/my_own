#include <Wire.h> 
const int MPU = 0x68;
int16_t GyX, GyY, GyZ;
void setup() {
  Wire.begin();
  Wire.beginTransmission(MPU);
  Wire.write(0x6B);
  Wire.write(0);
  Wire.endTransmission(true);
  Serial.begin(9600);
}
void loop() {
  Wire.beginTransmission(MPU);
  Wire.write(0x3B);
  Wire.endTransmission(false);
  Wire.requestFrom(MPU, 14, true);
  GyX = Wire.read() << 8 | Wire.read();
  GyY = Wire.read() << 8 | Wire.read();
  GyZ = Wire.read() << 8 | Wire.read();
  int16_t GX2 = map(GyX,
                    -17000, 17000,
                    -180, 180);
  int16_t GY2 = map(GyY,
                    -17000, 17000,
                    -180, 180);
  int16_t GZ2 = map(GyZ,
                    -17000, 17000,
                    -180, 180);
  String str = String(GX2) + ":" + String(GY2) + ":" + String(GZ2);
  //값을 문자열로 보내버리기
  Serial.print(str);
  delay(100);
}
