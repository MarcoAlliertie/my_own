import 'package:ex05pagemove/screen/login_success.dart';
import 'package:flutter/material.dart';

class ExLogin extends StatelessWidget {
  const ExLogin({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailCon = TextEditingController();
    TextEditingController passwordCon = TextEditingController();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(40.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: emailCon,
              decoration: InputDecoration(labelText: 'ID'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: passwordCon,
              decoration: InputDecoration(labelText: 'PW'),
              keyboardType: TextInputType.text,
              obscureText: true,
            ),
            SizedBox(
              height: 40.0,
            ),
            ButtonTheme(
                minWidth: 100.0,
                height: 50.0,
                child: FloatingActionButton(
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 35.0,
                    ),
                    onPressed: () {
                      if (emailCon.text == 'flutter' &&
                          passwordCon.text == '1234') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => LoginSuccessPage(login_id: emailCon.text,)));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('정보가 일치하지 않습니다')));
                      }
                    })),
          ],
        ),
      ),
    );
  }
}
