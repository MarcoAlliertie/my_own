import processing.serial.*;
Serial port; 
int x;

void setup(){
  size(300,300);
  for(int index = 0; index< Serial.list().length; index++){
println("[" + index + "] >> " + Serial.list()[index]);
}
port = new Serial(this, Serial.list()[1], 9600); 
}
void draw() {
background(150); //색깔. 150은 밝은 회색
if(port.available() > 0) {
x = port.read();
if(x == 0) {
rect(100,100,50,50); //100, 100 지점을 좌상단으로 해서 길이 50, 높이 50의 사각형
} else {
ellipse(40,40,60,60); //40, 40을 중점으로 반지름이 60인 원을 그림(60이 두 개인 이유는 타원을 그릴 수도 있으므로)
}
}
}
