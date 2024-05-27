void main(){
  //dict 구조랑 유사
  //key:value 의 자료구조

  //Map<key의 자료형 : value의 자료형> 변수명 = {};

  //k- string, v - string

  Map<String,String> strMap = {'hello':'안녕'};

  //Map에서 key 값은 unique, value값은 아니다.
  //사실상 파이썬의 dictionary라고 부르는 게 다른
  //언어에선 map이라고 부르는 것

  Map<String,dynamic> dyMap = {"one":1,"안녕":"hello"};

  //값을 가지고 오는 법 변수명[키값]

  print(strMap['hello']);

  //삭제 : .remove(키값)

  strMap.remove('one');

  //containsKey
  //containsValue

  // containsKey(키값)
  //containsValue(밸류값)
}