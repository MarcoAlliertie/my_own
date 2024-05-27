#include<Wire.h>

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  Wire.begin();
  while(!Serial){ }
  Serial.print("");

  for(byte i =1; i<120; i++){
    Wire.beginTransmission(i);

    if(Wire.endTransmission()==0){
      Serial.print("Address: ");
      Serial.print("Ox"); Serial.println(i,HEX);
      delay(10);
    }
  }
}

void loop() {
  // put your main code here, to run repeatedly:
}