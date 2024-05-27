//ctrl+t -> 자동정렬
//ctrl+u -> 실행
//ctrl+spacebar -> 자동완성

void setup() {
  // put your setup code here, to run once:
  //pinMode(핀번호, 액츄에이터(OUTPUT) or 센서(INPUT))
  pinMode(12, OUTPUT);
  pinMode(8, OUTPUT);
}

void loop() {
  digitalWrite(12, HIGH);
  delay(1000);
  digitalWrite(8, 1);
  delay(1000);
  digitalWrite(12, 0);
  delay(1000);

  digitalWrite(8, LOW);
  delay(1000);
}
