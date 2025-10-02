import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:testt/core/constant/app_colors.dart';
import 'package:testt/core/constant/app_image.dart';
import 'package:testt/core/model/week_2_model.dart';
import 'package:testt/shared/appbar.dart';
import 'package:testt/ui/view/weeks/week_2/task1_week2_controller.dart';
import 'package:testt/ui/view/weeks/week_2/widget/custome_listTile.dart';

class Task1Week2 extends StatelessWidget {
  final String label3;
  Task1Week2({super.key, required this.label3});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Task1Week2Controller controller = Get.put(Task1Week2Controller());

    return Scaffold(
      appBar: Appbar(color: AppColors.mainColor, title: "task-$label3-"),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddDialog(context, controller),
        backgroundColor: AppColors.mainColor,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: controller.updateSearchQuery,
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                "Simple Shopping List App",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainColor,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GetBuilder<Task1Week2Controller>(
                builder: (controller) {
                  final filteredItems = controller.filteredItems;

                  if (filteredItems.isEmpty) {
                    return const Center(child: Text("No items found"));
                  }

                  return ListView.builder(
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      final TaskItemModel item = filteredItems[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Slidable(
                          key: ValueKey(item.title),
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) async {
                                  final confirm = await _confirmDelete(context);
                                  if (!confirm) return;

                                  controller.removeItem(index);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("تم حذف العنصر "),
                                    ),
                                  );
                                },
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                            ],
                          ),
                          child: CustomListTile(
                            title: item.title,
                            subtitle: item.subtitle,
                            image: item.image,
                            onTap: () {},
                            onEdit: () {
                              _showEditDialog(context, controller, index, item);
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

  /// 📝 نافذة تعديل عنصر
  void _showEditDialog(
    BuildContext context,
    Task1Week2Controller controller,
    int index,
    TaskItemModel item,
  ) {
    titleController.text = item.title;
    subtitleController.text = item.subtitle;

    showDialog(
      context: context,
      builder: (context) {
        return _buildItemDialog(
          context,
          title: "Edit Item",
          onConfirm: () {
            controller.editItem(
              index,
              titleController.text,
              subtitleController.text,
              item.image, // نحافظ على الصورة نفسها
            );
            Navigator.pop(context);
          },
        );
      },
    );
  }

  /// ➕ نافذة إضافة عنصر جديد
  void _showAddDialog(BuildContext context, Task1Week2Controller controller) {
    titleController.clear();
    subtitleController.clear();

    showDialog(
      context: context,
      builder: (context) {
        return _buildItemDialog(
          context,
          title: "Add New Item",
          onConfirm: () {
            controller.addItem(
              titleController.text,
              subtitleController.text,
              Appimages.education, // صورة افتراضية
            );
            Navigator.pop(context);
          },
        );
      },
    );
  }

  /// 📌 نموذج النافذة الموحدة للإضافة أو التعديل
  Widget _buildItemDialog(
    BuildContext context, {
    required String title,
    required VoidCallback onConfirm,
  }) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainColor,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: subtitleController,
                decoration: InputDecoration(
                  labelText: "Subtitle",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: onConfirm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mainColor,
                  ),
                  child: Text(
                    "Save",
                    style: TextStyle(color: AppColors.whiteColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🗑️ تأكيد الحذف
  Future<bool> _confirmDelete(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              "Confirm Delete",
              style: TextStyle(
                color: AppColors.mainColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: const Text("Are you sure to delete this item"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.mainColor,
                ),
                child: const Text("Delete"),
              ),
            ],
          ),
        ) ??
        false;
  }
}
