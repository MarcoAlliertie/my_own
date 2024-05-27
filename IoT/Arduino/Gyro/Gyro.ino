#include <Wire.h> 

const int MPU1 = 0x68, MPU2 = 0x69;
int16_t X, Y, Z, X2, Y2, Z2;
void setup() {
  Wire.begin();
  Wire.beginTransmission(MPU1);
  Wire.write(0x6B); //메모리상의 0x6B 주소에 명령을 보내겠다는 의미 - 이 주소가 자이로센서 장치의 특정기능 주소
  Wire.write(0); //해당 주소의 값을 초기화하여 시작을 예비
  //SCL이 HIGH인 상태에서 SDA가 LOW가 되면 I2C 통신의 시작을 알리는 Start 상태가 되므로 SDA를 LOW로 만들어주기
  //위의 주소값 write 안 하고 바로 0 값을 보내는 경우도 있다. I2C장치의 종류에 따라 다름. 
  Wire.endTransmission(true);
  Wire.beginTransmission(MPU2);
  Wire.write(0x6B);
  Wire.write(0);
  Wire.endTransmission(true);
  Serial.begin(9600);
}
void loop() {
  Wire.beginTransmission(MPU1);
  Wire.write(0x3B); //실제 데이터가 들어있는 주소. 이제 여기서부터 14바이트 값을 읽어올 것
  Wire.endTransmission(false);
  Wire.requestFrom(MPU1, 14, true); 
  //14바이트 값만 읽어오라는 의미 - 자이로센서는 자이로값(각각 x,y,z)과 가속도값(각각 x,y,z) 온도값(t) 이 세 가지를 가진다. 각 값은 2바이트이므로 총 14바이트.
  //메모리상 값들의 위치관계 - 자이로x,y,z,온도t,가속도x,y,z 순서로. 각각 2바이트씩
  //가속도는 회전가속도. 온도값이 있는 이유는 온도에 따라 값이 다르므로.
  //자이로는 기울기.
  //지자기까지 붙어 있는 9축 자이로 센서도 있다. 우리는 자이로값과 가속도값만 붙어 있는 6축 자이로 센서.
  //가만히 놔둬도 값이 변하는 이유 - 컴퓨터 등의 음파의 진동 때문. 그만큼 정밀한 센서다.
  //자이로 센서가 충격감지 센서로 쓰일 수 있는 이유 - 충격 발생시 회전가속도도 발생하므로
  X = Wire.read() << 8 | Wire.read();
  //1바이트(8비트)씩 읽어옴 => 값은 2바이트인데?
  //2바이트를 읽어오도록 시프트로 첫번째 값을 옮김 + or로 다음 값이랑 합침(or를 쓰면 합쳐진다)
  Y = Wire.read() << 8 | Wire.read();
  Z = Wire.read() << 8 | Wire.read();

  
  X = map(X,
          -17000, 17000,
          -180, 180);
          //값이 -17000부터 17000까지 있는데 각도는 -180에서 180까지만 있으므로 맵핑!
  Y = map(Y,
          -17000, 17000,
          -180, 180);
  Z = map(Z,
          -17000, 17000,
          -180, 180);
  Serial.print("X = ");
  Serial.print(X);
  Serial.print(" Y = ");
  Serial.print(Y);
  Serial.print(" Z = ");
  Serial.println(Z);
  Wire.beginTransmission(MPU2);
  Wire.write(0x3B);
  Wire.endTransmission(false);
  Wire.requestFrom(MPU2, 14, true);
  X2 = Wire.read() << 8 | Wire.read();
  Y2 = Wire.read() << 8 | Wire.read();
  Z2 = Wire.read() << 8 | Wire.read();
  X2 = map(X2,
           -17000, 17000,
           -180, 180);
  Y2 = map(Y2,
           -17000, 17000,
           -180, 180);
  Z2 = map(Z2,
           -17000, 17000,
           -180, 180);
  Serial.print("X2 = ");
  Serial.print(X2);
  Serial.print(" Y2 = ");
  Serial.print(Y2);
  Serial.print(" Z2 = ");
  Serial.println(Z2);
  delay(2222);
  //센서에서 고속으로 값이 변하는 경우 센서에 의존하는 기능에 문제 발생 가능 -> 평균값으로 만들거나 이상치를 제거하여 문제 제거(칼만 필터 등)
}
