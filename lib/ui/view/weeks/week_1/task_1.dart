import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:testt/core/constant/app_colors.dart';
import 'package:testt/shared/appbar.dart';
import 'package:testt/ui/view/weeks/week_1/tasK_1_controller.dart';

class Task1 extends StatelessWidget {
  final String label2;
  const Task1({super.key, required this.label2});

  @override
  Widget build(BuildContext context) {
    final TasK1Controller controller = Get.put(TasK1Controller());

    return Scaffold(
      appBar: Appbar(color: AppColors.mainColor, title: "task-$label2-"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Text(
                "Simple Counter App",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainColor,
                ),
              ),
            ),

            SizedBox(height: 230),
            GetBuilder<TasK1Controller>(
              builder: (controller) {
                return Container(
                  padding: EdgeInsets.all(20),
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color.fromARGB(255, 2, 33, 59), // لون الحدود
                      width: 3, // سماكة الحدود
                    ),
                    borderRadius: BorderRadius.circular(12), // زوايا مدورة
                  ),
                  child: Text(
                    controller.number.toString(),
                    style: TextStyle(color: AppColors.redColor, fontSize: 30),
                  ),
                );
              },
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: LinearBorder(),
                    backgroundColor: AppColors.mainColor,
                  ),
                  onPressed: () {},
                  child: IconButton(
                    onPressed: () {
                      controller.decrement();
                    },
                    icon: Icon(
                      Icons.remove,
                      color: AppColors.whiteColor,
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(width: 20),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: LinearBorder(),
                    backgroundColor: AppColors.mainColor,
                  ),
                  onPressed: () {},
                  child: IconButton(
                    onPressed: () {
                      controller.Accumulator();
                    },
                    icon: Icon(
                      Icons.add,
                      color: AppColors.whiteColor,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.whiteColor,
                side: BorderSide(color: AppColors.blackColor, width: 1),
                //  shape: LinearBorder(),
              ),
              onPressed: () {},
              child: IconButton(
                onPressed: () {
                  controller.clear();
                },
                icon: Icon(Icons.clear, color: AppColors.blackColor, size: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
