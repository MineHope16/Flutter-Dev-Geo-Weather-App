import 'package:flutter/material.dart';

const apiKey = "api_key";
const String OpenWeatherURL = "https://api.openweathermap.org/data/2.5/weather";

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
  color: Colors.white,
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

var kTextFielInputDecoration = InputDecoration(
  filled: true,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: "Enter the city name",
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide.none,
  ),
);