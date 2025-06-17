import 'package:flutter/material.dart';
import 'package:geo_weather_app/screens/location_screen.dart';
import 'package:geo_weather_app/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getlocationData();
  }

  void getlocationData() async{
    print("Location Screen - getLocationCalled");

    var weatherData = await WeatherModel().getLocationWeather();
    print("Location Screen - getLocationCalled After getting location");

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LocationScreen(locationWeather: weatherData)));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
              SpinKitDoubleBounce(
              color: Colors.blue,
              size: 50.0,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
                "Fetching Your Location Data",
              style: TextStyle(
                fontSize: 20,
              ),
            )
      ],
      ),
    );
  }
}

