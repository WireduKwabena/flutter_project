import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../data/weather/weather.dart';
import '../modules/home/controllers/home_controller.dart';




class OtherDetails extends GetView<HomeController> {
  final Weather? items;
  const OtherDetails({super.key,required this.items});

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
            child: Stack(children: [
          Container(
              color: Colors.black,
              child: ListView.builder(
                  itemCount: items!
                      .getWeatherForcast()
                      .forecastday!
                      .length,
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                items!
                                    .getWeatherForcast()
                                    .forecastday![index]
                                    .date!,
                                style: const TextStyle(color: Colors.grey),
                              ),
                              //Day Details here
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                        color: Colors.white.withOpacity(0.2),
                                        child: Column(children: [
                                          Container(
                                              color:
                                                  Colors.white.withOpacity(0.2),
                                              child: Image.network(
                                                  'https://img.icons8.com/fluency/48/null/thermometer.png',
                                                  height: 35,
                                                  width: 35)),
                                          Text(
                                              '${items!.getWeatherForcast().forecastday![index].day!.avgtempC!}°'),
                                          const Text('Average Temp'),
                                        ])),
                                    Container(
                                        color: Colors.white.withOpacity(0.2),
                                        child: Column(children: [
                                          Container(
                                              color:
                                                  Colors.white.withOpacity(0.2),
                                              child: Image.network(
                                                  "https://img.icons8.com/fluency/48/null/windy-weather.png",
                                                  height: 35,
                                                  width: 35)),
                                          Text(
                                              '${items!.getWeatherForcast().forecastday![index].day!.maxwindMph!}Mph'),
                                          const Text('Max Wind'),
                                        ])),
                                    Container(
                                        color: Colors.white.withOpacity(0.2),
                                        child: Column(children: [
                                          Container(
                                              color:
                                                  Colors.white.withOpacity(0.2),
                                              child: Image.network(
                                                  "https://img.icons8.com/fluency/48/null/hygrometer.png")),
                                          Text(
                                              '${items!.getWeatherForcast().forecastday![index].day!.avghumidity!}%'),
                                          const Text('Average Humidity'),
                                        ])),
                                  ]),
                              //Day Details here
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        color: Colors.white.withOpacity(0.2),
                                        child: Column(children: [
                                          Container(
                                              color:
                                                  Colors.white.withOpacity(0.2),
                                              child: items!
                                                          .getWeatherForcast()
                                                          .forecastday![index]
                                                          .day!
                                                          .dailyWillItRain! ==
                                                      1
                                                  ? Image.network(
                                                      "https://img.icons8.com/fluency/48/null/rain.png",
                                                      height: 35,
                                                      width: 35)
                                                  : Image.network(
                                                      "https://img.icons8.com/fluency/48/null/no-rain.png",
                                                      height: 35,
                                                      width: 35)),
                                          Text(
                                              '${items!.getWeatherForcast().forecastday![index].day!.dailyWillItRain!}'),
                                          const Text('Will It Rain'),
                                        ])),
                                    Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        color: Colors.white.withOpacity(0.2),
                                        child: Column(children: [
                                          Container(
                                              color:
                                                  Colors.white.withOpacity(0.2),
                                              child: Image.network(
                                                  "https://img.icons8.com/fluency/48/null/light-rain-2.png",
                                                  height: 35,
                                                  width: 35)),
                                          Text(
                                              '${items!.getWeatherForcast().forecastday![index].day!.dailyChanceOfRain!}%'),
                                          const Text('Chance of Rain'),
                                        ])),
                                  ]),
                              //Day Details here
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        color: Colors.white.withOpacity(0.2),
                                        child: Column(children: [
                                          Container(
                                              margin:
                                                  const EdgeInsets.only(top: 10),
                                              color:
                                                  Colors.white.withOpacity(0.2),
                                              child: Image.network(
                                                  "https://img.icons8.com/fluency/48/null/snow.png",
                                                  height: 35,
                                                  width: 35)),
                                          Text(
                                              '${items!.getWeatherForcast().forecastday![index].day!.dailyWillItSnow!}'),
                                          const Text('Will It Snow'),
                                        ])),
                                    Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        color: Colors.white.withOpacity(0.2),
                                        child: Column(children: [
                                          Container(
                                              color:
                                                  Colors.white.withOpacity(0.2),
                                              child: Image.network(
                                                  "https://img.icons8.com/fluency/48/null/winter.png",
                                                  height: 35,
                                                  width: 35)),
                                          Text(
                                              '${items!.getWeatherForcast().forecastday![index].day!.dailyChanceOfSnow!}%'),
                                          const Text('Chance Of Snow'),
                                        ])),
                                  ]),
                              const SizedBox(height: 2),
                              //Astro Details here
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        color: Colors.white.withOpacity(0.2),
                                        child: Column(children: [
                                          Container(
                                              margin:
                                                  const EdgeInsets.only(top: 10),
                                              color:
                                                  Colors.white.withOpacity(0.2),
                                              child: Image.network(
                                                  "https://img.icons8.com/fluency/48/null/sunrise.png",
                                                  height: 35,
                                                  width: 35)),
                                          Text(items!
                                              .getWeatherForcast()
                                              .forecastday![index]
                                              .astro!
                                              .sunrise!),
                                          const Text('SunRise'),
                                        ])),
                                    Container(
                                        color: Colors.white.withOpacity(0.2),
                                        child: Column(children: [
                                          Container(
                                              color:
                                                  Colors.white.withOpacity(0.2),
                                              child: Image.network(
                                                  "https://img.icons8.com/fluency/48/null/sunset.png",
                                                  height: 35,
                                                  width: 35)),
                                          Text(items!
                                              .getWeatherForcast()
                                              .forecastday![index]
                                              .astro!
                                              .sunset!),
                                          const Text('SunSet'),
                                        ])),
                                  ]),
                              //Astro Details here
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                        color: Colors.white.withOpacity(0.2),
                                        child: Column(children: [
                                          Container(
                                              margin:
                                                  const EdgeInsets.only(top: 10),
                                              color:
                                                  Colors.white.withOpacity(0.2),
                                              child: Image.network(
                                                  "https://img.icons8.com/fluency/48/null/moonrise.png",
                                                  height: 35,
                                                  width: 35)),
                                          Text(items!
                                              .getWeatherForcast()
                                              .forecastday![index]
                                              .astro!
                                              .moonrise!),
                                          const Text('MoonRise'),
                                        ])),
                                    Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        color: Colors.white.withOpacity(0.2),
                                        child: Column(children: [
                                          Container(
                                              color:
                                                  Colors.white.withOpacity(0.2),
                                              child: Image.network(
                                                  "https://img.icons8.com/fluency/48/null/moonset.png",
                                                  height: 35,
                                                  width: 35)),
                                          Text(items!
                                              .getWeatherForcast()
                                              .forecastday![index]
                                              .astro!
                                              .moonset!),
                                          const Text('MoonSet'),
                                        ])),
                                  ]),
      
                              ConstrainedBox(
                                constraints: const BoxConstraints(maxHeight: 500),
                                child: listTiles(index),
                              ),
                            ]));
                  }))),
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
        ])),
      )
    ;
  }

  Widget listTiles(int hourindex) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items!
            .getWeatherForcast()
            .forecastday![hourindex]
            .hour!
            .length,
        itemBuilder: ((context, index) {
          return Container(
              width: 235,
              margin: const EdgeInsets.all(5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.20),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: 20,
                      width: 60,
                      color: Colors.white.withOpacity(0.15),
                      child: Text(controller.getDateAnother(items!
                          .getWeatherForcast()
                          .forecastday![hourindex]
                          .hour![index]
                          .timeEpoch)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          color: Colors.white.withOpacity(0.3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  height: 35,
                                  width: 35,
                                  color: Colors.white.withOpacity(0.4),
                                  child: Image.network(
                                      'https://img.icons8.com/fluency/48/null//snow-storm.png')),
                              Text(
                                  '${items!.getWeatherForcast().forecastday![hourindex].hour![index].feelslikeC!}°'),
                              const Text('Feels Like'),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.white.withOpacity(0.3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  height: 35,
                                  width: 35,
                                  color: Colors.white.withOpacity(0.4),
                                  child: Image.network(
                                      'https://img.icons8.com/fluency/48/null/winter.png')),
                              Text(
                                  '${items!.getWeatherForcast().forecastday![hourindex].hour![index].windchillC!}°'),
                              const Text('Wind Chill'),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.white.withOpacity(0.3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  height: 35,
                                  width: 35,
                                  color: Colors.white.withOpacity(0.4),
                                  child: Image.network(
                                      'https://img.icons8.com/fluency/48/null/thermometer.png')),
                              Text(
                                  '${items!.getWeatherForcast().forecastday![hourindex].hour![index].heatindexC!}°'),
                              const Text('Heat Index'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          color: Colors.white.withOpacity(0.3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  height: 35,
                                  width: 35,
                                  color: Colors.white.withOpacity(0.4),
                                  child: Image.network(
                                      'https://img.icons8.com/fluency/48/null/dew-point.png')),
                              Text(
                                  '${items!.getWeatherForcast().forecastday![hourindex].hour![index].dewpointC!}°'),
                              const Text('Dew Point'),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.white.withOpacity(0.4),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  height: 35,
                                  width: 35,
                                  color: Colors.white.withOpacity(0.4),
                                  child: Image.network(
                                      'https://img.icons8.com/fluency/48/null/hygrometer.png')),
                              Text(
                                  '${items!.getWeatherForcast().forecastday![hourindex].hour![index].humidity!}%'),
                              const Text('Humidity'),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.white.withOpacity(0.4),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  height: 35,
                                  width: 35,
                                  color: Colors.white.withOpacity(0.4),
                                  child: Image.network(
                                      'https://img.icons8.com/fluency/48/null/clouds.png')),
                              Text(
                                  '${items!.getWeatherForcast().forecastday![hourindex].hour![index].cloud!}'),
                              const Text('Clouds'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          color: Colors.white.withOpacity(0.3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  height: 35,
                                  width: 35,
                                  color: Colors.white.withOpacity(0.4),
                                  child: Image.network(
                                      'https://img.icons8.com/fluency/48/null/windsock.png')),
                              Text(items!
                                  .getWeatherForcast()
                                  .forecastday![hourindex]
                                  .hour![index]
                                  .windDir!),
                              const Text('Wind Dir'),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.white.withOpacity(0.3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  height: 35,
                                  width: 35,
                                  color: Colors.white.withOpacity(0.4),
                                  child: Image.network(
                                      'https://img.icons8.com/fluency/48/null/wind.png')),
                              Text(
                                  '${items!.getWeatherForcast().forecastday![hourindex].hour![index].windMph!}Mph'),
                              const Text('Wind Speed'),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.white.withOpacity(0.3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  height: 35,
                                  width: 35,
                                  color: Colors.white.withOpacity(0.4),
                                  child: Image.network(
                                      'https://img.icons8.com/fluency/48/null/atmospheric-pressure.png')),
                              Text(
                                  '${items!.getWeatherForcast().forecastday![hourindex].hour![index].windDegree!}°'),
                              const Text('Wind Degree'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          color: Colors.white.withOpacity(0.3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  height: 35,
                                  width: 35,
                                  color: Colors.white.withOpacity(0.4),
                                  child: items!
                                              .getWeatherForcast()
                                              .forecastday![hourindex]
                                              .hour![index]
                                              .willItRain! ==
                                          1
                                      ? Image.network(
                                          'https://img.icons8.com/fluency/48/null/rain.png')
                                      : Image.network(
                                          'https://img.icons8.com/fluency/48/null/no-rain.png')),
                              Text(
                                  '${items!.getWeatherForcast().forecastday![hourindex].hour![index].willItRain!}'),
                              const Text('Will It Rain'),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.white.withOpacity(0.3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  height: 35,
                                  width: 35,
                                  color: Colors.white.withOpacity(0.4),
                                  child: Image.network(
                                      'https://img.icons8.com/fluency/48/null/light-rain-2.png')),
                              Text(
                                  '${items!.getWeatherForcast().forecastday![hourindex].hour![index].chanceOfRain!}%'),
                              const Text('Chance Of Rain'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          color: Colors.white.withOpacity(0.3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  height: 35,
                                  width: 35,
                                  color: Colors.white.withOpacity(0.4),
                                  child: Image.network(
                                      'https://img.icons8.com/fluency/48/null/snow.png')),
                              Text(
                                  '${items!.getWeatherForcast().forecastday![hourindex].hour![index].willItSnow!}'),
                              const Text('Will It Snow'),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.white.withOpacity(0.3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  height: 35,
                                  width: 35,
                                  color: Colors.white.withOpacity(0.4),
                                  child: Image.network(
                                    "https://img.icons8.com/fluency/48/null/winter.png",
                                  )),
                              Text(
                                  '${items!.getWeatherForcast().forecastday![hourindex].hour![index].chanceOfSnow!}%'),
                              const Text('Chance Of Snow'),
                            ],
                          ),
                        ),
                      ],
                    )
                  ]));
        }));
  }
}
