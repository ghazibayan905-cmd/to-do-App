import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:testt/core/repositories/hive_repositories.dart';
import 'package:testt/core/utilis.dart';
import 'package:testt/splash_screen/splash_screen.dart';

void main() {
  Get.put(HiveRepository());
  storage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home: SplashScreen(),
    );
  }
}
