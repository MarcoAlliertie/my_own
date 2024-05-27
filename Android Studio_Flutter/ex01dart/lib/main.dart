import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Ex03_2widget());
  }
}

class Ex03_2widget extends StatelessWidget {
  const Ex03_2widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '두번째 예제',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green[200],
      ),
      body: Row(
        children: [
          Image.asset(
            'image/ryan.jpg',
            width: 120,
            height: 120,
          ),
          Text(
            '안녕 내 이름은 라이언이야',
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}

class Ex03widget extends StatelessWidget {
  const Ex03widget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //해당 위젯의 필수요소는 ctrl로 살펴봤을 때
        //required가 뜬다. 그런데  appBar는 required가 아니므로
        //꼭 쓸 필요 없다.
        appBar: AppBar(
          title: Text('첫번째 예제', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.pinkAccent,
        ),
        body: Center(
          child: Column(
            children: [
              Image.asset(
                'image/ryan.jpg',
                height: 120,
                width: 120,
              ),
              Text('너의 이름은'),
            ],
          ),
        ),
        //SafeArea : 상단 공간만큼 띄워주는 것
      ),
    );
  }
}

class Ex02widget extends StatelessWidget {
  const Ex02widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('두번째 예제'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Text('안녕'),
          TextField(),
          //이미지 옮길 시 주의사항
          //drag and drop할 경우 실제 경로가 변경
          Image.asset(
            'image/ryan.jpg',
            // width: 50,
            // height: 50,
          ),

          //이미지, 영상과 같이 외부에서 가지고 온 파일을
          //읽고 싶은 경우 환경설정 필요

          //왼쪽 클릭하면 빨간 원 같은 게 뜨는데
          //거기까지만 코드 실행하라는 뜻
          //VS Code 등 다른 툴에서도 동일하다.
        ],
      ),
    );
  }
}

//stless - stateless 약자
//ctrl + space 자동완성

class Ex01widget extends StatelessWidget {
  const Ex01widget({super.key});

  @override
  Widget build(BuildContext context) {
    // return const Text('안녕');
    return Scaffold(
      //scaffold 비계

      //높은 곳에서 작업할 수 있도록 설치한 큰 틀 - 쌓아올릴 수 있음
      //dart에서는 앱의 큰 틀을 의미

      //appbar를 구성하기 위한 방법은 별도로 존재
      appBar: AppBar(
        //ctrl키 누르고 AppBar클릭하면 구성요소(property)나온다.
        backgroundColor: Colors.deepPurple,
        title: Text('My first app'),
      ),
      //crtrl키 누르고 Scaffold 클릭하면 요소로 body 있다는 것 확인 가능

      body: Row(
        children: [
          Text(
            'hello world',
            //textAlign: TextAlign.center, - body를 Center로 하면 굳이 필요없다
            //작동되지 않는 것...처럼 보인다.
            //위젯이 생성될 때 크기는 해당 위젯의 크기
            //고로 위젯의 크기 자체를 설정해 주지 않으면 딱 hello world라는
            //글자 크기 만큼만 설정되고 거기서 가운데 정렬이 된 것.

            //alt + enter 이미 생성된 위젯 이름 위에 커서 두고 누르면 다른 위젯으로 감싸는 기능
            style: TextStyle(
                backgroundColor: Colors.black87,
                color: Colors.amber[900],
                fontSize: 30),
          ),
          Text('안녕하세요'),
          //Icon위젯
          //내장아이콘 : 색깔, 크기도 바꿀 수 있다.
          Icon(
            Icons.alarm,
            color: Colors.blue,
            size: 100,
            //이쯤에서 자동정렬 : ctrl + alt + l
          ),
          //Icon 버튼 위젯 : 클릭이벤트가 이미 걸려져 있는 상태의 버튼 위젯
          IconButton(
              onPressed: () {
                print("hi");
              },
              icon: Icon(Icons.access_time))
        ],
      ),
      //ctrl + space 누르면 기능을 추천해 줌
      //fontSize의 단위 : 로지컬 픽셀(lp) - Dart에서만 쓰는 것
      //lp - 디바이스의 고유 픽셀 단위. 디바이스별로 크기가 달라짐.
    );
  }
}
