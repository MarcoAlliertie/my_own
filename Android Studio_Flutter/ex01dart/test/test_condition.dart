void main() {

  //if(조건식){};
  int num1 = 10;
  if(num1==10){
    print("10입니다.");
  }else{
    print('10이 아닙니다.');
  }

  //else if(조건식)
  int score = 60;
  if(score>=80){
    print('A등급입니다.');
  }else if(score>=60){
    print('B등급입니다.');
  }else{
    print('재시험입니다.');
  }

  //switch문
  //switch(식){
  // case 값:
  // break;
  //
  //default:
  //if문에서 else문과 유사한 기능
  // }

  //flutter와 dart 버전이 업데이트되면서 break 생략 가능해짐

  //생략 안 되던 과거 - break를 쓰지 않으면 세상까지 출력됨
  //break를 만날 때까지 계속 switch문 동작
  String s1 = 'hello';
  switch(s1){
    case "hello":
      print("안녕");
      break;
    case "world":
      print("세상");
      break;
  }

  //생략 가능해진 현재

  int month = 3;
  switch(month){
    case 1:
    case 2:
    case 12:
      print("겨울입니다");
    case 3:
    case 4:
    case 5:
      print("봄입니다.");

    //dart 업데이트되면서 case 내 비교문도 가능
    case<8:
      print("여름입니다.");
    case<11:
      print("가을입니다.");

  }


}