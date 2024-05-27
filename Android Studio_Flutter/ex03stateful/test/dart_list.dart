void main(){
  //list 만드는 방법
  //List<type> 변수명 = []

  //<> : Generics
  //     - 타입을 체크해 주는 기능
  //     - 파이썬과는 달리 다트는 동적 자료형이 아니므로
  //     - 리스트의 자료형을 명확히 선언해 주어야 한다.
  //     - 다양한 타입을 다루는 자료형이나 메서드 컬렉션

  List<int> intList = [1,2,3,4,5];
  List<String> strList = ['hello','world'];
  List<dynamic> dyList = [1,'hello',3.14];

  //그럼 우리가 보아온 children:[]은?
  //위젯이라는 타입을 포함하고 있는 리스트라는 것!

  //list의 길이 - .length
  print(intList.length);

  //list의 값 추가 - .add
  strList.add('안녕하세요');

  //list의 값 가져오기 - 인덱싱
  print(dyList[0]);

  //list의 값 수정하기 - 인덱싱 후 값 삽입
  intList[1] = 10;

  //list 값 삭제하기 - 1)값을 삭제 .remove()
  dyList.remove(3.14);

  //list 값 삭제하기 - 2)인덱스로 삭제 .removeAt()
  strList.removeAt(0);

  //Generate 메서드
  //list.generate(만들 데이터의 개수, (변수 선언) => 증가시 변수에 적용될 식)

  List<int> intList2 = List<int>.generate(10, (index) => index++);

  print(intList2);

  //여기서 다시 main.dart로
}