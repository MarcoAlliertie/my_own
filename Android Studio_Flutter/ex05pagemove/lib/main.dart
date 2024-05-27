import 'package:ex05pagemove/config/route_name.dart';
import 'package:ex05pagemove/screen/blue_page.dart';
import 'package:ex05pagemove/screen/green_page.dart';
import 'package:ex05pagemove/screen/login_page.dart';
import 'package:ex05pagemove/screen/red_page.dart';
import 'package:ex05pagemove/sub.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      //첫페이지의 라우트를 지정
      initialRoute: '/',
        //map 써보기
        // routes: {
        //   '/red': (context) => ExRedPage(),
        //   '/blue': (context) => ExBluePage(),
        //   '/green': (context) => ExGreenPage(),
        // },
        routes: nameRoutes,
        home: ExRouting());
  }
}

class ExRouting extends StatelessWidget {
  const ExRouting({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/red');
                    },
                    child: Text('빨간 페이지로 이동')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/blue');
                    },
                    child: Text('파란 페이지로 이동')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'green');
                    },
                    child: Text('녹색 페이지로 이동')),
              ],
            ),
          )),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.red[200],
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Expanded(flex: 2, child: SizedBox()),
              Expanded(
                flex: 4,
                child: Text(
                  '첫 번째 페이지입니다',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          //페이지 이동을 위해서는 Navigator 사용
                          //화면관리는 stack으로 한다.
                          //push,pop
                          //context는 현재 보고 있는 화면
                          //이미 빌드메서드에 context 담겨져 있으므로
                          //건드릴 필요 없음.

                          //route:
                          //MaterialPageRoute() 사용
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => SecondPage()));
                          //builder의 리턴타입이 위젯인데 왜 class인 SecondPage()를 리턴값으로 쓸 수 있는가?
                          //SecondPage 자체가 StatelessWidget 상속. 결국 SecondPage도 위젯!
                          //여기서는 push와 동시에 stack에 해당 페이지가 쌓이면서 디스플레이되는 것
                          //context는 어디까지나 부르는 페이지에 대한 정보를 담고 있는 것
                          //pop이 된 페이지 정보는 그냥 스택에서 날아간다.
                          Navigator.pushNamed(context, '/red');
                        },
                        child: Text('두 번째 페이지로 이동')),
                    ElevatedButton(
                        onPressed: () {
                          //pushAndRemoveUntil(페이지 이동하고 이전 페이지 스택에서 전부 제거)

                          //Navigator.pushAndRemoveUntil(
                          //    context, MaterialPageRoute(builder: (context) =>
                          //    ThirdPage()), (route) => false);
                          //(route) => true로 바꾸면 페이지 삭제 안합니다.

                          //pushReplacement
                          //삭제가 아닌 대체

                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => ThirdPage()));
                          //context는 너무 자주 쓰기 때문에 _로 생략 가능
                        },
                        child: Text('세 번째 페이지로 이동'))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.green[200],
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Expanded(flex: 2, child: SizedBox()),
              Expanded(
                flex: 4,
                child: Text(
                  '두 번째 페이지입니다',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          //Navigator.push(
                          //push를 썼을 때 문제점
                          //화면이 계속 스택에 쌓임.
                          //계속되면 오버플로우 발생.

                          //화면이 2개인 경우 이전 페이지로 이동시 pop 쓰면 된다.
                          //페이지가 3개 이상이면?
                          Navigator.pop(context);
                        },
                        child: Text('이전 페이지로 이동')),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
