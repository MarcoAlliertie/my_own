void setup() {
  pinMode(10, OUTPUT);
  pinMode(7, INPUT);
  Serial.begin(9600);
}
int cnt = 0;
bool check = true;  //버튼 한 번만 누르면 한 번만 작동하게

void loop() {
  int btn = digitalRead(7);
  if (btn == 1) {
    if (check == true) {
      cnt++;
      check = false;
    }
  } else {
    check = true;
  }
  Serial.println(cnt);
  if (cnt%3 ==1){
  analogWrite(10, 50);
}else if(cnt%3 ==2){
  analogWrite(10, 127);
}
else if (cnt%3 ==0) {
analogWrite(10, 200);
}
}
