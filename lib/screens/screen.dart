import 'package:flutter/material.dart';
import 'package:weather_ui/components/constants.dart';
import 'package:weather_ui/components/Reusables.dart';
import 'package:weather_ui/services/location.dart';
import 'package:darksky_weather/darksky_weather_io.dart';

class WeatherUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff303644),
      body: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  int tempCurrent;
  int tempSun;
  int tempMon;
  int tempTue;
  int tempWed;
  int tempThur;
  int tempFri;
  int tempSat;

  Future<Null> getWeather() async {
    Location location = Location();
    await location.getCurrentPosition();
    var darksky = DarkSkyWeather(
      "API_KEY",
      units: Units.SI,
      language: Language.English,
    );
    var forecast = await darksky.getForecast(
        location.latitude, location.longitude, excludes: [
      Exclude.Hourly,
      Exclude.Minutely,
      Exclude.Alerts,
      Exclude.Flags
    ]);
    setState(() {
      tempCurrent = forecast.currently.temperature.toInt();
      tempSun = forecast.daily.data[1].temperatureMax.toInt();
      tempMon = forecast.daily.data[2].temperatureMax.toInt();
      tempTue = forecast.daily.data[3].temperatureMax.toInt();
      tempWed = forecast.daily.data[4].temperatureMax.toInt();
      tempThur = forecast.daily.data[5].temperatureMax.toInt();
      tempFri = forecast.daily.data[6].temperatureMax.toInt();
      tempSat = forecast.daily.data[7].temperatureMax.toInt();
    });
  }

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(60.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  title: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: kMyColor,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Mombasa',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: kMyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  subtitle: Center(
                    child: Text(
                      'Today',
                      style: kTextDayStyle,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100.0,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Image.asset(
                  'images/icon.png',
                  color: Colors.white,
                  scale: 1.5,
                ),
                Text(
                  '$tempCurrent°',
                  style: TextStyle(
                    fontSize: 100.0,
                    color: kMyColor,
                  ),
                ),
                Text(
                  's',
                  style: TextStyle(color: kMyColor, fontSize: 20.0),
                )
              ],
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  title: Center(
                    child: Text(
                      'Tomorrow',
                      style: kTextDayStyle,
                    ),
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'images/icon.png',
                        color: Colors.white,
                        scale: 2.0,
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        '$tempSun°',
                        style: TextStyle(
                          fontSize: 30.0,
                          color: kMyColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            children: <Widget>[
              ReusableExpandedDays(
                textDegrees: '$tempSun',
                textDay: 'S',
              ),
              ReusableExpandedDays(
                textDay: 'M',
                textDegrees: '$tempMon',
              ),
              ReusableExpandedDays(
                textDay: 'T',
                textDegrees: '$tempTue',
              ),
              ReusableExpandedDays(
                textDay: 'W',
                textDegrees: '$tempWed',
              ),
              ReusableExpandedDays(
                textDay: 'T',
                textDegrees: '$tempThur',
              ),
              ReusableExpandedDays(
                textDay: 'F',
                textDegrees: '$tempFri',
              ),
              ReusableExpandedDays(
                textDay: 'S',
                textDegrees: '$tempSat',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
