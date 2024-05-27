void setup() {
  Serial.begin(9600);  //baudrate(bps -> bit per second)
  pinMode(2, INPUT);
  pinMode(3, OUTPUT);
}

void loop() {
  int btn = digitalRead(2);
  Serial.println(btn);
  digitalWrite(3,btn);
  // if (btn == 1){
  //   digitalWrite(3,1);
  // }
  // else{
  //   digitalWrite(3,0);
  // }
}
