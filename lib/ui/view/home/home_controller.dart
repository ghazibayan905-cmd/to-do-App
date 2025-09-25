import 'package:get/get.dart';
import 'package:testt/ui/view/weeks/week_2/week_2.dart';
import 'package:testt/ui/view/weeks/week_1/week_1.dart';

class HomeController extends GetxController {
  final List<String> cardWeek = [
    "week-1-",
    "week-2-",
    "week-3-",
    "week-4-",
    "week-5-",
  ];
  void selectCard(int index, String label) {
    switch (index) {
      case 1:
        Get.to(Week1(label: label));
      case 2:
        Get.to(Week2(label: label));
    }
  }
}
