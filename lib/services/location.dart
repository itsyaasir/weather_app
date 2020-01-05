import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';

class Location {
  double longitude;
  double latitude;
  String cityName;
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

  void getCityName() async {
    try {
      await getCurrentPosition();
      final coordinates = Coordinates(latitude, longitude);
      List<Address> addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      Address first = addresses.first;
      cityName = first.locality;
      print("${first.locality}");
    } catch (e) {
      print(e);
    }
  }
}
