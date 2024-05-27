import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Ex06(),
    );
  }
}

class Ex06 extends StatefulWidget {
  const Ex06({super.key});

  @override
  State<Ex06> createState() => _Ex06State();
}

//
class _Ex06State extends State<Ex06> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellowAccent,
          title: Center(
              child: Text(
            '로그인 화면',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
        ),
        //GestureDetector 위젯
        //모든 위젯이 onpressed와 같은 행동을 감지하는
        //기능을 감지하는 것은 아님. 버튼, 라디오, 체크박스,
        //스위치 등등 몇 가지만.
        //그런데 제스쳐디텍터 위젯을 사용해서 위젯을 감싸게
        //되면 행동을 감지하는 기능이 생성됨.
        body: GestureDetector(
          onTap: () { //탭했을 때 일어나는 상태변화 익명함수
            //포커스를 잃는 코드
            FocusScope.of(context).unfocus();
          },
          //키보드가 올라왔을 때 pixel overflowed에러가
          //난 경우 스크롤을 만들어 주면 된다.
          //SingleChildScrollView로 감싸주면 끝남.
          //간단하고 단순한 스크롤을 만들어준다.
        child: SingleChildScrollView(
            child: Center(
              child: Container(
                padding: EdgeInsets.all(16),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset('./img/lion.gif'),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          label: Row(
                            children: [Text('email 입력')],
                          ),
                          hintStyle: TextStyle(color: Colors.grey[300]),
                          hintText: 'example@example.com',
                        ),
                      ),
                      TextField(
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: '비밀번호 입력'),
                      ),
                      ElevatedButton(onPressed: (){
                        setState(() {

                        });
                      }, child: Text('로그인하기'))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//텍스트필드
//텍스트필드 그 자체는 상태변화 없다. 텍스트 입력은 상태변화가 아님!
//그러나 텍스트필드에 입력한 값을 버튼 같은 걸 눌러 전송해 줘야
//하므로 관계가 있는 것
class Ex05TextField extends StatefulWidget {
  const Ex05TextField({super.key});

//textfield 내의 값을 가지고 오기 위해 controller가 필요!
  //tf는 각각의 controller가 필요
  //TextEditingController라는 객체 사용
  //객체 생성하는 법
  //객체명 변수명 = new 객체명

  @override
  State<Ex05TextField> createState() => _Ex05TextFieldState();
}

class _Ex05TextFieldState extends State<Ex05TextField> {
  //textfield 내의 값을 가지고 오기 위해 controller가 필요!

  TextEditingController emailCon = new TextEditingController();

  //다트는 new 키워드 생략 가능
  TextEditingController passCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              //컨트롤러 연결해 주기
              controller: emailCon,
              //키보드 타입 설정 - 이메일 앳 기호 띄우도록 : 유저친화적
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  label: Row(
                    children: [
                      Icon(Icons.account_circle),
                      Text('Email'),
                    ],
                  ),
                  hintText: 'example@example.co.kr',
                  hintStyle: TextStyle(color: Colors.grey)
                  //label과 labelText는 함께 사용할 수 없다
                  //위처럼 Row로 묶어서 글을 써주는 방식으로 해야

                  //hintText : placeholder 같은 기능
                  ),
            ),
            TextField(
              //컨트롤러 연결해 주기
              controller: passCon,
              //키보드 타입 설정 - 숫자 쓸 수 있도록
              //keyboardType: TextInputType.number,

              //패스워드 란 만들기
              //근데 다 노출됨
              //안 보이게 하려면?
              obscureText: true, //비밀번호처럼 * 표시
              decoration: InputDecoration(
                  label: Row(
                children: [Icon(Icons.key), Text('password')],
              )),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(emailCon.text))); //controller의 값 가지고 오는 방법
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(passCon.text)));
                },
                child: Text('로그인하기'))
          ],
        ),
      ),
    );
  }
}

//switch 학습

