#include <LiquidCrystal.h>
#include <DHT.h>
#define DHTPIN 26      // Digital pin connected to the DHT sensor
#define DHTTYPE DHT11  // DHT 11
DHT dht(DHTPIN, DHTTYPE);
const int rs = 14, en = 12, d4 = 13, d5 = 5, d6 = 23, d7 = 19;
LiquidCrystal lcd(rs, en, d4, d5, d6, d7);

byte do[8] = {
  B11100,
  B10100,
  B11100,
  B00000,
  B00000,
  B00000,
  B00000,
  B00000
};

void setup() {
  lcd.createChar(1,do);
  lcd.begin(16, 2);
  dht.begin();  
}

void loop() {
  float h = dht.readHumidity();
  float t = dht.readTemperature();
  lcd.setCursor(0,0);
  lcd.print("H : ");
  lcd.print(h);
  lcd.print("%");
  lcd.setCursor(0,1);
  lcd.print("T : ");
  lcd.print(t);
  lcd.write(byte(1));
}