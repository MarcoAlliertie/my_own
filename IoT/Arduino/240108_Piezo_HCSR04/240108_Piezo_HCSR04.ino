int trig = 10;
int echo = 8;
void setup() {
  pinMode(10, OUTPUT);
  pinMode(11, OUTPUT);
  pinMode(8, INPUT);
  Serial.begin(9600);
  //소리 나게 하는 함수 tone(핀 번호, 진동수(초당) == 주파수(초당))

  // tone(10,392);
  // delay(500);
  // tone(10,440);
  // delay(500);
  // tone(10,440);
  // delay(500);
  // noTone(11);
}

void loop() {
  //1. trig 핀 통해서 초음파를 쏜다
  //(초음파를 echo에서 엄청 빠르게 받아와야 함)
  digitalWrite(trig, 1); //초음파 쏜다
  delay(10); //쏘고 금방 꺼야
  digitalWrite(trig,0);//초음파 안 쏜다

  //2. echo핀에서 초음파가 수신되기까지의 시간을 측정 -> pulseIn()
  int duration = pulseIn(echo, 1); 
  //이건 왕복시간. 거리를 측정하려면 절반으로 나누어야.
  //pulseIn()은 시간을 ㎲(마이크로초)로 받아옴.
  duration = duration/2;
  int distance = duration/29.1;
  Serial.print("distance : ");
  Serial.print(distance);
  Serial.println("cm");
  delay(200);

//자동차 후방 경고음 나타내 보자!

   if(distance>10 && distance <= 70){
    tone(11,330);
    delay(100);
    noTone(11);
  }else if (distance<=10){
    tone(11,330);
     }else{
  noTone(11);
     }
   }
  /*29.1로 나누는 이유 - 이건 물리내용. 개발할 때는 그냥 29.1이라고 전형적으로 쓰면 됨.
  거리 = 속력 x 시간
  음속은 343.5m/s
  pulseIn 15000㎲
  343.5/second * 15000㎲ = 343.5*15000*10^-4
  이 식을 정리하면 결국 29.1이라는 값이 나온다 */
