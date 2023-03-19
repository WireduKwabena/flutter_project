import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'dart:async';
import '../../../data/providers/weather_provider.dart';
import '../../../data/weather/weather.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
//import '../../../data/status_error/status_error.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController with StateMixin<Weather> {
  late StreamSubscription<InternetConnectionStatus> _listener;

  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxString _defaultLocationName = "...".obs;
  final RxString _locationName = "Madina".obs;

  final RxInt connectionStatus = 0.obs;

  RxDouble getLatitude() => _latitude;
  RxDouble getLongitude() => _longitude;
  RxString getLocation() => _locationName;
  RxString getDefaultLocation() => _defaultLocationName;

  RxInt getConnectionStatus() => connectionStatus;
  final /*Rx<Weather?>?*/ weather = Weather().obs;

 // final  errorMessage = StatusError().obs;

  @override
  void onInit() {
    networkListener();
    super.onInit();
  }

  networkListener() {
    try {
      _listener = InternetConnectionChecker().onStatusChange.listen(
        (InternetConnectionStatus status) {
          switch (status) {
            case InternetConnectionStatus.connected:
              getConnectionStatus().value = 1;
              break;
            case InternetConnectionStatus.disconnected:
              getConnectionStatus().value = 0;
              break;
          }
        },
      );
    } catch (exception) {
      return Future.error(exception);
    }
  }

  @override
  void onReady() {
    _getCurrentLocation();
    super.onReady();
    //print(_defaultLocationName.value);
  }

  @override
  void onClose() {
    _listener.cancel();
  }

// Get Device Location using device longitude and latitude also get the weather data for known location
  _getCurrentLocation() async {
    try {
      // pass null and status to loading in change since weather data is yet to be received
      change(null, status: RxStatus.loading());
      // variables to check for location permission and location services
      bool isServiceEnabled;
      LocationPermission permission;

      isServiceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!isServiceEnabled) {
        await Geolocator.openLocationSettings();
        return Future.error('Location Services Is Not Enabled.');
      }

      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Permission Denied Forever, We are unable to access Location!.');
      } else if (permission == LocationPermission.denied) {
        permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Permission Denied!.');
        }
      }
// get longitude and lattitude when location service is enabled
      return await Geolocator.getCurrentPosition(
              forceAndroidLocationManager: true,
              desiredAccuracy: LocationAccuracy.high)
          .then((value) async {
        _latitude.value = value.latitude;
        _longitude.value = value.longitude;

        List<Placemark> placemarks =
            await placemarkFromCoordinates(_latitude.value, _longitude.value);
        Placemark places = placemarks[0];
        if (kDebugMode) {
          print(places);
        }
        _defaultLocationName.value = places.locality!;

        //findDefaultLocation(, );

// get weather data for the identified location
        return WeatherProvider()
            .getWeatherOnLocation(_defaultLocationName.value)
            .then((value) {
          if (value != null) {
            weather.value = value;
            change(weather.value, status: RxStatus.success());
          } else {
            change(null, status: RxStatus.success());
          }
        });
        /*WeatherProvider()
            .getWeather(_latitude.value , _longitude.value)
            .then((value) {
          weather.value = value!;
          // pass the recieved weather data and set status to success in change
          change(weather.value, status: RxStatus.success());
        });*/
      });
    } catch (exception) {
      // incase of any error, pass the error or exception to status and add null to change
      change(null, status: RxStatus.error(exception.toString()));
      return Future.error(exception);
    }
  }

  refresher() {
    return _getCurrentLocation();
  }

// method to get weather data by location instead of lon. and lat.
  receiver() {
    try {
      change(null, status: RxStatus.loading());
      return WeatherProvider()
          .getWeatherOnLocation(_locationName.value)
          .then((value) {
        if (value != null) {
          weather.value = value;
          change(weather.value, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.success());
        }
      });
    } catch (exception) {
      change(null, status: RxStatus.error(exception.toString()));
    }
  }

// set date format using epoch values
  String getDate(final day) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    String time = DateFormat("EEE, MMM d, ''yy").format(date);
    return time;
  }

  String getDateSecond(final day) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(day);
    String time = DateFormat("EEE, MMM d, ''yy").format(date);
    return time;
  }

  String getloc(final day) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(day);
    String time = DateFormat.yMd().add_jm().format(date);
    return time;
  }

  String getDateHourly(final day) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    String time = DateFormat("jm").format(date);
    return time;
  }

  String getDateAnother(final day) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    String time = DateFormat("jm").format(date);
    return time;
  }

  // Future<void> findDefaultLocation(double lat, double lon) async {
  //   try {

  //     //print(_defaultLocationName.value);
  //   } catch (exception) {
  //     return Future.error(exception);
  //   }
  // }
}
