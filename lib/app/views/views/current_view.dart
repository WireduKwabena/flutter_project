import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:humidy/app/views/views/searchcountry_view.dart';

import '../../data/weather/weather.dart';
import '../../modules/home/controllers/home_controller.dart';
import '../airquality_nextdays.dart';
import '../alerts_page.dart';
import '../current_airquality.dart';

class CurrentView extends GetView<HomeController> {
  final Weather? items;
  const CurrentView({Key? key, required this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 455,
      width: MediaQuery.of(context).size.width * 0.94,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(colors: [
            Colors.blue.withOpacity(0.4),
            Colors.blue.withOpacity(0.9)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(
              margin: const EdgeInsets.only(top: 15),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(width: 2, color: Colors.grey),
                //shape: BoxShape.circle,
              ),
              child: Image.asset('Images/haze-100.png'),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              alignment: Alignment.center,
              child: Row(children: [
                Image.network(
                    "https://img.icons8.com/fluency/48/null/marker-sun.png",
                    height: 25,
                    width: 25),
                const SizedBox(width: 5),
                Text(items!.getLocationDetails().name!,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold))
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: PopupMenuButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  itemBuilder: (BuildContext context) => [
                        PopupMenuItem(
                          value: 'Other Locations',
                          child: ListTile(
                            leading:
                                const Icon(Icons.search, color: Colors.black),
                            title: const Text('Other Locations'),
                            onTap: () {
                              Navigator.pop(context, 'Other Locations');
                              Get.to(() => const SearchcountryView(),
                                  fullscreenDialog: true,
                                  transition: Transition.upToDown,
                                  duration: const Duration(seconds: 1));
                            },
                          ),
                        ),
                        PopupMenuItem(
                          value: 'Cureent Air Quality',
                          child: ListTile(
                            leading: const Icon(Icons.air, color: Colors.black),
                            title: const Text('Current Air Quality'),
                            onTap: () {
                              Navigator.pop(context, 'Cureent Air Quality');
                              Get.to(
                                () => AirQualityPage(items: items),
                                transition: Transition.upToDown,
                                duration: const Duration(seconds: 1),
                              );
                            },
                          ),
                        ),
                        PopupMenuItem(
                          value: 'Other Details',
                          child: ListTile(
                            leading:
                                const Icon(Icons.more, color: Colors.black),
                            title: const Text('Other Details'),
                            onTap: () {
                              Navigator.pop(context, 'Cureent Air Quality');
                              Get.to(
                                () => OtherDetails(items: items),
                                transition: Transition.upToDown,
                                duration: const Duration(seconds: 1),
                              );
                            },
                          ),
                        ),
                        PopupMenuItem(
                          value: 'Alerts',
                          child: ListTile(
                            leading:
                                const Icon(Icons.message, color: Colors.black),
                            title: const Text('Alerts'),
                            onTap: () {
                              Navigator.pop(context, 'Cureent Air Quality');
                              Get.to(
                                () => AlertsPage(
                                  info: items!.getWeatherAlerts(),
                                  location: items!.getLocationDetails(),
                                ),
                                transition: Transition.upToDown,
                                duration: const Duration(seconds: 1),
                              );
                            },
                          ),
                        ),
                        PopupMenuItem(
                          value: 'Location Details',
                          child: ListTile(
                            leading: const Icon(Icons.info_outline,
                                color: Colors.black),
                            title: const Text('Location Details'),
                            onTap: () {
                              Navigator.pop(context, 'Location Details');
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.grey[300],
                                      title: Text(
                                          'Details on: ${items!.getLocationDetails().name!}'),
                                      content: SizedBox(
                                        height: 210,
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                  'Name:  ${items!.getLocationDetails().name!}',
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(
                                                  'Region:  ${items!.getLocationDetails().region!}',
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(
                                                  'Country:  ${items!.getLocationDetails().country!}',
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(
                                                  'Latitude:  ${items!.getLocationDetails().lat!}',
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(
                                                  'Longitude:  ${items!.getLocationDetails().lon!}',
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(
                                                  'Time:  ${items!.getLocationDetails().localtime!}',
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    IconButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        icon: const Icon(
                                                            Icons.cancel,
                                                            color: Colors.red)),
                                                  ])
                                            ]),
                                      ),
                                    );
                                  });
                            },
                          ),
                        )
                      ],
                  child: const Icon(Icons.more_vert, color: Colors.white)),
            ),
          ]),
          Container(
            height: 100,
            alignment: Alignment.center,
            child: items!.getCurrentWeather().condition!.text! == 'Fog'
                ? Image.network(
                    'https://img.icons8.com/fluency/100/null/fog-night.png')
                : Image.network(items!
                    .getCurrentWeather()
                    .condition!
                    .icon!
                    .replaceAll('//', 'https://')),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text.rich(TextSpan(
                  text: "${items!.getCurrentWeather().tempC!}°",
                  style: const TextStyle(color: Colors.white, fontSize: 100),
                  children: <InlineSpan>[
                    TextSpan(
                      text: items!.getCurrentWeather().condition!.text!,
                      style:
                          TextStyle(color: Colors.grey.shade300, fontSize: 18),
                    ),
                  ])),
              Text(
                items!.getLocationDetails().localtime!,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          Container(
              alignment: Alignment.center,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        margin: const EdgeInsets.all(5),
                        alignment: Alignment.center,
                        child: Column(children: [
                          Container(
                              margin: const EdgeInsets.all(5),
                              alignment: Alignment.center,
                              height: 40,
                              width: 40,
                              color: Colors.white.withOpacity(0.3),
                              child: Image.network(
                                  "https://img.icons8.com/fluency/48/null/wind.png")),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              '${items!.getCurrentWeather().windMph!}Mph',
                              style: TextStyle(color: Colors.grey.shade200),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text('Wind Speed',
                                style: TextStyle(color: Colors.grey.shade200)),
                          ),
                        ])),
                    Container(
                        margin: const EdgeInsets.all(5),
                        alignment: Alignment.center,
                        child: Column(children: [
                          Container(
                              margin: const EdgeInsets.all(5),
                              alignment: Alignment.center,
                              height: 40,
                              width: 40,
                              color: Colors.white.withOpacity(0.3),
                              child: Image.network(
                                  'https://img.icons8.com/fluency/48/null/hygrometer.png')),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              '${items!.getCurrentWeather().humidity!}%',
                              style: TextStyle(color: Colors.grey.shade200),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text('Humidity',
                                style: TextStyle(color: Colors.grey.shade200)),
                          ),
                        ])),
                    Container(
                        margin: const EdgeInsets.all(5),
                        alignment: Alignment.center,
                        child: Column(children: [
                          Container(
                              margin: const EdgeInsets.all(5),
                              alignment: Alignment.center,
                              height: 40,
                              width: 40,
                              color: Colors.white.withOpacity(0.3),
                              child: Image.network(
                                  "https://img.icons8.com/fluency/48/null/windsock.png")),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              items!.getCurrentWeather().windDir!,
                              style: TextStyle(color: Colors.grey.shade200),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text('Wind Direction',
                                style: TextStyle(color: Colors.grey.shade200)),
                          ),
                        ])),
                  ]))
        ],
      )),
    );
  }
}
