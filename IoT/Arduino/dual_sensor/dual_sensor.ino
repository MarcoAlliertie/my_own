int switchPin = 8;
int portPin = A0;
void setup() {
Serial.begin(9600);
pinMode(switchPin, INPUT);
}
void loop() {
int portVal = analogRead(portPin);
int switchVal = digitalRead(switchPin);
Serial.write(255);
Serial.write(map(portVal, 0, 1023, 0, 253));
Serial.write(switchVal);
Serial.write(254);
delay(100);
}