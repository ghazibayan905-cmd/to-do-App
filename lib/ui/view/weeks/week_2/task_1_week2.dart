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

  final TextEditingController titleController = TextEditingController();

  final TextEditingController bodyController = TextEditingController();

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Task1Week2Controller controller = Get.put(Task1Week2Controller());

    return Scaffold(
      appBar: Appbar(
        color: AppColors.mainColor,
        title: "task-$label3-",
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddDialog(context, controller);
        },
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
                  final allItems = [...controller.items, ...controller.tiles];

                  final filteredItems = allItems.where((item) {
                    final title = item['title']?.toLowerCase() ?? '';
                    final subtitle = (item['subtitle'] ?? item['body'] ?? '')
                        .toLowerCase();
                    final query = controller.searchQuery.toLowerCase();
                    return title.contains(query) || subtitle.contains(query);
                  }).toList();

                  return ListView.builder(
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      final isAddedItem = controller.items.contains(item);
                      final isOriginalItem =controller.tiles.contains(item);

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Slidable(
                          key: ValueKey(item['title'] ?? index.toString()),
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) async {
                                  bool confirm = await _confirmDelete(context);
                                  if (!confirm) return;

                                  if (isAddedItem) {
                                    controller.removeItem(
                                      controller.items.indexOf(item),
                                    );
                                  } else if (isOriginalItem) {
                                    controller.removeTile(
                                      controller.tiles.indexOf(item),
                                    );
                                  }

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
                            title: item['title'] ?? '',
                            subtitle: item['subtitle'] ?? item['body'] ?? '',
                            image: item['image'] ?? Appimages.education,
                            onTap: () {},
                            onEdit: () {
                              if (isAddedItem) {
                                _showEditDialogForAdded(
                                  context,
                                  controller,
                                  controller.items.indexOf(item),
                                  item,
                                );
                              } else if (isOriginalItem) {
                                _showEditDialogForOriginal(
                                  context,
                                  controller.tiles.indexOf(item),
                                  item,
                                );
                              }
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

  void _showEditDialogForAdded(
    BuildContext context,
    Task1Week2Controller controller,
    int index,
    Map<String, String> item,
  ) {
    titleController.text = item['title'] ?? '';
    bodyController.text = item['body'] ?? '';
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
              bodyController.text,
            );
            Navigator.pop(context);
          },
        );
      },
    );
  }

void _showEditDialogForOriginal(
  BuildContext context,
  int index,
  Map<String, String> item,
) {
  final controller = Get.find<Task1Week2Controller>(); 

  titleController.text = item['title'] ?? '';
  bodyController.text = item['subtitle'] ?? '';

  showDialog(
    context: context,
    builder: (context) {
      return _buildItemDialog(
        context,
        title: "Edit Original Item",
        onConfirm: () {
          controller.editTile(
            index,
            titleController.text,
            bodyController.text,
          );
          Navigator.pop(context);
        },
      );
    },
  );
}

  void _showAddDialog(BuildContext context, Task1Week2Controller controller) {
    titleController.clear();
    bodyController.clear();
    showDialog(
      context: context,
      builder: (context) {
        return _buildItemDialog(
          context,
          title: "Add New Item",
          onConfirm: () {
            controller.addItem(titleController.text, bodyController.text);
            Navigator.pop(context);
          },
        );
      },
    );
  }

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
                controller: bodyController,
                decoration: InputDecoration(
                  labelText: "Body",
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
                child: const Text("cancel"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.mainColor,
                ),
                child: const Text("delete"),
              ),
            ],
          ),
        ) ??
        false;
  }
}
