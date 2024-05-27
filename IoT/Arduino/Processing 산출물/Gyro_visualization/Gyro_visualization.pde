import processing.serial.*;
Serial myPort
;
float x, y, z;
String[] dataString
;
String inString
;
void setup() {
size(480, 480, P3D);
noStroke(); //3D 객체의 테두리를 제거
colorMode(RGB, 256);
background(0); //배경을 검정색으로
myPort = new Serial(this, Serial.list()[2], 9600);
}
void draw_rect
(int r, int g, int b) {
scale(90); //3D 객체의 크기 90으로 설정
beginShape(QUADS); //사각형 3D 객체를 그리기 시작한다.
fill(r, g, b); //해당 색으로 사각형을 그린다
vertex( //육면체이므로 6개의 사각형을 그린다
-1, 1.5, 0.25);
vertex( 1, 1.5, 0.25);
vertex( 1,
-1.5, 0.25);
vertex(
-1,
-1.5, 0.25);
vertex( 1, 1.5, 0.25);
vertex( 1, 1.5,
-0.25);
vertex( 1,
-1.5,
-0.25);
vertex( 1,
-1.5, 0.25);
vertex( 1, 1.5,
-0.25);
vertex(
-1, 1.5,
-0.25);
vertex(
-1,
-1.5,
-0.25);
vertex( 1,
-1.5,
-0.25);
vertex(
-1, 1.5,
-0.25);
vertex(
-1, 1.5, 0.25);
vertex(
-1,
-1.5, 0.25);
vertex(
-1,
-1.5,
-0.25);
vertex(
-1, 1.5,
-0.25);
vertex( 1, 1.5,
-0.25);
vertex( 1, 1.5, 0.25);
vertex(
-1, 1.5, 0.25);
vertex(
-1,
-1.5,
-0.25);
vertex( 1,
-1.5,
-0.25);
vertex( 1,
-1.5, 0.25);
vertex(
-1,
-1.5, 0.25);
endShape();
}
void draw() {
if(myPort.available() > 0) {
inString = myPort.readString();
dataString = split(inString, ':');
try {
x = float(dataString[0]);
y = float(dataString[1]);
z = float(dataString[2]);
background(0);
lights();
text(x, (int)(width/2.0)
-120, 30);
text(y, (int) (width/2.0)
-60, 30);
text(z, (int) (width/2.0), 30);
pushMatrix();
translate(width/2, height/2,
-50);
rotateX(radians(
-x));
rotateY(radians(
-y));
draw_rect(249, 250, 50);
popMatrix();
} catch (Exception e) { }
}
}
