void setup() {
  Serial.begin(9600);
}

void loop() {
  Serial.write(0); //시리얼 통신으로 프로세싱에 0 보내기 / 0 아닌 값 보내기
  // delay(1000);
  Serial.write(1);
  // delay(1000);
}
