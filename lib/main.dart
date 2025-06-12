import 'package:flutter/material.dart';
import 'package:geo_weather_app/screens/loading_screen.dart';

void main () => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
        )
      ),
      home: LoadingScreen(),
    );
  }
}
