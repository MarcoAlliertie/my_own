import 'package:ex07http/config/route_names.dart';
import 'package:ex07http/model/weathermodel.dart';
import 'package:ex07http/screen/ex_a_page.dart';
import 'package:ex07http/screen/ex_json.dart';
import 'package:ex07http/screen/loading.dart';
import 'package:ex07http/screen/sample_weather.dart';
import 'package:ex07http/screen/samplelocation.dart';
import 'package:ex07http/screen/weather_main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: routes,
      theme: ThemeData(
        fontFamily: 'Obang'
      ),

      home: Loading(),
    );
  }
}