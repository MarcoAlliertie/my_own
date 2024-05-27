import 'package:ex07http/screen/ex_b_page.dart';
import 'package:flutter/material.dart';

class ExAPage extends StatefulWidget {
  const ExAPage({super.key});

  @override
  State<ExAPage> createState() => _ExAPageState();
}

class _ExAPageState extends State<ExAPage> {


  //initState() 만들어보기 - 그냥 init..써주면 자동완성 뜬다
  @override
  void initState() {
  print('A페이지의 A init');
  //화면이 뜨자마자 실행하고 싶은 코드 있을 때 initState에 작성
  }

  //dispose() 만들어 보기 - 이것도 void 말고 바로 dis..부터
 @override
  void dispose() {
   print('A페이지의 A dispose');
   //B페이지로 이동해도 이거 실행 안 됨. 왜? 화면이 겹쳐 있는 상태
   //스택에 데이터가 쌓여 있으므로.
   //dispose는 화면이 우리 눈에 안 보일 때가 아니라 화면이 없어질 때 실행됨
   //그래서 B페이지로 넘어간 뒤 뒤로가기 누르면 B dispose는 실행됨.
   //밑에 Navigator.push를 pushAndRemoveUntil로 바꿔주고 route를 false로 설정해 주면
   //이제 종료될 때 dispose가 뜬다.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>ExBPage()),(route)=> false);
        }, child: Text('B페이지로 이동')),
      ),
    );
  }
}