class Ex04Switch extends StatefulWidget {
  const Ex04Switch({super.key});

  @override
  State<Ex04Switch> createState() => _Ex04SwitchState();
}

class _Ex04SwitchState extends State<Ex04Switch> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //switch 작성방법 사실상 체크박스와 같다
            Switch(
                value: isChecked,
                onChanged: (isValue) {
                  setState(() {
                    isChecked = isValue;
                  });
                }),
            SwitchListTile(
                //이번엔 위 스위치와 동일한 변수를 사용하므로
                //같이 동작
                title: Text('안녕하세요'),
                activeColor: Colors.red,
                value: isChecked,
                onChanged: (isValue) {
                  setState(() {
                    isChecked = isValue;
                  });
                })
          ],
        ),
      ),
    );
  }
}

class Ex03RadioState extends StatefulWidget {
  const Ex03RadioState({super.key});

  @override
  State<Ex03RadioState> createState() => _Ex03RadioStateState();
}

enum Gender { man, woman }

//man,woman을 구성원으로 가지는 Gender라는 클래스 형성되는 것
class _Ex03RadioStateState extends State<Ex03RadioState> {
  Gender g = Gender.man;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('당신의 성별은?'),
            //value : 라디오의 고유 값 ,groupValue:기본값.
            //value와 groupValue의 값이 같을 때 선택된 것으로 인식
            //값이 다르면 선택되지 않은 것으로 인식하여 체크가 해체
            RadioListTile(
              title: Text('남성'),
              value: Gender.man,
              groupValue: g,
              onChanged: (value) {
                print(value);
                setState(
                  () {
                    g = value!;
                  },
                );
              },
            ),
            RadioListTile(
                title: Text('여성'),
                value: Gender.woman,
                groupValue: g,
                onChanged: (value) {
                  print(value);
                  setState(
                    () {
                      g = value!;
                    },
                  );
                })
          ],
        ),
      ),
    );
  }
}

class Ex02CheckTile extends StatefulWidget {
  const Ex02CheckTile({super.key});

  @override
  State<Ex02CheckTile> createState() => _Ex02CheckTileState();
}

class _Ex02CheckTileState extends State<Ex02CheckTile> {
  List<bool> isCheckedList = [false, false, false];
  List<String> hobbyList = ['운동', '게임', '베이킹'];

  //임시적으로 클릭한 취미를 담을 리스트
  List<String> hobbyCheckList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('당신의 취미는 무엇입니까?'),
            //CheckBoxListTile
            //CheckBox 그 자체에 체크를 하지 않아도
            //해당 Tile에 체크를 하면 체크가 된다.
            CheckboxListTile(
                title: Text(hobbyList[0]),
                //controlAffinity 체크박스의 위치 변경
                controlAffinity: ListTileControlAffinity.leading,
                value: isCheckedList[0],
                onChanged: (isValue) {
                  setState(() {
                    isCheckedList[0] = isValue!;
                    //조건이 true면 hobbyCheckList에 취미 값 넣어주기
                    //false면 지워주기
                    if (isCheckedList[0]) {
                      hobbyCheckList.add(hobbyList[0]);
                    } else {
                      hobbyCheckList.remove(hobbyList[0]);
                    }

                    //snack bar 만드는 방법
                    //of(context) : 해당 화면에 스낵바를 띄우겠다는 의미
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('$hobbyCheckList'),
                      duration: Duration(seconds: 5),
                    ));
                  });
                }),
            CheckboxListTile(
                title: Text(hobbyList[1]),
                //controlAffinity 체크박스의 위치 변경
                controlAffinity: ListTileControlAffinity.leading,
                value: isCheckedList[1],
                onChanged: (isValue) {
                  setState(() {
                    isCheckedList[1] = isValue!;

                    if (isCheckedList[1]) {
                      hobbyCheckList.add(hobbyList[1]);
                    } else {
                      hobbyCheckList.add(hobbyList[1]);
                    }
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('$hobbyCheckList'),
                      duration: Duration(seconds: 5),
                    ));
                  });
                }),
            CheckboxListTile(
                title: Text(hobbyList[2]),
                //controlAffinity 체크박스의 위치 변경
                controlAffinity: ListTileControlAffinity.leading,
                value: isCheckedList[2],
                onChanged: (isValue) {
                  setState(() {
                    isCheckedList[2] = isValue!;
                    if (isCheckedList[2]) {
                      hobbyCheckList.add(hobbyList[2]);
                    } else {
                      hobbyCheckList.add(hobbyList[2]);
                    }
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('$hobbyCheckList'),
                      duration: Duration(seconds: 5),
                    ));
                  });
                }),
          ],
        ),
      ),
    );
  }
}

