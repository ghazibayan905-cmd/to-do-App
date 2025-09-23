import 'package:get/get.dart';

class TasK1Controller extends GetxController {
  int number = 0;
  void Accumulator() {
    number++;
    update();
  }

  void decrement() {
    if (number != 0) {
      number--;
      update();
    } else {
      Get.snackbar("stop", "dont click ");
    }
  }

  void clear() {
    number = 0;
    update();
  }
}
