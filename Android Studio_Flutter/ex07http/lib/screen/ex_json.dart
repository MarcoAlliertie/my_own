import 'package:ex07http/model/jsonsample_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExJson extends StatefulWidget {
  //async와 await로 json 데이터를 파싱해서 가져오면 상태변화가 생김 -> stateful로 만들어야
  const ExJson({super.key});

  @override
  State<ExJson> createState() => _ExJsonState();
}

class _ExJsonState extends State<ExJson> {
  //리스트 - json 파싱을 통해서 가지고 온 데이터
  List<SampleJson> user = [];

  //메소드 - 파싱 실행하는 메소드
  Future<List<SampleJson>> getInfo() async {
    String url = 'https://jsonplaceholder.typicode.com/users';
    //var response = await http.get(Uri.parse(url));
    //get방식 말하는 것. get으로 서버에서 응답 올 때까지 기다리겠다는 것.
    //그러므로 Future 방식을 써 주는 것이다.
    //Future 타입 왜 안 되지...? 일단 var타입으로 수업 진행
    
    //Future 타입이 아니라 Response 타입이었는데 선생님이 착오한 것!
    //위에서 http를 as http라고 했으므로 http.Response가 되는 것
    http.Response response = await http.get(Uri.parse(url));

    print(response.statusCode);
    //200 - 정상
    //404 - not found
    //500 - 서버 에러

    if (response.statusCode == 200) {
      //print(response.body); //json을 파싱해서 가져왔으므로 문자열. 이걸 이대로 쓰려면 복잡한 인덱싱이 필요하므로 json으로 바꿔줘야 한다. 이미 quickdraw에서 만들어줌.

      user = sampleJsonFromJson(response.body); // 이걸로 다시 json으로 만들어줌
      print(user[0].name); //user[0]에 첫번째 사람에 대한 데이터가 json 형식으로 들어 있다!
      print(user[0].address.city);
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    getInfo();
    return Scaffold(
      appBar: AppBar(
        title: Text('user'),
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: getInfo().then((value) => user = value),
            //위에서는 완료까지 실행 대기하자고 하는데 여기서는 기다리는 게 없다.
            //그래서 FutureBuilder쓰는 것
            //future는 완료까지 실행 대기 할 것
            //then은 함수 실행시킨 뒤 나오는 값들(value)을 user에 담아주는 기능을 하고 있다.
            builder: (context, snapshot) {
              //future가 완성된 후 snapshot에 담김
              //스냅샷 자체에는 별 의미있는 데이터 없고 그냥
              //데이터가 잘 들어왔는지 판단하는 용도
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              } else {
                return ListView.builder(
                  itemCount: user.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(Icons.account_circle),
                      title: Text(user[index].name),
                      subtitle: Text(user[index].email),
                      trailing: Icon(Icons.phone_android),
                    );
                  },
                );
              }
            }),
      ),
    );
  }
}
