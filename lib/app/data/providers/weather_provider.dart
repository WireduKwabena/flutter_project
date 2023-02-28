import 'package:get/get.dart';

import '../weather/weather.dart';

class WeatherProvider extends GetConnect {
  Weather? weather;
  // final otherKeys = '9dea01a114f3ce4be85adca999752a81';
  final String apiKey = "815c507573cc441bb2f04227221112";

  Future<Weather?> getWeather(double lon, double lat) async {
    try {
      final response = await get(
          "http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$lon,$lat&days=7&aqi=yes&alerts=yes");
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        weather = Weather.fromJson(response.body);
      }
      return weather;
    } catch (exception) {
      return Future.error(exception.toString);
    }
  }

  Future<Weather?> getWeatherOnLocation(String location) async {
    try {
      final response = await get(
          "http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$location&days=7&aqi=yes&alerts=yes");
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        weather = Weather.fromJson(response.body);
      }
      return weather;
    } catch (exception) {
      return Future.error(exception.toString);
    }
  }
}
