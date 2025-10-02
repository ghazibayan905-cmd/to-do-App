import 'package:get/get.dart';
import 'package:testt/core/constant/constant.dart';
import 'package:testt/core/utilis.dart';
import 'package:testt/ui/view/weeks/week3/week_3_view.dart';
import 'package:testt/ui/view/weeks/week_2/week_2.dart';
import 'package:testt/ui/view/weeks/week_1/week_1.dart';

class HomeController extends GetxController {
  List<String> cardWeek = <String>[];
  void selectCard(int index, String label) {
    switch (index) {
      case 1:
        Get.to(Week1(label: label));
      case 2:
        Get.to(Week2(label: label));
      case 3:
        Get.to(Week3View(label: label));
    }
  }

  // void storageWeek() {
  // storage.setWeeksInfo(cardWeek);
  // storage.getWeeksInfo();
  // }
  @override
  void onInit() {
    super.onInit();
    if (storage.getWeeksInfo().isEmpty) {
      storage.setWeeksInfo(weeks);
    }
    cardWeek = storage.getWeeksInfo();
  }
}
