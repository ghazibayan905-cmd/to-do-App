import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:testt/ui/view/home/home.dart';
import 'package:testt/splash_screen/splash_screen.dart';
import 'package:testt/ui/view/weeks/week3/task_1_week_3.dart';

void main() {
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

      home: Task1Week3(),
    );
  }
}
