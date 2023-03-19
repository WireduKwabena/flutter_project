import 'package:flutter/material.dart';
import '../controllers/home_controller.dart';
import 'package:get/get.dart';
import '../../../views/views/searchcountry_view.dart';

class ErrorView extends GetView<HomeController> {
  final weatherController = Get.find<HomeController>();

  ErrorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                      width: 40,
                      height: 40,
                      child: Icon(Icons.warning, color: Colors.red, size: 35)),
                  const SizedBox(width: 10),
                  Text(
                      "Error(${weatherController.errorMessage.error?.code})" /**/,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ))
                ],
              ),
              const SizedBox(height: 20),
              Text(
                  "${weatherController.errorMessage.error?.message}.\n pull to refresh!",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  )),
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Divider(height: 2, color: Colors.grey[300]),
                const Text("Or",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    )),
                Divider(height: 2, color: Colors.grey[300])
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                TextButton(
                    onPressed: () {
                      Get.to(() => const SearchcountryView(),
                          fullscreenDialog: true,
                          transition: Transition.upToDown,
                          duration: const Duration(milliseconds: 700));
                    },
                    child: const Text("Search,",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ))),
                const Text(" for other locations of your choice.",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    )),
              ]),
            ]));
  }
}
