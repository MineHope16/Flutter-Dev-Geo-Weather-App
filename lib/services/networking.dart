import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future getWeatherData() async {
    print('getWeatherData called.');
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
      return jsonDecode(data);

    } else {
      print(response.statusCode);
    }
  }
}