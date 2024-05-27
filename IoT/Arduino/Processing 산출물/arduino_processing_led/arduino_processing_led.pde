import processing.serial.*;

Serial serialPort;

void setup(){
  size(255,255);
  
  for(int index = 0; index < Serial.list().length; index++) {
println("[" + index + "] >> " + Serial.list()[index]);
}
serialPort = new Serial(this, Serial.list()[1], 9600);
}
void draw() {
println("mouseX = " + mouseX);
background(mouseX);
serialPort.write(mouseX);
}
