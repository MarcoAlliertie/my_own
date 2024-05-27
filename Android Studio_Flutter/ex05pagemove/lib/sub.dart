import 'package:ex05pagemove/main.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        body: Container(
        color: Colors.blue[200],
        width: double.infinity,
        height: double.infinity,
        child: Column(
        children: [
        Expanded(flex: 2, child: SizedBox()),
    Expanded(
    flex: 4,
    child: Text(
    '세 번째 페이지입니다',
    style: TextStyle(fontSize: 30),
    ),
    ),
    Expanded(
    flex: 2,
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => FirstPage(),));
      }, child: Text('이전 페이지로 이동'))
    ],
    ),
    )
    ],
    ),
    ),
    ),);
  }
}
