import 'package:get/get.dart';
import 'package:testt/ui/view/weeks/week3/task_1_week_3.dart';

class Week3Controller extends GetxController {
  void selectCard3(int index, String label) {
    switch (index) {
      case 0:
        Get.to(() => const Task1Week3());
        break;
      default:
        Get.snackbar("خطأ", "لم يتم العثور على هذه المهمة");
    }
  }

  final List<String> cardWeek3 = ["Quiz App"];
}
