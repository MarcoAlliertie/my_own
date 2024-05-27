//기본코드! (네이버부터 접속해보기!)

#include <WiFi.h>
#include <HTTPClient.h>

const char* ssid = "SMHRD_강의실C"; // WIFI ID
const char* password = "ccccc33333"; // WIFI PW

// Server 요청 주소
// 만들어 놓은 HTML코드가 시리얼모니터에 출력된다 
//GET방식
// ?data=100 전송해주고 싶은 데이터라는 변수 넣는다  
String address = "http://172.30.1.24:5000/?data=100";

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
}

void loop() {
  if ((WiFi.status() == WL_CONNECTED)) { //Check the current connection status

    http.begin(address);

    int httpCode = http.GET(); // 응답코드
    if (httpCode > 0) {

      Serial.println(httpCode); // 응답코드 출력
      result = http.getString(); // 응답 결과 저장
      Serial.println(result); // 응답 결과 출력

    }

    http.end(); //Free the resources
  } else {
    Serial.println("Error on HTTP request");
  }
  delay(500);
}
