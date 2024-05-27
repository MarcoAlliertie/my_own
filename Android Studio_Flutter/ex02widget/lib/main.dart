import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EXCu(),
    );
  }
}

class EXCu2 extends StatelessWidget {
  const EXCu2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('더 보기'),
        backgroundColor: Colors.white, //그냥 연습상 써주는 거
        //AppBar에 우측 아이콘 넣는 법
        actions: [
          Icon(Icons.settings),
          SizedBox(
            width: 30,
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 80,
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(24),
            color: Colors.grey[300],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'CU님',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      'Friends',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          //color: Colors.purple,
                          color: Color(0xff751485)),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      '155p',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
              margin: EdgeInsets.all(16),
              alignment: Alignment.topLeft,
              child: Text(
                '서비스',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )),

          Container(
            margin: EdgeInsets.all(8),
            child: Row(
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        Icon(Icons.copyright, size: 50),
                        Positioned(
                          bottom: 3,
                          right: 3,
                          child: Container(
                            alignment: Alignment.center,
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: Colors.pinkAccent
                            ),
                            child: Text('N', style: TextStyle(
                              color: Colors.white,
                            ),),
                          ),
                        )
                      ],
                    ),
                    Text('포인트 충전소')
                  ],
                ),
                SizedBox(width: 20,),
                Column(
                  children: [
                    Stack(
                      children: [
                        Icon(Icons.chat, size: 50),
                        Positioned(
                          bottom: 3,
                          right: 3,
                          child: Container(
                            alignment: Alignment.center,
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: Colors.pinkAccent
                            ),
                            child: Text('N', style: TextStyle(
                              color: Colors.white,
                            ),),
                          ),
                        )
                      ],
                    ),
                    Text('상담하기')
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//내가 만든 것 : 미완성
class EXCu extends StatelessWidget {
  const EXCu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('더 보기'),
        backgroundColor: Colors.white, //그냥 연습상 써주는 거
        //AppBar에 우측 아이콘 넣는 법
        actions: [
          Icon(Icons.settings),
          SizedBox(
            width: 30,
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 8, right: 8),
            padding: EdgeInsets.only(left: 24, right: 24),
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text(
                      'CU님',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                Expanded(flex: 1, child: SizedBox()),
                Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Text(
                          'Friend ',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ' 155p',
                          textAlign: TextAlign.end,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ))
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 80,
            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '서비스',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Column(children: [
                  Stack(
                    children: [
                      Positioned(
                        child: Icon(
                          Icons.copyright,
                          size: 50,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                            color: Colors.pinkAccent,
                            borderRadius: BorderRadius.all(Radius.circular(3))),
                        child: Positioned(
                          top: 3,
                          left: 3,
                          child: Text(
                            'N',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '포인트 충전소',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  )
                ])
              ],
            ),
          )
        ],
      )),
    );
  }
}

class ExHeart extends StatelessWidget {
  const ExHeart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              child: Icon(
                Icons.favorite_border_sharp,
                size: 100,
              ),
            ),
            Visibility(
              //Visibility:요소들의 가시성 여부 결정하는 위젯.
              visible: true,
              child: Positioned(
                right: 8,
                top: 12,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      //borderRadius: BorderRadius.all(Radius.circular(100)),
                      shape: BoxShape.circle //위처럼 쓰든가 이것처럼 쓰면 원 나온다.
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//Positioned 위젯
class ExPosition extends StatelessWidget {
  const ExPosition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          //Positioned 위젯은 Stack 위젯과 함께 쓰이는 위젯
          //역할 : Stack의 자식 위젯 위치를 지정
          Positioned(
            //양쪽 모두 positioned의 top을 지정해줄 경우 짤리는 모습 나타나지 않음
            top: 20,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.red,
            ),
          ),
          Positioned(
            //코드상 상단에 위치하는 container에만
            //positioned를 지정해줄 경우 컨테이너가 시각적으로 사라짐

            //코드상 하단에 위치하는 container에만
            //positioned를 지정해줄 경우 컨테이너가 해당 숫자만큼 이동
            //단, stack 위젯의 크기를 지정해 주지 않고 (빨간색) 컨테이너보다
            //더 큰 숫자만큼의 이동을 하면 마치 사라진 것처럼 보인다.
            //지정을 하지 않는 이상 stack의 크기는 내부 컨테이너의 크기만큼이다.
            top: 150,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.green,
            ),
          ),
        ],
      )),
    );
  }
}

