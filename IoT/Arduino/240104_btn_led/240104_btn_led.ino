void setup() {
  for(int led = 10; led<=12; led++)
  {
    pinMode(led,OUTPUT);
  }
  for(int btn = 5; btn<=7; btn++)
  {
    pinMode(btn,INPUT);
  }
}

void loop() {
  // digitalWrite(10,1);
  // delay(1000);
  // digitalWrite(10,0);
  // delay(1000);
  // digitalWrite(11,1);
  // delay(1000);
  // digitalWrite(11,0);
  // delay(1000);
  // digitalWrite(12,1);
  // delay(1000);
  // digitalWrite(12,0);
  // delay(1000); 
  int btn1 = digitalRead(5);
  int btn2 = digitalRead(6);
  int btn3 = digitalRead(7);
  // digitalWrite(10, btn1);
  // digitalWrite(11, btn2);
  // digitalWrite(12, btn3);
  if (btn1==1){
    digitalWrite(10,1);
    delay(1000);
    digitalWrite(10,0);
  }
  else if (btn2==1){
    digitalWrite(11,1);
    delay(1000);
    digitalWrite(11,0);
  }
  else if (btn3==1){
    digitalWrite(12,1);
    delay(1000);
    digitalWrite(12,0);
  }
  }

