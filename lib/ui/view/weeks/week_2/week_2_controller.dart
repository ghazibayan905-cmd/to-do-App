import 'package:get/get.dart';
import 'package:testt/ui/view/weeks/week3/task_1_week_3.dart';
import 'package:testt/ui/view/weeks/week_1/task-2.dart';
import 'package:testt/ui/view/weeks/week_1/task_1.dart';
import 'package:testt/ui/view/weeks/week_2/task_1_week2.dart';

class Week2Controller extends GetxController {
  void selectCard2(int index, String label) {
    switch (index) {
      case 1:
        Get.to(Task1Week2(label3: label));
      case 2:
        Get.to(Task1Week2(label3: label));
      
    }
  }

  final List<String> cardWeek2 = [" simple Shopping List App"];
}
