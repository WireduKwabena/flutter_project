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
      theme:ThemeData(
        useMaterial3:true,
        colorScheme:ColorScheme.fromSeed(seedColor:Colors.blue),
      ),
      darkTheme:ThemeData(
        useMaterial3:true,
        brightness:Brightness.dark,
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}