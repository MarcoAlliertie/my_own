//다트 언어
//main함수에서 동작을 함

void main() {
  //타입

  //정수형 - int
  int num1 = 10;

  //출력문 print()
  print(num1);

  //실수형 - double
  double d1 = 3.14;
  print(d1);

  //실행 단축키 : shift + f10

  //문자형 - string : 작은 따옴표, 큰 따옴표 무관
  String s1 = "안녕 세상아";
  print(s1);

  String s2 = 'hello world';
  print(s2);

  //삼중따옴표도 존재!
  String s3 = """안녕
  world
  bye""";
  print(s3);

  //논리형 - bool(파이썬과는 달리 소문자 시작)
  bool b1 = true;
  print(b1);

  //숫자형 - num
  num n = 10;
  print(n);

  //var 타입 존재
  var v1 = 'hello';
  print(v1);

  //dynamic 타입 존재
  dynamic dy1 = 'hello!';
  print(dy1);

  //var, dynamic의 차이점?
  //var - 한번 자료형이 할당되면 수정되지 않습니다!

  //v1 = 10; //안 되는 코드!
  v1 = '바꾼다'; //이건 되는 코드!
  print(v1);

  //dynamic 타입은 상관 x. 파이썬의 동적 자료형 같다.
  dy1 = 10;
  print(dy1);

  //var, dynamic 타입이 있는데 굳이 int,double 같은 자료형을 써야 하나?
  //코드 관리, 협업에 있어 자료형을 명확하게 정의 내리는 게 편함

  //포매팅
  String name = 'flutter';
  int version = 3;

  //$변수명으로 사용
  print('$name의 버전은 $version입니다');






}