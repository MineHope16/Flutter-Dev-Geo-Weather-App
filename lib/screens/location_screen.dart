import "package:flutter/material.dart";
import "package:geo_weather_app/screens/city_screen.dart";

import "../constants.dart";
import 'package:geo_weather_app/services/weather.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;

  LocationScreen({this.locationWeather});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late double temp;
  late int weatherID;
  late String city;
  late String weatherCondition;
  late String weatherMessage;
  late String weatherIcon;

  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null){
        temp = 0;
        weatherCondition = "";
        city = "";
        weatherMessage = "Unable to get the weather data";
        weatherIcon = "";
        return;
      }
      weatherID = weatherData['weather'][0]['id'];
      weatherCondition = weatherData['weather'][0]['main'];
      temp = (weatherData['main']['temp'] as num).toDouble();
      city = weatherData['name'];
      weatherMessage = weatherModel.getMessage(temp.round());
      weatherIcon  = weatherModel.getWeatherIcon(weatherID);
      // print(weatherID);
      // print(temp);
      // print(city);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white54,
                BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      setState(() async {
                        var weatherData = await weatherModel.getLocationWeather();
                        updateUI(weatherData);
                      });
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.lightBlue,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedInput = await Navigator.push(context, MaterialPageRoute(builder: (context) => CityScreen()));
                      if (typedInput != null) {
                        var weatherData = await weatherModel.getCityWeather(typedInput);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.lightBlue,

                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.ideographic,
                  children: <Widget>[
                    Text(
                      '${temp.round()}°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                    Text(
                      "($weatherCondition)",
                      style: TextStyle(
                        fontFamily: 'Spartan MB',
                        fontSize: 25
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weatherMessage in $city",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
