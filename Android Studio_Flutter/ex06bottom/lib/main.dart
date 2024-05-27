import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExCarrotBottom(),
    );
  }
}


//원호쌤 코드(ExCarrotMy까지)
class ExCarrotBottom extends StatefulWidget {
  const ExCarrotBottom({super.key});

  @override
  State<ExCarrotBottom> createState() => _ExCarrotBottomState();
}

class _ExCarrotBottomState extends State<ExCarrotBottom> {
  int _selectedIndex = 0;
  List<Widget> _widgetList = [
    ExCarrotHome(),
    ExCarrotLife(),
    ExCarrotLocation(),
    ExCarrotChat(),
    ExCarrotMy()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('금호동'),
        actions: [
          Icon(Icons.menu),
          SizedBox(
            width: 20,
          ),
          Icon(Icons.search),
          SizedBox(
            width: 20,
          ),
          Icon(Icons.add_alert)
        ],
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: _widgetList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '홈',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.chrome_reader_mode_outlined), label: '동네생활'),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined), label: '내근처'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('image/chat_rounded.png'),),
              label: '채팅'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: '나의 당근'),
        ],
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedIconTheme: IconThemeData(fill: 0.5),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}


class ExCarrotHome extends StatelessWidget {
  const ExCarrotHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent[200],
      child: Center(
        child: Text('당근마켓 홈페이지입니다.'),
      ),
    );
  }
}

class ExCarrotLife extends StatelessWidget {
  const ExCarrotLife({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent[200],
      child: Center(
        child: Text('당근마켓 동네생활입니다.'),
      ),
    );
  }
}

class ExCarrotLocation extends StatelessWidget {
  const ExCarrotLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent[200],
      child: Center(
        child: Text('당근마켓 내근처입니다.'),
      ),
    );
  }
}

class ExCarrotChat extends StatelessWidget {
  const ExCarrotChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pinkAccent[200],
      child: Center(
        child: Text('당근마켓 채팅입니다.'),
      ),
    );
  }
}

class ExCarrotMy extends StatelessWidget {
  const ExCarrotMy({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purpleAccent[200],
      child: Center(
        child: Text('당근마켓 나의당근입니다.'),
      ),
    );
  }
}



class puA extends StatelessWidget {
  const puA({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.purpleAccent[200],
        ),child: Center(child: Text('당근마켓 홈페이지입니다')));
  }
}

class pA extends StatelessWidget {
  const pA({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
      color: Colors.pinkAccent[200],
    ),child: Center(child: Text('당근마켓 홈페이지입니다')));
  }
}

class gA extends StatelessWidget {
  const gA({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.greenAccent[200],
        ),child: Center(child: Text('당근마켓 홈페이지입니다')));
  }
}

class bA extends StatelessWidget {
  const bA({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blueAccent[200],
        ),child: Center(child: Text('당근마켓 홈페이지입니다')));
  }
}

class oA extends StatelessWidget {
  const oA({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.orangeAccent[200],
        ),child: Center(child: Text('당근마켓 홈페이지입니다')));
  }
}

class ExCarrotBottom_2 extends StatefulWidget {

  const ExCarrotBottom_2({super.key});

  @override
  State<ExCarrotBottom_2> createState() => _ExCarrotBottom_2State();
}

class _ExCarrotBottom_2State extends State<ExCarrotBottom_2> {
  int _selectedIndex = 0;
  List<Widget> list = [oA(),bA(),gA(),pA(),puA()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('금호동'),
            actions: [
              Row(
                children: [
                  Icon(Icons.menu),
                  Icon(Icons.search_outlined),
                  Icon(Icons.add_alert)
                ],
              ),
            ],
          ),
          body: list[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.chrome_reader_mode_outlined),
                    label: '동네생활'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.location_on_outlined), label: '내 근처' ),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('img/chat.png')), label: '채팅'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_2_outlined), label: '나의 당근'),
              ],
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.black,
              backgroundColor: Colors.transparent,
              showUnselectedLabels: true,
              currentIndex: _selectedIndex,
              onTap: (value) => {
                    setState(() {
                      _selectedIndex = value;
                    }),
                  })),
    );
  }
}

class ExBottom extends StatefulWidget {
  const ExBottom({super.key});

  @override
  State<ExBottom> createState() => _ExBottomState();
}

class ExFirstPage extends StatelessWidget {
  const ExFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('첫 번째 페이지입니다.');
  }
}

class ExSecondPage extends StatelessWidget {
  const ExSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('두 번째 페이지입니다.');
  }
}

class ExThirdPage extends StatelessWidget {
  const ExThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('세 번째 페이지입니다.');
  }
}

class _ExBottomState extends State<ExBottom> {
  int selected_index = 0;

  //위젯도 리스트에 담을 수 있다.
  List<Widget> widgetList = [ExFirstPage(), ExSecondPage(), ExThirdPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom navigation bar 예제'),
      ),
      //body에 위젯리스트의 구성원을 집어넣어서 화면에 구현
      //이걸로 화면전환할 수 있다.
      body: widgetList[selected_index],
      //BottomNavigationBar()위젯
      bottomNavigationBar: BottomNavigationBar(
        items: [
          //BottomNavigationBarItem 들어감
          //BottomNavigationBarItem 하나만 작성되어도 에러가 나고
          //label 작성 안 해줘도 에러가 난다.
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_alert_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '')
        ],
        //아이템의 인덱스로 선택된 화면을 알 수 있음

        selectedItemColor: Colors.yellowAccent,
        backgroundColor: Colors.red[800],
        //label 미출력. 이거 안해주면 라벨 위치 때문에 아이콘이 미묘하게 위치 틀어짐.
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selected_index,
        //바뀌면 선택된 아이콘 바뀐다.
        onTap: (index) {
          setState(() {
            selected_index = index;
          });
        },
      ),
    );
  }
}
