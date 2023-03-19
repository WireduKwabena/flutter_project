import 'package:get/get.dart';

import '../status_error/status_error.dart';
import '../weather/weather.dart';

class WeatherProvider extends GetConnect {
  Weather? weather;
  StatusError? error;
  // final otherKeys = '9dea01a114f3ce4be85adca999752a81';
  final String apiKey = "815c507573cc441bb2f04227221112";

  // Future<Weather?> getWeather(double lat, double lon) async {
  //   try {
  //     final response = await get(
  //         "http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$lat,$lon&days=7&aqi=yes&alerts=yes");
  //     if (response.status.hasError) {
  //       return Future.error(response.statusText!);
  //     } else {
  //       weather = Weather.fromJson(response.body);
  //     }
  //     return weather;
  //   } catch (exception) {
  //     return Future.error(exception.toString);
  //   }
  // }

  Future<Weather?> getWeatherOnLocation(String location) async {
    try {
      final response = await get(
          "http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$location&days=7&aqi=yes&alerts=yes");
      if (response.statusCode == 400 ||
          response.statusCode == 401 ||
          response.statusCode == 403) {
        error = StatusError.fromMap(response.body);
        //return error;
      } else if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        if (response.body != null) {
        weather = Weather.fromJson(response.body);
      }
        //weather = Weather.fromJson(response.body);
      }
      return weather;
    } catch (exception) {
      return Future.error(exception.toString);
    }
  }
}
