import 'package:get/get.dart';
import 'package:testt/core/constant/app_image.dart';
import 'package:testt/core/model/week_2_model.dart';

class Task1Week2Controller extends GetxController {
  final List<TaskItemModel> taskItems = [];

  String searchQuery = '';

  @override
  void onInit() {
    super.onInit();
    _initDefaultItems(); 
  }

  void _initDefaultItems() {
    taskItems.addAll([
      TaskItemModel(
        title: "Software department",
        subtitle: "Flutter Custom Animation - Grocery App",
        image: Appimages.education,
      ),
      TaskItemModel(
        title: "Design and graphics",
        subtitle: "Flutter Custom Animation - Grocery App",
        image: Appimages.education,
      ),
      TaskItemModel(
        title: "Video montage and editing",
        subtitle: "Flutter Custom Animation - Grocery App",
        image: Appimages.education,
      ),
      TaskItemModel(
        title: "Practical and vocational training",
        subtitle: "Flutter Custom Animation - Grocery App",
        image: Appimages.education,
      ),
      TaskItemModel(
        title: "Technical and Software support",
        subtitle: "Flutter Custom Animation - Grocery App",
        image: Appimages.education,
      ),
      TaskItemModel(
        title: "Digital marketing and social media management",
        subtitle: "Flutter Custom Animation - Grocery App",
        image: Appimages.education,
      ),
    ]);
  }

  void addItem(String title, String subtitle, String image) {
    taskItems.add(TaskItemModel(title: title, subtitle: subtitle, image: image));
    update();
  }

  void removeItem(int index) {
    taskItems.removeAt(index);
    update();
  }

  void editItem(int index, String newTitle, String newSubtitle, String newImage) {
    taskItems[index].title = newTitle;
    taskItems[index].subtitle = newSubtitle;
    taskItems[index].image = newImage;
    update();
  }

  void updateSearchQuery(String value) {
    searchQuery = value;
    update();
  }

  List<TaskItemModel> get filteredItems {
    if (searchQuery.isEmpty) return taskItems;
    return taskItems
        .where((item) =>
            item.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
            item.subtitle.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }
}
