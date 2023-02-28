//import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/weather/weather.dart';
import '../modules/home/controllers/home_controller.dart';
//import '../Widgets/next_day_weather_widget.dart';

class NextForcast extends GetView<HomeController> {
  final Weather? items;
  const NextForcast({super.key, required this.items});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Colors.black,
              child: ListView.builder(
                  itemCount: items!.getWeatherForcast().forecastday!.length,
                  itemBuilder: ((context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          gradient: LinearGradient(
                              colors: [
                                Colors.blue.withOpacity(0.4),
                                Colors.blue.withOpacity(0.9)
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                      margin: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            items!
                                .getWeatherForcast()
                                .forecastday![index]
                                .date!,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                    height: 70,
                                    width: 100,
                                    child: Image.network(items!
                                        .getWeatherForcast()
                                        .forecastday![index]
                                        .day!
                                        .condition!
                                        .icon!
                                        .replaceAll('//', 'https://'))),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 20),
                                  height: 50,
                                  width: 2,
                                  color: Colors.grey,
                                ),
                                Expanded(
                                  child: Text.rich(TextSpan(
                                      text:
                                          "${items!.getWeatherForcast().forecastday![index].day!.maxtempC}°",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 40),
                                      children: <InlineSpan>[
                                        const TextSpan(text: '/'),
                                        TextSpan(
                                            text:
                                                "${items!.getWeatherForcast().forecastday![index].day!.mintempC}°",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)),
                                        TextSpan(
                                          text: items!
                                              .getWeatherForcast()
                                              .forecastday![index]
                                              .day!
                                              .condition!
                                              .text!,
                                          style: TextStyle(
                                              color: Colors.grey.shade300,
                                              fontSize: 18),
                                        ),
                                      ])),
                                ),
                              ]),
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxHeight: 150),
                            child: listTiles(index),
                          ),
                        ],
                      ),
                    );
                  })),
            ),
            GestureDetector(
              onTap: (() => Get.back()),
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.only(left: 6),
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.grey.shade300),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.blue,
                ),
              ),
            )
          ],
        ),
        /*Column(
        children: [
          
        ],
              )*/
      ),
    );
  }

  Widget listTiles(int hourindex) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount:
            items!.getWeatherForcast().forecastday![hourindex].hour!.length,
        itemBuilder: ((context, index) {
          return Container(
            height: 100,
            width: 70,
            margin: const EdgeInsets.all(5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.20),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(controller.getDateAnother(items!
                    .getWeatherForcast()
                    .forecastday![hourindex]
                    .hour![index]
                    .timeEpoch)),
                SizedBox(
                    height: 35,
                    width: 35,
                    child: Image.network(items!
                        .getWeatherForcast()
                        .forecastday![hourindex]
                        .hour![index]
                        .condition!
                        .icon!
                        .replaceAll('//', 'https://'))),
                Text(
                    '${items!.getWeatherForcast().forecastday![hourindex].hour![index].tempC}°')
              ],
            ),
          );
        }));
  }
}
