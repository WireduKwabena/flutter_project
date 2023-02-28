import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/weather/weather.dart';
import '../../modules/home/controllers/home_controller.dart';

class HourlyDataWidget extends GetView<HomeController> {
  final Weather weather;
  const HourlyDataWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      height: 145,
      width: MediaQuery.of(context).size.width,
      child: _listviews(),
    );
  }

  Widget _listviews() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: weather.getWeatherForcast().forecastday![0].hour!.length,
      itemBuilder: (context, index) {
        return Container(
            width: 70,
            margin: const EdgeInsets.all(5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.20),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                    controller.getDateHourly(weather
                        .getWeatherForcast()
                        .forecastday![0]
                        .hour![index]
                        .timeEpoch),
                    style:
                        TextStyle(color: Colors.grey.shade200, fontSize: 15)),
                SizedBox(
                  height: 48,
                  width: 48,
                  child: Image.network(weather
                      .getWeatherForcast()
                      .forecastday![0]
                      .hour![index]
                      .condition!
                      .icon!
                      .replaceAll('//', 'https://')),
                ),
                Text(
                  '${weather.getWeatherForcast().forecastday![0].hour![index].tempC}°',
                  style: TextStyle(color: Colors.grey.shade200, fontSize: 15),
                ),
              ],
            ));
      },
    );
  }
}
