void main() {
//산술연자는 사칙연산 파이썬과 같다
//다만 나누기 관련해서 좀 다른 것들

// / 나누기ㅣ(double로 형 변환)
// % 나머지
// ~/ 몫 연산자

int num1 = 10;
int num2 = 7;

print(num1/num2);

//파일이 바뀐 경우는 shift + f10으로 실행하면 이전 파일이 실행됨
//최초 한 번은 우측클릭 + run 해줘야

//int num3 = num1/num2;
//나누기는 나눌시 double로 자동 형 변환되므로 위 코드는 오류
  double num3 = num1/num2;
//이게 제대로 된 코드

//몫 ~/
print(num1~/num2);

//형변환(casting)
int i = 10;
String s = '20';
double d = 3.14;

//dart는 숫자형이 아닌 다른 형과 연산하는 것이 불가능
//print(i+s);  <- 이 코드는 에러

//String -> int
//int.parse(문자열)

print(i+int.parse(s));

//String -> double
//double.parse(문자열)
  print(d+double.parse(s));
  print(i+double.parse(s)); //실수값과 정수값은 연산 가능

//int or double -> String
//.toString()

print(i.toString()+s);
print(d.toString()+s);


}