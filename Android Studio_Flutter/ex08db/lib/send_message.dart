import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ExSend extends StatelessWidget {
  const ExSend({super.key});

  void sendData() async{
    //서버랑 연결이 된 후 
    //값 보내주기
    Dio dio = Dio();
    //대기
    Response res = await dio.get('http://222.102.104.239:8005/test',
        queryParameters: {'id':'1234'} );
    //값 보내주기 - get(queryParameters)

    //queryParameters = {k:v}

    print(res.statusCode);
    print(res.data);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          sendData();
        }, child: Text('값 보내기')),
      ),
    );
  }
}
