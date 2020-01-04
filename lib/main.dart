import 'package:flutter/material.dart';
import 'package:weather_ui/screens/screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'KulimPark'),
      home: WeatherUI(),
    );
  }
}
