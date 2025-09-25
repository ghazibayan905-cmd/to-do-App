import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:testt/core/constant/app_colors.dart';
import 'package:testt/core/constant/app_image.dart';
import 'package:testt/shared/appbar.dart';
import 'package:testt/ui/view/weeks/week_2/task1_week2_controller.dart';
import 'package:testt/ui/view/weeks/week_2/widget/custome_listTile.dart';

class Task1Week2 extends StatelessWidget {
  final String label3;
  Task1Week2({super.key, required this.label3});

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

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Task1Week2Controller controller = Get.put(Task1Week2Controller());

    return Scaffold(
      appBar: Appbar(color: AppColors.mainColor, title: "task-$label3-"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Input Information about item",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainColor,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Title",
                          style: TextStyle(color: AppColors.mainColor),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: titleController,
                          decoration: InputDecoration(
                            hintText: "Software department",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Body",
                          style: TextStyle(color: AppColors.mainColor),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: bodyController,
                          decoration: InputDecoration(
                            hintText:
                                "contain some languages like (java, python)",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              controller.addItem(
                                titleController.text,
                                bodyController.text,
                              );
                              titleController.clear();
                              bodyController.clear();
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.mainColor,
                            ),
                            child: Text(
                              "Add",
                              style: TextStyle(color: AppColors.whiteColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: AppColors.mainColor,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Text(
                "Simple Shopping List App",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainColor,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GetBuilder<Task1Week2Controller>(
                builder: (controller) {
                  final allItems = [...tiles, ...controller.items];

                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: allItems.length,
                    itemBuilder: (context, index) {
                      final item = allItems[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Slidable(
                          key: ValueKey(item['title'] ?? index.toString()),
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) async {
                                  if (index >= tiles.length) {
                                    bool confirm = await showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text(
                                            " Confirm Delete",
                                            style: TextStyle(
                                              color: AppColors.mainColor,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          content: Text(
                                            "Are you sure delete this item",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: AppColors.mainColor,
                                            ),
                                          ),
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () =>
                                                  Navigator.pop(context, false),
                                              style: ElevatedButton.styleFrom(
                                                side: BorderSide(
                                                  color: AppColors.mainColor,
                                                ),
                                              ),

                                              child: const Text("Cancel"),
                                            ),
                                            SizedBox(width: 20),
                                            ElevatedButton(
                                              onPressed: () =>
                                                  Navigator.pop(context, true),
                                              style: ElevatedButton.styleFrom(
                                                side: BorderSide(
                                                  color: AppColors.mainColor,
                                                  width: 2,
                                                ),
                                                backgroundColor:
                                                    AppColors.mainColor,
                                                minimumSize: Size(100, 40),
                                              ),
                                              child: Text(
                                                "ok",
                                                style: TextStyle(
                                                  color: AppColors.whiteColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );

                                    if (confirm) {
                                      controller.removeItem(
                                        index - tiles.length,
                                      );
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text("تم حذف العنصر"),
                                        ),
                                      );
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "لا يمكن حذف هذا العنصر الأصلي",
                                        ),
                                      ),
                                    );
                                  }
                                },
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                            ],
                          ),
                          child: CustomListTile(
                            title: item['title'] ?? '',
                            subtitle: item['subtitle'] ?? item['body'] ?? '',
                            image: item['image'] ?? Appimages.education,
                            onTap: () {
                              print("تم الضغط على Tile ${index + 1}");
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
