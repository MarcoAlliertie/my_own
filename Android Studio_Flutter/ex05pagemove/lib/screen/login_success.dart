import 'package:flutter/material.dart';
import 'package:ex05pagemove/screen/login_page.dart';

class LoginSuccessPage extends StatelessWidget {
  const LoginSuccessPage({super.key, required this.login_id});

  //const LoginSuccessPage({super.key}): 생성자다. 클래스 이름이랑 똑같이 생겼다. super.key는 named parameter
  //왜 named parameter에 집어넣었는가? 나중에 변수가 많아지면 순서가 헷갈릴 수 있음.
final String login_id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$login_id님 환영합니다.'),
      ),
    );
  }
}

class test extends StatelessWidget {
  const test({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
