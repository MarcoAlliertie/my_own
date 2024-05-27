// named method
//이름으로 파라미터의 값을 지정해 주기
//{}로 관리 - first, second 변수가 named parameter
void namedParameter(int i, {int first = 0, int second = 0}) {
  print('$i,$first,$second');
}

void main() {
  //호출. namedParameter는 꼭 입력하지 않아도 오류 안 난다.
  namedParameter(10);

  //namedParameter 값 변경하기 위해서는 변수명 : 값
  namedParameter(10,first: 20,second: 30);

  //호출할 때 변수의 순서는 상관없다.
  namedParameter(10,second: 20, first: 30);
}
