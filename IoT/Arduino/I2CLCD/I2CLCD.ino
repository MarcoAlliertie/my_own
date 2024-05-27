#include <LiquidCrystal_I2C.h>

//LED 두 개 켜보기
//주소는 달라야 함. 다른 주소값 가진 LED 쓰기
//최교인(cki) 것과 최홍철(chc) 것 사용해서 연결
LiquidCrystal_I2C cki(0x27,16,2);
LiquidCrystal_I2C chc(0x3F,16,2);

void setup() {
  cki.init();
  cki.backlight();
  cki.setCursor(0,0);
  cki.print("Hello World!");

  chc.init();
  chc.backlight();
  chc.setCursor(0,0);
  chc.print("Hello World!2");

}

void loop() {
cki.setCursor(0,1);
cki.print(millis()/1000);

chc.setCursor(0,1);
chc.print(millis()/1000);
}
