import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class ExLocation extends StatelessWidget {
  const ExLocation({super.key});

  void getLocation()async{
    await Geolocator.requestPermission();
    //permission 안 될 때 쓰는 코드. 강제로 위치정보 권한 승인시키는 함수. 응답 기다려야 하므로 await 걸어줌
    
    //Geolocator.getCurrentPosition(); //geolocator 라이브러리에서 현재 위치 가지고 오는 함수
    Position position = await Geolocator.getCurrentPosition();
    //리턴값이 future<Position>이므로 위와 같이 변수에 넣어준다.
    print(position);
    //이와 같이 하면 현재 위도 경도 값 가져올 수 있다.
    print(position.latitude);
    print(position.longitude);
    //하나만 가져오고 싶다면 이렇게!
  }

  @override
  Widget build(BuildContext context) {
    getLocation();
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () {
          getLocation();
        }, child: Text('내 위치')),
      ),
    );
  }
}