//Stack 위젯
class ExStack extends StatelessWidget {
  const ExStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          //Stack - 겹치기가 가능한 위젯
          //뒤에 작성할수록 위치적으로 위로 오게 된다.
          alignment: Alignment.center,
          children: [
            Container(width: 150, height: 150, color: Colors.red),
            Container(width: 100, height: 100, color: Colors.blue),
            Container(width: 50, height: 50, color: Colors.green)
          ],
        ),
      ),
    );
  }
}

class ExRow extends StatelessWidget {
  const ExRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: double.infinity,
        height: 100,
        color: Colors.green,
        child: Row(
          //end 끝으로 이동
          //mainAxisAlignment: MainAxisAlignment.end,

          //spaceBetween : 양 끝에 배치한 후 일정 간격으로 위젯을 배치
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,

          //spaceEvenly : 동일한 간격으로 배치
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          //spaceAround : 양팔 벌려 좌우로 나란히
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          //본인 축이 아닌 반대편 축의 정렬

          //end - cross축이 end
          //crossAxisAlignment: CrossAxisAlignment.end,

          //start - cross 축이 start
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Container(color: Colors.red, width: 20, height: 20),
            Container(color: Colors.yellow, width: 20, height: 20),
            Container(color: Colors.orange, width: 20, height: 20),
          ],
        ),
      ),
    ));
  }
}

class Ex07keypad extends StatelessWidget {
  const Ex07keypad({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.deepPurpleAccent,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            //1
                            child: TextButton(
                              onPressed: () {
                                print('코드 개길어');
                              },
                              child: Text(
                                '1',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                                ),
                              ),
                            ),
                          ),
                          //2
                          Expanded(
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                '2',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                                ),
                              ),
                            ),
                          ),
                          //3
                          Expanded(
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                '3',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //4,5,6
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                '4',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                '5',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                '6',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //7,8,9
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                '7',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                '8',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                '9',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //*,0,#
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                '*',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                '0',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                '#',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Ex06FlexibleExpanded extends StatelessWidget {
  const Ex06FlexibleExpanded({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Text('flexible, expanded 사용 안 할 때'),
          Row(
            children: [
              Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: Text("container1"),
              ),
              Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.orange,
                ),
                child: Text("container2"),
              ),
            ],
          ),
          //공사장 모양 - overflow 오류 발생
          Text('flexible 사용'),
          Row(
            children: [
              //flexible을 사용할시
              //화면을 넘어갈 경우 flex값(기본 1)의 비율에 따라
              //화면을 차지
              Flexible(
                flex: 2, //flex 비율을 2:1로 바꿨으므로 2:1로 화면에 표시됨
                child: Container(
                  width: 1700,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Text("container1"),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                  ),
                  child: Text("container2"),
                ),
              ),
            ],
          ),
          Text('flexible tight 사용'),
          Row(
            children: [
              Flexible(
                flex: 2,
                //fit은 loose와 tight가 존재
                //loose인 경우 여백이 남았을 때 여백 표시
                //tight인 경우 여백이 남아 있음에도 불구하고 채움
                //예컨대 오렌지색 컨테이너 너비를 10으로 정했다면
                //딱 10만큼만 표시하고 나머지 영역은 flex에도
                //불구하고 여백으로 표시하지만,
                //tight의 경우엔 너비 설정값과 상관없이 화면 끝까지
                //잡아당겨서 flex 값 비율대로 표시한다.
                fit: FlexFit.tight,
                child: Container(
                  width: 1700,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Text("container1"),
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                  ),
                  child: Text("container2"),
                ),
              ),
            ],
          ),
          Text('flexible flex 숫자 조정'),
          Row(
            children: [
              Flexible(
                flex: 2,
                //fit은 loose와 tight가 존재
                //loose인 경우 여백이 남았을 때 여백 표시
                //tight인 경우 여백이 남아 있음에도 불구하고 채움
                fit: FlexFit.tight,
                child: Container(
                  width: 1700,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Text("container1"),
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                  ),
                  child: Text("container2"),
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                  ),
                  child: Text("container2"),
                ),
              ),
            ],
          ),
          Text('Expanded 사용'),
          Row(
            children: [
              Expanded(
                flex: 2,
                //  - expanded는 flexible을 상속한 것.
                //  - 다만 flexible fit이 tight로 고정되어 있는 위젯.
                //fit: FlexFit.tight,
                child: Container(
                  width: 1700,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Text("container1"),
                ),
              ),
              Expanded(
                flex: 1,
                //fit: FlexFit.tight,
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                  ),
                  child: Text("container2"),
                ),
              ),
              Expanded(
                flex: 1,
                //fit: FlexFit.tight,
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                  ),
                  child: Text("container2"),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}

