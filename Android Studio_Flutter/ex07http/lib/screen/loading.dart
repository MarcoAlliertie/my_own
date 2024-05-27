import 'package:ex07http/model/weathermodel.dart';
import 'package:ex07http/private/private.dart';
import 'package:ex07http/screen/weather_main.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //전역변수 lat, lon 선언. null값 안 된다고 오류나므로 일단 ?표 붙여줌.
  double? lat;
  double? lon;

  void getLocation() async {
    //위치 찾기 권한 설정해 주기
    await Geolocator.requestPermission();
    //Position 객체를 통해 위치 가져오기
    Position position = await Geolocator.getCurrentPosition();
    lat = position.latitude;
    lon = position.longitude;
    void getWeatherInfo() async {
      String url =
          'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric';
      Response res = await get(Uri.parse(url));
      if (res.statusCode == 200) {
        print(res.body);
        WeatherModel wm = weatherModelFromJson(res.body);

        //로딩 페이지로 다시 안 돌아올 거니까 pushAndRemoveUntil
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => WeatherMain(wm :wm,)), (route) => false);
      }
    }

    getWeatherInfo();
    //설정된 lat, lon을 바탕으로 날씨 가져오기. 밑에 함수로!
  }

  @override
  void initState() {
    //Loading 페이지가 뜨자마자 getLocation()이 실행된다!
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[100],
        elevation: 0.0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        color: Colors.lightBlue[100],
        child: Center(
          child: Container(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
