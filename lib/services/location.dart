import 'package:geolocator/geolocator.dart';

class Location {
  late double pLatitude;
  late double pLongitude;

  Future<void> getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    try {
      print("in try bolck");
      Position position = await Geolocator.getCurrentPosition();
      print('position created');
      pLongitude = position.longitude;
      pLatitude = position.latitude;
    } on Exception catch (e) {
      print(Future.error(e));
    }
  }
}