class Ex05kakao extends StatelessWidget {
  const Ex05kakao({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.yellowAccent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'image/talk.png',
                  width: 30,
                  height: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                Text('카카오톡으로 로그인하기')
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

// - SizedBox
// - 사용목적 1 : 자식위젯의 크기를 정하기 위해
//  - Container와 기능이 겹치는 것 아닌가?
//    - 요소(property)의 요소가 현저하게 적다.(width, height, child 값만 있음)
//    → 컴퓨터 입장에서 Container보다 가벼움.
//    → 자식위젯의 크기를 결정할 때만 쓰는 컴팩트한 위젯
//    → Container에서 크기만 조정했을 경우 lint(회색줄)이 쳐지면서 SizedBox 쓰길 권장함
// - 사용목적 2 : Row, Column 위젯의 사이 공간을 넣기 위해
//  → 위젯 사이에 SizedBox 위젯에 크기, 너비를 주면 그만큼 위젯들 사이 공간이 생기는 것

class Ex04SizedBox extends StatelessWidget {
  const Ex04SizedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          child: Row(
            children: [
              Text(
                'hello World',
                style: TextStyle(fontSize: 30),
              ),
              Container(
                //SizedBox로 위젯 사이에 생기는 공간을 보기
                //위해 컨테이너로 색칠해본 것
                color: Colors.red,
                child: SizedBox(
                  width: 50,
                  height: 50,
                ),
              ),
              ElevatedButton(onPressed: () {}, child: Text('버튼'))
            ],
          ),
        ),
      ),
    );
  }
}

class Ex03Container extends StatelessWidget {
  const Ex03Container({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          //width: 50,
          // width값이나 height값을 그냥 수치로 줄 경우
          // device 환경에 따라 원하는 모양이 안 나올 수 있다.
          // 이 경우 double 기능을 사용하면 된다.
          // double.infinity : 꽉 찬 모양
          width: double.infinity,
          height: 100,
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '아이유와 도미노를 더 맛있게',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '도미노 매니아 되고 ~40% 할인받자!',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(flex: 1, child: Image.asset('image/domino.png')),
            ],
          ),
        ),
      ),
    );
  }
}

class Ex02Container extends StatelessWidget {
  const Ex02Container({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              margin: EdgeInsets.fromLTRB(32, 32, 0, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  color: Colors.green[500]),
              child: Icon(
                Icons.call,
                color: Colors.white,
                size: 80,
              ),
            ),
            Container(
              width: 120,
              height: 120,
              margin: EdgeInsets.fromLTRB(32, 32, 0, 0),
              decoration: BoxDecoration(
                  color: Colors.red[500],
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              child: Icon(
                Icons.camera_alt_outlined,
                size: 80,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Ex01Container extends StatelessWidget {
  const Ex01Container({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //SafeArea - OS에 따라 앱의 구현화면이 침입되는 것을
      //피하기 위해 충분한 패딩을 주는 것
      body: SafeArea(
        child: Container(
          //color: Colors.green,
          width: 200,
          height: 200,
          //alignment: Alignment.center,
          //이렇게 하나 child인 Text를 Center로 감싸나
          //결과는 똑같다. 결국 코딩방법의 다양성 얘기임.

          //margin,padding 주는 방법 3가지 존재

          //1번 EdgeInsets.fromLTRB(0,0,0,0)
          //margin: EdgeInsets.fromLTRB(10, 10, 10, 10),

          //2번 EdgeInsets.all(double) - double 아니고 정수 써도 무방
          //margin: EdgeInsets.all(20),

          //3번 EdgeInsets.only() -> 원하는 위치만 margin 혹은 padding 줌
          //only메소드는 named parameter를 가지고 있음
          //  ㄴ named parameter 설명은 widget_test에
          margin: EdgeInsets.only(top: 10, left: 30),
          decoration: BoxDecoration(
              //위에 color랑 양립불가. 위에 color 여기서 주석처리함
              color: Colors.pinkAccent,
              border: Border.all(color: Colors.black, width: 10),
              //borderRadius: BorderRadius.only(topLeft: Radius.circular(50))
              //위 only도 named parameter. 전부 다 바꾸려면 아래처럼 all을 써줘야.
              borderRadius: BorderRadius.all(Radius.circular(50))),

          child: Center(
            child: Text(
              'hello world',
              style: TextStyle(fontSize: 32),
            ),
          ),
        ),
      ),
    );
  }
}
