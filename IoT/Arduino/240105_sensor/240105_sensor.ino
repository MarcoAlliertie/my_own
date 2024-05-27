void setup() {
  pinMode(10,OUTPUT);
  pinMode(A0,INPUT);
  Serial.begin(9600);
}

void loop() {
  // 온도센서
  // int sensorValue = analogRead(A0);
  // float voltage = sensorValue / 1024.0*5; //센서는 1024가지 값으로 표현되고 5v이므로
  // float temperature = (voltage - 0.5)*100;//이 센서 자체 공식. 이렇게 온도 구한다고 이해하자.
  // Serial.println(temperature);

  //가변저항
  // int value = analogRead(A0);
  // Serial.println(value);
  // int brightness = value/4; //혹은 아래의 map으로 변환할 수 있다.
  ////map(변환하고자 하는 값, 변환 전 최소값, 변환 전 최대값, 변환 후 최소값, 변환 후 최대값);
  // int brightness = map(value, 0, 1023, 0, 255);
  // analogWrite(10,brightness);
}