class Ex02CheckBox extends StatefulWidget {
  const Ex02CheckBox({super.key});

  @override
  State<Ex02CheckBox> createState() => _Ex02CheckBoxState();
}

class _Ex02CheckBoxState extends State<Ex02CheckBox> {
  bool isChecked = false;
  List<bool> isCheckedList = [false, false, false];

  @override
  Widget build(BuildContext context) {
    //bool isChecked= false; //빌드메서드 재실행될 때마다 다시 이것도 선언되는 것
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //value - bool 타입 대입
            //onChanged - 매개변수 bool 타입
            Row(
              children: [
                Checkbox(
                    value: isCheckedList[0],
                    onChanged: (isValue) {
                      setState(() {
                        //isCheckedList[0] = !isCheckedList[0];

                        //isCheckedList[0] = isValue; null일 경우를 경고하는 것
                        isCheckedList[0] =
                            isValue!; //뒤에! : null이 절대로 올 수 없다고 하는 것. 사실상 강제.
                        //isValue는 value 안에 있는 값이 들어오는 것이므로 null이 될 수가 없다.
                      });
                    }),
                Text('안녕하세요')
              ],
            ),
            //value값 변경해본 결과 : value 값이 체크박스 체크 여부 결정짓는 거 확인
            //변수로 빼주자. return 안에 변수선언은 불가능하므로 return 위에
            //그래도 안 되는데? 그야 빌드 메서드가 다시 실행될 때 변수 선언도 다시 false로 되니까.
            //아예 class ~ 밑으로 빼주자!
            Checkbox(
                value: isCheckedList[1],
                onChanged: (isValue) {
                  setState(() {
                    isCheckedList[1] = !isCheckedList[1];
                    //체크박스 두 개로 만들고 클릭했더니 두 체크박스가 동시에 변함
                    //이걸 어떻게 할까? 리스트로! =>test 폴더의 dart_list에서 계속
                  });
                }),
            Checkbox(
                value: isCheckedList[2],
                onChanged: (isValue) {
                  setState(() {
                    isCheckedList[2] = !isCheckedList[2];
                  });
                  //이렇게 리스트로 만들어 주면 세 개의 체크박스가 다 별개로 동작
                })
          ],
        ),
      ),
    );
  }
}

class Ex01button extends StatefulWidget {
  const Ex01button({super.key});

  @override
  State<Ex01button> createState() => Ex01buttonState();
//책 65p 람다 형식 : Ex01buttonState()를 실행하겠다는 것
//함수명 앞의 _ : 이 main.dart 파일 안에서만 접근할 수 있는 프라이빗 변수라는 뜻
}

class Ex01buttonState extends State<Ex01button> {
  int num1 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              '$num1',
              style: TextStyle(fontSize: 100),
            ),
            ElevatedButton(
              onPressed: () {
                //num1++;
                //동작하지 않는다. 왜? setState()밖이라!

                setState(() {
                  num1++;
                });
                //setState 안에서 실행이 되어야 상태 변화가 일어난다
              },
              child: Text(
                '버튼',
                style: TextStyle(fontSize: 100),
              ),
            )
          ],
        ),
      ),
    );
  }
}
