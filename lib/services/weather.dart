import 'location.dart';
import 'networking.dart';
import 'package:darksky_weather/darksky_weather_io.dart';

final String apiKey = '8810b3633934b8c1975c51a2311dc1d0';
final String url = 'https://api.darksky.net/forecast/';

//class WeatherModel {
//  Future<dynamic> getLocationWeather() async {
//    Location location = Location();
//    await location.getCurrentPosition();
//    NetworkHelper networkHelper = NetworkHelper(
//        '$url/$apiKey/${location.latitude},${location.longitude}?exclude=[hourly,flags,alerts,minutely,flags]');
//    var weatherData = await networkHelper.getData();
//    return weatherData;
//  }
//}
