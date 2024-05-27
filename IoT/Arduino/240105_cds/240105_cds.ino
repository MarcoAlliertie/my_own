void setup() {
  Serial.begin(9600);
  pinMode(A0, INPUT);
  pinMode(10, OUTPUT);
}

void loop() {
  // int sensor = analogRead(A0);
  //시리얼 모니터에 조도센서 밝기(0~1023) 띄우기
  // Serial.println(sensor);
  // delay(100);

  //조도센서에 따라 밝을 때 led 끄고 어두울 때 켜기
  // int sensor = analogRead(A0);
  // if (sensor<800){
  //   digitalWrite(10,1);
  // }else{
  //   digitalWrite(10,0);
  // }

}
