void setup() {
  Serial.begin(9600);
  pinMode(8,OUTPUT);

 }

void loop() {
  // if(Serial.available()){//시리얼 모니터 상단 message 부분에 입력할 데이터 있는지 찾는 것
  //   char c = Serial.read(); 
  //   Serial.println(c);
     //C언어에서는 문자 하나는 작은 따옴표, 문자열은 큰 따옴표로 차이를 둔다.
  //   if(c== '1'){        
  //     digitalWrite(8,1);
  //     Serial.println("turn on");
  //   }else if(c=='0'{
  //     digitalWrite(8,0);
  //     Serial.println("turn off");
  //   })
  // }

  if (Serial.available()){
    int i = Serial.parseInt();
    Serial.println(i);
    if(i==1){
      digitalWrite(8,1);
    }else if(i==2){
      digitalWrite(8,0);
    }
  }
}
