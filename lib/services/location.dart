import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitude;

  void getCurrentPosition() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
