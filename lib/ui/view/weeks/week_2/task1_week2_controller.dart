import 'package:get/get.dart';

class Task1Week2Controller extends GetxController {
  final List<Map<String, String>> items = [];

  void addItem(String title, String body) {
    items.add({"title": title, "body": body});
    update();
  }

  void removeItem(int index) {
    items.removeAt(index);
    update();
  }
}
