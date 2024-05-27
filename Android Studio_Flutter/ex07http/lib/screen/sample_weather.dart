import 'package:ex07http/model/weathersample_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ExWeather extends StatelessWidget {
  const ExWeather({super.key});

  void getWeather() async{
    Response response = await get(Uri.parse('https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1'));
    if(response.statusCode==200){
      print(response.body);
      WeatherSample ws = weatherSampleFromJson(response.body);
      print(ws.name);
      print(ws.weather[0].description);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          getWeather();
        }, child: Text('날씨')),
      ),
    );
  }
}
