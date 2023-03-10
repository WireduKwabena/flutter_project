import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoNetworkWidget extends GetView {
  final String title;
  final String details;
  final String image;
  const NoNetworkWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Container(
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 100,
                  width: 100,
                  color: Colors.grey.withOpacity(0.15),
                  child: Image.asset(image)),
              const SizedBox(height: 15),
              Text(title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              Text(details,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),



              // const SizedBox(height: 10),
              // ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //         backgroundColor: Colors.deepPurple),
              //     onPressed: () {
              //       controller.refresher();
              //     },
              //     child: const Text('Retry'))


              
            ]),
      ),
    )));
  }
}
