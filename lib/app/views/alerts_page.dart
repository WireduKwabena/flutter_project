import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/weather/alerts.dart';
import '../data/weather/location.dart';
import 'alert_details.dart';

class AlertsPage extends StatelessWidget {
  final Alerts info;
  final Location location;

  const AlertsPage({super.key, required this.info, required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          info.alert!.isEmpty
              ? Container(
                  color: Colors.black,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: Text('No Alerts for: ${location.name!}',
                          style: const TextStyle(color: Colors.white))),
                )
              : Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black,
                  child: ListView.builder(
                      itemCount: info.alert!.length,
                      itemBuilder: ((context, index) {
                        return Container(
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.blue.withOpacity(0.4),
                                    Colors.blue.withOpacity(0.9)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)),
                          child: ExpansionTile(
                            leading: const Icon(Icons.warning_amber_rounded,
                                color: Colors.red),
                            tilePadding: const EdgeInsets.all(10),
                            backgroundColor: Colors.blue.withOpacity(0.4),
                            title: Text(
                                'HeadLine: ${info.alert![index].headline!}',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20)),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    'Description: ${info.alert![index].desc!}',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 15)),
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: MaterialButton(
                                          color: Colors.white,
                                          onPressed: () {
                                            Get.to(() => AlertDetails(
                                                alert:
                                                    info.alert![index]));
                                          },
                                          child: const Text('More Dtails')),
                                    )
                                  ]),
                            ],
                          ),
                        );
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
        ]),
      ),
    );
  }
}
