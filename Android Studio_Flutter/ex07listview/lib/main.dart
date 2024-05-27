import 'package:ex07listview/ryan_list.dart';
import 'package:ex07listview/screen/baemin.dart';
import 'package:ex07listview/screen/img_widget.dart';
import 'package:ex07listview/screen/ryan_detail.dart';
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
      home: ExBaemin(),
    );
  }
}



class ExCountGridView extends StatelessWidget {
  const ExCountGridView({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> intList = List<int>.generate(100, (index) => index++);
    return Scaffold(
        body: SafeArea(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

              mainAxisExtent: 20, //항목의 수평 크기
              crossAxisSpacing: 20, //교차 축 방향으로의 항목 간 간격

                //화면에 몇 개 집어넣을지 개수 정하기
                //상대적으로 코드가 단순하지만 디바이스의 화면 크기에 따라서
                //화면디자인이 이상해질 수 있다.
              crossAxisCount: 3
            ),
            //itemCount 코드 없으면 데이터 개수가 넘어갈 시 에러남
            itemCount: intList.length,
            itemBuilder: (context, index) {
              return Container(
                height: 50,
                width: 50,
                color: Colors.greenAccent,
                child: Text('${intList[index] + 1}번째 '),
              );
            },
          ),
        ));
  }
}





class ExGridView extends StatelessWidget {
  const ExGridView({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> intList = List<int>.generate(100, (index) => index++);
    return Scaffold(
        body: SafeArea(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100, //숫자로 작성
          //(디바이스의 가로길이 / maxCrossAxisExtent 숫자) +1 ==> 가로에 출력될 데이터 개수
          //즉 디바이스 가로길이가 450이면? 4.5+1 = 5.5인데 .5는 버려서 화면에 5개의 데이터가 출력됨
          mainAxisExtent: 40, //수평패딩
          crossAxisSpacing: 20, //수직패딩
        ),
        //itemCount 코드 없으면 데이터 개수가 넘어갈 시 에러남
        itemCount: intList.length,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            width: 50,
            color: Colors.greenAccent,
            child: Text('${intList[index] + 1}번째 '),
          );
        },
      ),
    ));
  }
}

class ExhorizontalListView extends StatelessWidget {
  const ExhorizontalListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> intList = List<int>.generate(100, (index) => index++);

    return Scaffold(
      body: SafeArea(
          child: ListView.builder(
        //horizontal로 리스트 뷰 만들기
        //scrollDirection Axis.horizontal
        scrollDirection: Axis.horizontal,
        itemCount: intList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            width: 100,
            color: Colors.green[100],
            child: Text('${intList[index] + 1}번째 안녕하세요'),
          );
        },
      )),
    );
  }
}

class ExSimpleListView extends StatelessWidget {
  const ExSimpleListView({super.key});

  @override
  Widget build(BuildContext context) {
    //1~100까지 이루어진 리스트
    //generate 메소드
    List<int> intList = List<int>.generate(100, (index) => index++);

    return Scaffold(
      body: SafeArea(
          //리스트뷰 빌더를 이용해 리스트뷰를 효율적으로 출력할 수 있다.
          //한 번에 모든 데이터를 로딩하는 게 아니라 스크롤을 내릴 때 불러옴
          child: ListView.builder(
        //아이템의 개수
        itemCount: intList.length,
        //아이템 빌더
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            color: Colors.green[100],
            child: Text('${intList[index] + 1}번째 안녕하세요'),
          );
        },
      )),
    );
  }
}
