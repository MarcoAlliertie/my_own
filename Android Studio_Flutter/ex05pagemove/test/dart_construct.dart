// 클래스 구성요소
// 1. 변수
// 2. 메서드
// 둘 다 필수인 것은 아니나 둘 중의 하나는 있어야..

// 생성자(constructor)
// - 객체가 생성될 때 실행되는 코드
// - 객체생성 키워드 : new
// ex) TextEditingController

//내가 객체 생성될 때 실행되는 코드를 작성할 수 있습니다.



void main() {
  // 객체 생성
  Animal dog = Animal('도담',
      8); //생성자는 객체가 생성될 때 실행되는 코드. 그러므로 밑에 생성자를 작성하면 생성자에서 매개변수를 요구하고 있으므로 여기서 객체 생성할 때도 매개변수가 필요해짐.
  // dog.name = '도담';
  // dog.age = 8;
}

class Animal {
  //String name;
  //int age;
  //초기화(변수 정의시 변수에 값 집어넣기)하라고 오류 뜸
  //근데 클래스에서는 반드시 변수 초기화하는 것은 아니다.
  //그럼 어떻게?

  //1. null 허용하는 ? 연산자 사용
  String? name; //필드 == 변수 == 인스턴스
  int age; //null 허용 연산자 삭제해도 오류가 나지 않는다.(아래쪽 설명 보기)

  //2. late 키워드
  //나중에 초기화하겠다.
  //late String type;

//생성자 - 메소드이나 반환타입은 작성하지 않음.
//생김새 클래스명과 동일(대소문자 구분)(매개변수)
//   Animal(String name, int age) {
//     //this 키워드 --> 나 자신(클래스 나 자신)
//     this.name = name; //클래스에 있는 name에 필드에 있는 name을 대입하겠다는 것
//     this.age = age;

  //필드와 매개변수가 일치할 경우 매개변수로 요약 가능
  //lint 클릭해서 convert 활용
  Animal(String this.name, int this.age);

//Animal 생성시 name과 age 값이 안 들어갈 경우 --> X
//값을 넣어야만 생성이 되므로.
//따라서 위에서 생성 필드의 ?(null 허용 연산자)삭제 가능!(학습 위해 int age는 삭제해줌!)
}
