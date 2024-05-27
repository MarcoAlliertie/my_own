import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:OnBoarding());
  }
}


class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
        headerBackgroundColor: Colors.white,
        finishButtonText: 'Register',
        finishButtonStyle: FinishButtonStyle(
          backgroundColor: Colors.black,
        ),
        skipTextButton: Text('Skip'),
        trailing: Text('Login'),
        background: [
          Image.asset('img/onBoarding01.png',
              //width:double.infinity,
              //ㄴ부모 위젯의 크기까지 크겠다
              //즉 부모 위젯의 크기에 따라 크기가 달라짐
            width:MediaQuery.of(context).size.width),
          //MediaQuery.of(context).size.width
          // ㄴ 어플의 가로 길이만큼 키우겠다.

          Image.asset('img/onBoarding02.jpg',
          width:MediaQuery.of(context).size.width),
          Image.asset('img/onBoarding03.jpg',
              width:MediaQuery.of(context).size.width),
        ],
        totalPage: 2,
        speed: 1.8,
        pageBodies: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text('Description Text 1'),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text('Description Text 2'),
              ],
            ),
          ),
        ],

    );
  }
}


//animatedText 외부 라이브러리 응용
class ex02animatedText extends StatefulWidget {
  const ex02animatedText({super.key});

  @override
  State<ex02animatedText> createState() => _ex02animatedTextState();
}

class _ex02animatedTextState extends State<ex02animatedText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SizedBox(
          width: 250.0,
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 35,
              color: Colors.white,
              shadows: [
                Shadow(
                  blurRadius: 7.0,
                  color: Colors.white,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                FlickerAnimatedText('Flicker Frenzy'),
                FlickerAnimatedText('Night Vibes On'),
                FlickerAnimatedText("C'est La Vie !"),
              ],
              onTap: () {
                print("Tap Event");
              },
            ),
          ),
        ),
      ),
    );

  }
}


class Ex01toast extends StatelessWidget {
  const Ex01toast({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(onPressed: (){
          //이 안에 토스트 기능 복붙하기
            //복붙할 때는 import를 위해 ctrl + space 기능을
            //써 주자.
            Fluttertoast.showToast(
                msg: "뒤로 가기",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }, child: Text('토스트 띄우기')),
        ),
      ),
    );
  }
}

