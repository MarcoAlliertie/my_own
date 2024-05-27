import processing.serial.*;
Serial port;
int start, next;
int data1, data2;
PImage img, img2;

float rot = 0.0;
void setup() {
  size (512, 512, P3D);
  img = loadImage("wind.png");
  img2 = loadImage("car.jpg");
  for (int i=0; i<Serial.list().length; i++) {
    println("[" + i + "] >> " + Serial.list()[i]);
  }
  port = new Serial(this, Serial.list()[2], 9600);
}
void draw() {
  background(255);
  while (port.available () > 0) {
    int data = port.read();
    if (data==255) start = 1;
    else if (data==254) start = 0;
    if (start==1) {
      if (next==1) data1 = data * 2 ;
      else if (next==2) data2 = data;
      next++;
    } else {
      next = 0;
    }
  }
  translate(data1, data1, 0); //좌표를 (data1, data1)로 이동
  //image(img,
  //  -img.width/2,
  //  -img.height/2);
  pushMatrix();//매트릭스 추가
  translate(data1, data1, 0);
  //rotateX(rot);
  //rotateY(rot);
  rotateZ(rot); //회전 설정

  image(img2,
    -img2.width/2,
    -img2.height/2);//스케치 공간의 중심에 이미지의 중점을 맞춰서 출력. image 명령어는 스케치 공간의 중점을 0,0으로 전제하는 명령어. 즉 스케치 공간의 중점에서 X값의 절반, Y값의 절반만큼을 뺌으로써 스케치 공간의 중점을 이미지의 중점과 맞추는 것.  
  popMatrix();//메트릭스 삭제
  if (data2 == 1) {
    rot
      -= 0.25;
  }
}
