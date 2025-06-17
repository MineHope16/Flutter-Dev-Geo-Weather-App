import 'location.dart';
import 'networking.dart';
import 'package:geo_weather_app/constants.dart';



class WeatherModel {

  Future<dynamic> getCityWeather (String inputCity) async {
    NetworkHelper networkHelper = NetworkHelper("$OpenWeatherURL?q=$inputCity&appid=$apiKey&units=metric");
    var weatherData = await networkHelper.getWeatherData();
    return weatherData;
  }


  Future<dynamic>
  getLocationWeather() async {
    Location location = Location();
    await location.getPosition();

    NetworkHelper networkHelper = NetworkHelper("$OpenWeatherURL?lat=${location.pLatitude}&lon=${location.pLongitude}&appid=$apiKey&units=metric");
    var weatherData = await networkHelper.getWeatherData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}