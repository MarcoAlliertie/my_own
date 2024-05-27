import 'package:ex07http/model/weathermodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class WeatherMain extends StatelessWidget {
  const WeatherMain({super.key, required this.wm});

  final WeatherModel wm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[100],
        elevation: 0.0,
      ),
      body: Container(
          color: Colors.lightBlue[100],
          padding: EdgeInsets.all(12),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  wm.name,
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    //소수점을 특정 자리수만큼 출력하는 방법
                    //.toStringAsFixed(자리수)
                    Text(
                      '${wm.main.temp.toStringAsFixed(1)}도',
                      style: TextStyle(fontSize: 38, color: Colors.red),
                    ),

                    //현재 날짜를 가지고 오는 객체
                    //DateFormat('')
                    //y - year, M - month , d - day
                    //.format(어떤 날짜를 가지고 올지)
                    //현재시간 가지고 오는 코드 DateTime.now()

                    //DateFormat 사용하려면 intl이라는 라이브러리 필요
                    //pub.dev에서 가져와서 pubspec.yaml에 넣어주자
                    Text('${DateFormat('yy년MM월dd일').format(DateTime.now())}',
                        style: TextStyle(fontSize: 20)),

                    //시간은 실시간으로 확인하기 위해 TimerBuilder
                    //이것도 라이브러리 도입해 줘야

                    TimerBuilder.periodic(Duration(seconds: 1),
                        builder: (context) {
                      return Text(
                          '${DateFormat('hh:mm:ss').format(DateTime.now())}',
                          style: TextStyle(fontSize: 20));
                    })
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 1,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Icon(Icons.sunny),
                      //아이콘을 네트워크를 통해 외부에서 가져오기
                      //아이콘이 아니라 이미지로 인식한다.
                      //오픈웨더에서 제공하는 아이콘
                      //이것도 받아온 객체 정보에 있으므로 변수로
                      Image.network(
                          'https://openweathermap.org/img/wn/${wm.weather[0].icon}.png'),
                      Text('${wm.weather[0].main}')
                    ],
                  ),
                  Container(
                    width: 1,
                    height: double.infinity,
                    color: Colors.grey[300],
                    margin: EdgeInsets.all(24),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.water_drop_outlined),
                      Text('${wm.main.humidity}'),
                    ],
                  ),
                  Container(
                    width: 1,
                    height: double.infinity,
                    color: Colors.grey[300],
                    margin: EdgeInsets.all(24),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.wind_power),
                      Text('${wm.wind.speed}'),
                    ],
                  ),
                  SizedBox(
                    width: 1,
                  ),
                ],
              ),
            )
          ])),
    );
  }
}
