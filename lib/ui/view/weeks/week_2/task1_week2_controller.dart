import 'package:get/get.dart';
import 'package:testt/core/constant/app_image.dart';

class Task1Week2Controller extends GetxController {
  //TODO  قائمة وحدة للتعديل والاضافة والثابتة

  final List<Map<String, String>> items = [];
  final List<Map<String, String>> editItems = [];
  String searchQuery = '';
  final List<Map<String, String>> tiles = [
    {
      "title": "Software department",
      "subtitle": "Flutter Custom Animation - Grocery App ",
      "image": Appimages.education,
    },
    {
      "title": "Design and graphics",
      "subtitle": "Flutter Custom Animation - Grocery App",
      "image": Appimages.education,
    },
    {
      "title": "Video montage and editing",
      "subtitle": "Flutter Custom Animation - Grocery App",
      "image": Appimages.education,
    },
    {
      "title": "Practical and vocational training",
      "subtitle": "Flutter Custom Animation - Grocery App",
      "image": Appimages.education,
    },
    {
      "title": "Technical and Software support",
      "subtitle": "Flutter Custom Animation - Grocery App",
      "image": Appimages.education,
    },
    {
      "title": "Digital marketing and social media management",
      "subtitle": "Flutter Custom Animation - Grocery App",
      "image": Appimages.education,
    },
  ];

  void addItem(String title, String body) {
    items.add({"title": title, "body": body}); // TODO 3
    update();
  }

  void removeItem(int index) {
    items.removeAt(index);
    update();
  }

  void removeTile(int index) {
    tiles.removeAt(index);
    update();
  }

  void editItem(int index, String title, String body) {
    items[index] = {"title": title, "body": body};
    update();
  }

  void editTile(int index, String title, String subtitle) {
    tiles[index]['title'] = title;
    tiles[index]['subtitle'] = subtitle;
    update();
  }

  void updateSearchQuery(String value) {
    searchQuery = value;
    update();
  }
}
