import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/weather/weather.dart';
import '../modules/home/controllers/home_controller.dart';




class AirQualityPage extends GetView<HomeController> {
  final Weather? items;
   const AirQualityPage( {super.key,required this.items,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Stack(children: [
        Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: Column(children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.94,
                  width: MediaQuery.of(context).size.width * 0.94,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      gradient: LinearGradient(
                          colors: [
                            Colors.blue.withOpacity(0.4),
                            Colors.blue.withOpacity(0.9)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(top: 10),
                                width: 100,
                                height: 100,
                                color: Colors.white.withOpacity(0.2),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Icon(Icons.air,
                                          color: Colors.white, size: 30),
                                      Text(
                                          '${items!.getCurrentWeather().airQuality!.co!}',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      const Text('co',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold))
                                    ])),
                            Container(
                                margin: const EdgeInsets.only(top: 10),
                                width: 100,
                                height: 100,
                                color: Colors.white.withOpacity(0.2),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Icon(Icons.air,
                                          color: Colors.white, size: 30),
                                      Text(
                                          '${items!.getCurrentWeather().airQuality!.no2!}',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold)),
                                      const Text('no2',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold))
                                    ])),
                            Container(
                                margin: const EdgeInsets.only(top: 10),
                                width: 100,
                                height: 100,
                                color: Colors.white.withOpacity(0.2),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Icon(Icons.air,
                                          color: Colors.white, size: 30),
                                      Text(
                                          '${items!.getCurrentWeather().airQuality!.o3!}',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold)),
                                      const Text('o3',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold))
                                    ])),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(top: 10),
                                width: 100,
                                height: 100,
                                color: Colors.white.withOpacity(0.2),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Icon(Icons.air,
                                          color: Colors.white, size: 30),
                                      Text(
                                          '${items!.getCurrentWeather().airQuality!.so2!}',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      const Text('so2',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold))
                                    ])),
                            Container(
                                margin: const EdgeInsets.only(top: 10),
                                width: 100,
                                height: 100,
                                color: Colors.white.withOpacity(0.2),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Icon(Icons.air,
                                          color: Colors.white, size: 30),
                                      Text(
                                          '${items!.getCurrentWeather().airQuality!.pm25!}',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      const Text('pm25',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold))
                                    ])),
                            Container(
                                margin: const EdgeInsets.only(top: 10),
                                width: 100,
                                height: 100,
                                color: Colors.white.withOpacity(0.2),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Icon(Icons.air,
                                          color: Colors.white, size: 30),
                                      Text(
                                          '${items!.getCurrentWeather().airQuality!.pm10!}',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      const Text('pm10',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold))
                                    ])),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(top: 10),
                                width: 100,
                                height: 100,
                                color: Colors.white.withOpacity(0.2),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        color: Colors.white.withOpacity(0.5),
                                        child: Image.network(
                                            "https://img.icons8.com/fluency/48/null/thermometer.png",
                                            height: 30),
                                      ),
                                      Text(
                                          '${items!.getCurrentWeather().feelslikeC!}°',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      const Text('Feels Like',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold))
                                    ])),
                            Container(
                                margin: const EdgeInsets.only(top: 10),
                                width: 100,
                                height: 100,
                                color: Colors.white.withOpacity(0.2),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        color: Colors.white.withOpacity(0.5),
                                        child: Image.network(
                                            "https://img.icons8.com/fluency/48/null/clouds.png",
                                            height: 30),
                                      ),
                                      Text(
                                          '${items!.getCurrentWeather().cloud!}',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      const Text('Clouds',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold))
                                    ])),
                            Container(
                                margin: const EdgeInsets.only(top: 10),
                                width: 100,
                                height: 100,
                                color: Colors.white.withOpacity(0.2),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        color: Colors.white.withOpacity(0.5),
                                        child: Image.network(
                                            "https://img.icons8.com/fluency/48/null/atmospheric-pressure.png",
                                            height: 30),
                                      ),
                                      Text(
                                          '${items!.getCurrentWeather().windDegree!}°',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      const Text('Wind Degree',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold))
                                    ])),
                          ],
                        )
                      ])),
            ])),
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
      ]),
    )));
  }
}
