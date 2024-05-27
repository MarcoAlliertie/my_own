void setup() {
Serial.begin(115200);
pinMode(18,OUTPUT);
pinMode(19,OUTPUT);
pinMode(23,OUTPUT);
}

void loop() {
  //Serial에 아무 것도 안 들어오면 0, 뭐라도 들어오면 1이상
  //(여러 개의 값이 들어오면 1 이상이 될 수 있다.)
  //즉 Serial.available()>=1이상이라는 것은 Serial에 어떤
  //값이 입력되었다는 의미다.
  if(Serial.available()>=1){
    char c = Serial.read();
    Serial.println(c);
    if(c==49){
      digitalWrite(18,1);
    }else if(c==50){
      digitalWrite(19,1);
    }else if(c==51){
      digitalWrite(23,1);
    }else if(c==48){
      digitalWrite(18,0);
      digitalWrite(19,0);
      digitalWrite(23,0);
    }
  }
}
