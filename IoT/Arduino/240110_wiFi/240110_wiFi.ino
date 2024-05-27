
#include <WiFi.h>
#include <HTTPClient.h>

const char* ssid = "SMHRD_강의실C"; // WIFI ID
const char* password = "ccccc33333"; // WIFI PW

// Server 요청 주소
String address = "http://218.157.38.65:5000";

String result = ""; // 응답 결과 저장
HTTPClient http; // 통신 객체

void setup() {
  Serial.begin(115200); // Baud rate
  
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.println("Connecting to WiFi..");
  }

  Serial.println("Connected to the WiFi network");
  pinMode(18,OUTPUT);
}

void loop() {
  if ((WiFi.status() == WL_CONNECTED)) { //Check the current connection status

    http.begin(address);

    int httpCode = http.GET(); // 응답코드
    if (httpCode > 0) {

      Serial.println(httpCode); // 응답코드 출력
      result = http.getString(); // 응답 결과 저장 -> 문자열 형태로 저장!!
      Serial.println(result); // 응답 결과 출력

    }


    http.end(); //Free the resources
  } else {
    Serial.println("Error on HTTP request");
  }
   
    digitalWrite(18,result.toInt());
    /*혹은
    /if(result == "1"){  cf) 자료형이 str이어야 하므로 큰따옴표로 감싸주어야. 작은 따옴표면 char라는 다른 자료형이 되어버린다.
      digitalWrite(18,1); 
    }*/

  
  delay(500);
  }
  
