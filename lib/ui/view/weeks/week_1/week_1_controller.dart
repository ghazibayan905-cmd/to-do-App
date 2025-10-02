import 'package:get/get.dart';
import 'package:testt/ui/view/weeks/week3/task_1_week_3.dart';
import 'package:testt/ui/view/weeks/week_1/task-2.dart';
import 'package:testt/ui/view/weeks/week_1/task_1.dart';
import 'package:testt/ui/view/weeks/week_2/task_1_week2.dart';

class Week1Controller extends GetxController {
  void selectCard(int index, String label) {
    switch (index) {
      case 1:
        Get.to(Task1(label2: label));
      case 2:
        Get.to(Task1Week2(label3: label));
      case 3:
        Get.to(Task1Week3());
    }
  }

  final List<String> cardWeek = ["simple counter App", "Basic contact Form"];
}
