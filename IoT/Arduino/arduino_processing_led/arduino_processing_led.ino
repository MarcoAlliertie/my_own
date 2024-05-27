int ledPin = 9;

void setup() {
  Serial.begin(9600);
  pinMode(ledPin, OUTPUT);
}

void loop() {
  if (Serial.available()) {
    int val = Serial.read();
    val = map(val, 0, 255, 0, 1023);
      analogWrite(ledPin, val);
  }
}
