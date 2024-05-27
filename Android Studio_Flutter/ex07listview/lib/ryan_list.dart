import 'package:ex07listview/model/ryan_model.dart';
import 'package:ex07listview/screen/ryan_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExRyanList extends StatefulWidget {
  const ExRyanList({super.key});

  @override
  State<ExRyanList> createState() => _ExRyanListState();
}

class _ExRyanListState extends State<ExRyanList> {
  var ryanName = ['리틀 라이언', '반짝 라이언', '하트하트 라이언', '춘식이와의 만남', '룸메는 춘식이', '좋아요'];
  var imgList = [
    'image/ryan01.jpg',
    'image/ryan02.png',
    'image/ryan03.jpg',
    'image/ryan04.png',
    'image/ryan05.png',
    'image/ryan06.jpg',
  ];

  //탭했을 때 팝업될 창 만들기
  //메서드로 빼고 있는데 showDialog를 부른 위젯의 정보(context)를
  //필수 요소로 요구하고 있으므로 context를 매개변수로 삼아 불러오자.

  //이미지와 타이틀도 담아둘 수 있게 매개변수로 지정해 주자!
  //index도 담아주자...사실 인덱스만 가져왔어도 됨
  void showPopUp(context, imgPath, title, index) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            //디자인 해주기
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              //width 값을 이렇게도 설정 가능하다!
              width: MediaQuery.of(context).size.width * 0.7,
              height: 380,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  //이미지 자체를 살짝 둥글게 만들어보자
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(imgPath)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(title),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            ryanName.removeAt(index);
                            imgList.removeAt(index);
                          });
                          //다이얼로그도 하나의 화면으로 보고 있음
                          //이전화면으로 돌아간다.
                          Navigator.pop(context);
                        },
                        child: Text(
                          '삭제하기',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        //버튼 색깔 바꿔주기
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            Navigator.pop(context);
                          });
                        },
                        child: Text(
                          '취소',
                          style: TextStyle(),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //folatingActionButton: 화면 위에 항상 떠 있는 버튼을 만들어줌.
      floatingActionButton: FloatingActionButton(onPressed: () {
        print('안녕');
        setState(() {
          //리스트에 추가, 삭제하는 법
          imgList.add("image/ryan01.jpg");
          ryanName.add('리틀라이언');
          //삭제는 밑에서 제스쳐 디텍터로 해 보자!
          //imgList.remove("image/ryan01.jpg");
          //ryanName.remove('리틀라이언');
        });
      }),
      body: SafeArea(
        child: ListView.builder(
            itemCount: imgList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                //온탭했을 때 팝업 뜨게 하기
                //코드가 길어서 메서드로 만들자.
                onTap: () {
                  //onTap을 페이지 이동으로 만들기 위해 showPopUp 주석처리
                  // setState(() {
                  //   showPopUp(context, imgList[index], ryanName[index], index);
                  // });
                  Navigator.push(context,
               //       MaterialPageRoute(builder: (context) => RyanDetail(r: Ryan(imgList[index], ryanName[index], index),)));

                      MaterialPageRoute(builder: (context) => RyanDetail(r: Ryan(imgList[index], ryanName[index], index),)));

                },
                onLongPress: () {
                  setState(() {
                    ryanName.removeAt(index);
                    imgList.removeAt(index);
                  });
                },
                //스와이프로 지워보기!
                //계속 하면 오류남. 나중에 비동기화 할 때 다시 학습해 보자.
                child: Dismissible(
                  //Dismissible : key를 필수요소로 함. key에는 해당 아이템의
                  //정보가 담김

                  //Dismiss했을 때 어떻게 할지 정하는 것
                  onDismissed: (direction) {
                    setState(() {
                      ryanName.removeAt(index);
                      imgList.removeAt(index);
                    });
                  },
                  key: Key(ryanName[index]),
                  child: Card(
                    //Card : 단조로운 Row 모양 대신 좀더 그럴싸한 카드 모양으로 바꿔줌
                    child: Row(
                      children: [
                        //오버플로우 발생!
                        //Expanded를 써서 화면 안에 균형있게 정리되도록
                        Expanded(
                            child: Image.asset(
                          '${imgList[index]}',
                        )),
                        Expanded(
                          child: Column(
                            children: [
                              Text("${index + 1}번째 라이언"),
                              Text("${ryanName[index]}")
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
