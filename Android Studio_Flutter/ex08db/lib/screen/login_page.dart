import 'dart:math';

import 'package:dio/dio.dart';
import 'package:ex08db/model/member_model.dart';
import 'package:ex08db/screen/join_page.dart';
import 'package:ex08db/screen/login_success_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final dio = Dio();
final storage = FlutterSecureStorage();

class ExLoginPage extends StatefulWidget {
  //생명주기인 initState() - 앱이 첫 시작할 때 실행되는 메서드

  const ExLoginPage({super.key});

  @override
  State<ExLoginPage> createState() => _ExLoginPageState();
}

class _ExLoginPageState extends State<ExLoginPage> {
  @override
  void initState() {
    //해당 storage에 데이터가 담긴 여부 확인

    //비동기로 메소드 실행 시키는 경우
    //첫 실행시 시작되는 생명주기
    //빌드된 이후 실행되는 콜백 메소드를 하나 생성

    //widgetBinding - 앱의 라이프 사이클 및 이벤트를 관리하는 클래스
    //instance - 현재 실행 중인 앱의 인스턴스를 접근
    //addPostFrameCallback - 위젯이 렌더링이 완료된 후 호출할 수 있도록 하는 콜백메소드
    WidgetsBinding.instance.addPostFrameCallback((timeStamp){
      readLoginInfo();
    });

  }

  void readLoginInfo()async{
  //storage에 있는 값을 read
    dynamic data = await storage.read(key: 'login');
    var user = memberModelFromJson(data);
    if(user!=null){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginSuccessPage(member: user[0]))
          ,(route) => false);
    }
  }

  TextEditingController emailCon = TextEditingController();
  TextEditingController pwCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인 페이지'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: emailCon,
                    decoration: InputDecoration(
                        label: Row(
                          children: [
                            Icon(Icons.account_circle),
                            Text("email 입력 "),
                          ],
                        ),
                        hintText: "example@example.com",
                        hintStyle: TextStyle(color: Colors.grey[300])),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      controller: pwCon,
                      decoration: InputDecoration(
                        label: Row(
                          children: [
                            Icon(Icons.key),
                            Text("pw 입력 "),
                          ],
                        ),
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent),
                        onPressed: () {
                          login(emailCon.text, pwCon.text, context);
                        },
                        child: Text('로그인하기')),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => JoinPage()));
                        },
                        child: Text('회원가입하기'))
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  color: Colors.grey[200],
                  width: double.infinity,
                  height: 2,
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void login(String id, pw, context) async {
  //pw : Dart는 자료형 생략 가능하다. 이 경우 dynamic type 됨.
  String url = 'http://222.102.104.239:8005/member/login';
  Response res = await dio.get(url,
      queryParameters: {'id': id, 'pw': pw
      });

  //쿼리문까지 적용된 url print 문으로 띄우기
  print(res.realUri);
  print(res==null);


  //리스트 형식으로 데이터
  var user = memberModelFromJson(res.data);
  print(user[0].id);
  print(user[0].pw);
  print(user[0].age);
  print(user.isEmpty);


  if (res.statusCode == 200 && !user.isEmpty){
    //value로 줄 값 - 유저의 정보 담는다. loginSuccess 페이지로 이동시 user의 값이 필요함
    try{
      await storage.write(key: "login" ,value: res.data);
    }catch(e){
    }
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute
      (builder: (context) => LoginSuccessPage(member: user[0],)), (route) => false);
    ;
  } else {
    ScaffoldMessenger
        .of(context)
        .showSnackBar(SnackBar(content: Text('아이디, 패스워드가 잘못 되었습니다.'))
    );}
    }