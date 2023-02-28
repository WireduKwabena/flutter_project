import 'package:flutter/material.dart';

import 'package:get/get.dart';

// import 'app/modules/home/controllers/home_controller.dart';
import 'app/routes/app_pages.dart';
// import 'app/views/no_network.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}