import 'package:ex08db/screen/login_page.dart';
import 'package:ex08db/send_message.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:dio/dio.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ExLoginPage());
  }
}



class Exhttp extends StatelessWidget {
  const Exhttp({super.key});

  void getHttp()async{
    //주의사항
    //서버 사용시 localhost 사용 불가
    // ㄴ localhost라고 작성시 핸드폰 서버로 접속
    http.Response res = await http.get(Uri.parse('http://222.102.104.239:8005/'));
    print(res.statusCode);
    print(res.body);
  }

  void getDio() async{
    Dio dio = Dio();
    //dio에도 response가 있지만 위에 http랑 헷갈리니까 여기서는 그냥 var 타입으로
    //http와는 달리 parse 안 해도 된다.
    var res = await dio.get('http://222.102.104.239:8005/');
    
    //res 출력시 http의 res.body와 같은 역할
    //단 이 자체가 String 타입은 아님
    print(res);
    //res.data ==> String으로 가져옴
    print(res.data[0]);
    print(res.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () {
          // getHttp();
          getDio();
        }, child: Text('http통신')),
      ),
    );
  }
}
