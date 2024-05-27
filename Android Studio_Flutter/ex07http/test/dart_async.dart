import 'dart:io';
import 'dart:async';

void main() {
  orderProcess();
  showYoutube();
}

void orderProcess() async{ //async : 비동기로 바꾸는 코드
  //키오스크 가기 -> 음식 주문하기 -> 음식 받기 -> 집으로 돌아가기
  goKiosk();
  String menu = orderFood('빅맥');
  await getFood(menu); //await는 future 타입만 리턴 가능
  //<>제너릭스를 통해 리턴되는 타입을 지정해 줄 수 있습니다.
  goHome();
}

void goKiosk() {
  print('키오스크 줄 서기');
}

String orderFood(String menu) {
  print('$menu 주문하기');
  return menu;
}

Future<void> getFood(String menu) async{ //<void>는 음식을 말함. 만일 String을 받고 싶다면 <String>이라고 제너릭스를 써 주면 됨.
  //2초 후에 빅맥 받기
  //delay 주는 방법
  Duration delay = Duration(seconds: 2);
  //sleep(delay);
  await Future.delayed(delay,(){
    print('$menu 받기');
  });

}

void goHome() {
  print('집에 가기');
}

void showYoutube() {
  print('유튜브 보기');
}
