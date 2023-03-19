import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../views/next_forcast.dart';
import '../../../views/no_network.dart';
import '../../../views/views/current_view.dart';
import '../../../views/views/hourly_weather_widget.dart';
import '../../../views/views/searchcountry_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final weatherController = Get.find<HomeController>();

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Obx(() => controller.connectionStatus.value == 1
            ? Center(
                child: RefreshIndicator(
                    onRefresh: () async {
                      weatherController.refresher();
                    },
                    child: controller.obx((state) {
                      return SafeArea(
                        child: SingleChildScrollView(
                          child: state == null
                              ? Container(
                                  color: Colors.black,
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            SizedBox(
                                                width: 40,
                                                height: 40,
                                                child: Icon(Icons.warning,
                                                    color: Colors.red)),
                                            SizedBox(width: 10),
                                            Text("Unavailable",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                ))
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        const Text(
                                            "No matching location for your search!.\n pull to refresh!",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            )),
                                        const SizedBox(height: 20),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              const Divider(
                                                  height: 2, color: Colors.red),
                                              const Text("Or",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13,
                                                  )),
                                              Divider(
                                                  height: 2,
                                                  color: Colors.grey[300])
                                            ]),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              TextButton(
                                                  onPressed: () {
                                                    Get.to(
                                                        () =>
                                                            const SearchcountryView(),
                                                        fullscreenDialog: true,
                                                        transition:
                                                            Transition.upToDown,
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    600));
                                                  },
                                                  child: const Text("Search,",
                                                      style: TextStyle(
                                                        color: Colors.blue,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15,
                                                      ))),
                                              const Text(
                                                  " for other locations of your choice.",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                  )),
                                            ]),
                                      ]))
                              : Column(
                                  children: [
                                    CurrentView(items: state),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 8.0, top: 10.0),
                                      child: SizedBox(
                                          height: 35,
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text('Today',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text(
                                                    controller.getDate(state
                                                        .getWeatherForcast()
                                                        .forecastday![0]
                                                        .dateEpoch!),
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                TextButton(
                                                    onPressed: () {
                                                      Get.to(
                                                          transition: Transition
                                                              .upToDown,
                                                          duration:
                                                              const Duration(
                                                                  seconds: 1),
                                                          () => NextForcast(
                                                              items: state));
                                                    },
                                                    child: const Text(
                                                        'Next 3 Days >')),
                                              ])),
                                    ),
                                    HourlyDataWidget(
                                      weather: state,
                                    ),
                                  ],
                                ),
                        ),
                      );
                    },
                        onLoading: loading(context),
                        onError: (error) => SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: errorView(context, error)),
                        onEmpty: const NoNetworkWidget(
                            image: 'Images/nothing-found-100.png',
                            title: 'Content not Available',
                            details: 'No Content Found'))),
              )
            : const NoNetworkWidget(
                image: 'Images/broken-link-100.png',
                title: 'Internet Connection',
                details: 'Device Not Connected to the Internet')));
  }

  Widget errorView(BuildContext context, var error) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 100,
                width: 100,
                color: Colors.white.withOpacity(0.2),
                child: const Icon(Icons.error_outline_sharp,
                    size: 95, color: Colors.red)),
            const SizedBox(height: 15),
            const Text('Error!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
            Text('$error',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple),
                onPressed: () {
                  controller.refresher();
                },
                child: const Text('Retry'))
          ]),
    );
  }

  Widget loading(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            SizedBox(height: 15),
            Text('Loading...',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ]),
    );
  }
}

// if (controller.checkIsLoading().isTrue ||
          //     controller.checkIsFromSearchBar().isTrue) {
          //   
          // } else {
          