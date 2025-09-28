import 'package:get/get.dart';

class Task1Week2Controller extends GetxController {
  final List<Map<String, String>> items = [];
  final List<Map<String, String>> editItems = [];
  String searchQuery = '';

  void addItem(String title, String body) {
    items.add({"title": title, "body": body});
    update();
  }

  void removeItem(int index) {
    items.removeAt(index);
    update();
  }

  void editItem(int index, String title, String body) {
    items[index] = {"title": title, "body": body};
    update();
  }

  void updateSearchQuery(String value) {
    searchQuery = value;
    update();
  }
}
