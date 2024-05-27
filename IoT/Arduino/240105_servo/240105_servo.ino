#include <Servo.h> //C언어에선 이렇게 라이브러리를 가져온다.
Servo myservo; //라이브러리를 myservo라는 변수로 저장

void setup() {
  myservo.attach(8); //8번 핀에 연결
}

void loop() { 
  // myservo.write(10); //10도 돌린다
  // delay(1000);
  // myservo.write(120);//120도 돌린다
  // delay(1000);

  //반복문 형태로
  // for(int angle = 0; angle <120; angle++){
  //   myservo.write(angle);
  //   delay(15);
  //}
 }
