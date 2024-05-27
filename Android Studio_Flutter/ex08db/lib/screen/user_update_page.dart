import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart';

final dio = Dio();

class UpdatePage extends StatelessWidget {
  const UpdatePage({super.key,required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    TextEditingController input_id =
    TextEditingController(text: id); // controller이용해서 값 고정
    //컨트롤러 내 매개변수를 text로 작성
    TextEditingController input_pw = TextEditingController();
    TextEditingController input_age = TextEditingController();
    TextEditingController input_name = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('회원수정 페이지'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
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
              //readOnly : 수정 불가능하게 하는 코드
              readOnly: true,
              controller: input_id,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                label: Row(
                  children: [
                    Icon(Icons.key),
                    Text("비밀번호 입력 "),
                  ],
                ),
              ),
              keyboardType: TextInputType.text,
              obscureText: true,
              controller: input_pw,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  label: Text("나이 입력 "),
                  hintText: "20",
                  hintStyle: TextStyle(color: Colors.grey[300])),
              keyboardType: TextInputType.number,
              controller: input_age,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  label: Text("이름 입력 "),
                  hintText: "플러터",
                  hintStyle: TextStyle(color: Colors.grey[300])),
              keyboardType: TextInputType.text,
              controller: input_name,
            ),
          ),
          ElevatedButton(onPressed: () {
            memberUpdate(id, input_pw.text,input_age.text, input_name.text, context);

          }, child: Text('회원 수정'))
        ],
      ),
    );
  }
}

void memberUpdate(id,pw,age,name, context)async{
  String url = 'http://222.102.104.239:8005/member/update';

  Response res = await dio.get(url, queryParameters: {
    "id":id,
    'pw':pw,
    'age':age,
    'name':name
  });

  print(res.realUri);
  if(res.statusCode==200){
    if(res.toString()=='success'){
      Navigator.pop(context);
    }
  }
}