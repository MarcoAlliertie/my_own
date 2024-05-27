import 'package:ex07listview/model/ryan_model.dart';
import 'package:flutter/material.dart';

class RyanDetail extends StatelessWidget {
  const RyanDetail({super.key,required this.r}); //required this.imgPath, required this.ryanName, required this.index});
  // final String imgPath;
  // final String ryanName;
  // final int index;

  //ryan_model에서 모델을 설정했으므로 그에 따른 객체를 생성
  //ryan_model 생성자에서 설정한 대로 아래의 r은 3개의 매개변수를 가지고 있다.
  //Ryan이라는 클래스 자체를 생성자로 쓰는 것. 마치 위의 String처럼
  //String도 클래스다. 그래서 int, bool 등과는 달리 대문자로 시작하는 것.
  final Ryan r;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${r.index+1}번째 라이언"),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(r.imgPath),
            SizedBox(
              width: 10,
            ),
            Text(
              r.ryanName,
              style: TextStyle(fontSize: 24),
            )
          ],
        ),
      ),
    );
  }
}
