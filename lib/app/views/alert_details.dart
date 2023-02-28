import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/weather/alert.dart';
import '../modules/home/controllers/home_controller.dart';



class AlertDetails extends GetView<HomeController> {
  final Alert alert;
  const AlertDetails({super.key, required this.alert});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            color: Colors.black,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('Headline',
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${alert.headline!}.',
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  const Divider(
                    height: 2,
                    color: Colors.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('Event.',
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${alert.event!}.',
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                  const Divider(
                    height: 2,
                    color: Colors.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('Description.',
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${alert.desc!}.',
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                  const Divider(
                    height: 2,
                    color: Colors.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('Areas.',
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${alert.areas!}.',
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                  const Divider(
                    height: 2,
                    color: Colors.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('Note.',
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${alert.note!}.',
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                  const Divider(
                    height: 2,
                    color: Colors.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('Instruction.',
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${alert.instruction!}.',
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                  const Divider(
                    height: 2,
                    color: Colors.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('Certainty.',
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${alert.certainty!}.',
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                  const Divider(
                    height: 2,
                    color: Colors.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('Category.',
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${alert.category!}.',
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                  const Divider(
                    height: 2,
                    color: Colors.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('Urgency.',
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${alert.urgency!}.',
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                  const Divider(
                    height: 2,
                    color: Colors.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('Severity.',
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${alert.severity!}.',
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                  const Divider(
                    height: 2,
                    color: Colors.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('Message Type.',
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${alert.msgtype!}.',
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                  const Divider(
                    height: 2,
                    color: Colors.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('Effective.',
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${alert.effective!}.',
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                  const Divider(
                    height: 2,
                    color: Colors.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('Expires.',
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${alert.expires!}.',
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
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
      )),
    );
  }
}
