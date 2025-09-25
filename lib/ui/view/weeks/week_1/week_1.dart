import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/shared/widget/card_custom.dart';
import 'package:testt/core/constant/app_colors.dart';
import 'package:testt/shared/appbar.dart';
import 'package:testt/ui/view/weeks/week_1/task-2.dart';
import 'package:testt/ui/view/weeks/week_1/task_1.dart';
import 'package:testt/ui/view/weeks/week_1/week_1_controller.dart';

class Week1 extends StatelessWidget {
  final String label;

  Week1({super.key, required this.label});

  

  @override
  Widget build(BuildContext context) {
     final Week1Controller controller = Get.put(Week1Controller());
    return Scaffold(
      appBar: Appbar(title: label, color: AppColors.mainColor),
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          children: [
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                children: List.generate(controller.cardWeek.length, (index) {
                  return CardWeek(
                    ontap: () {
                     controller.selectCard(index + 1, (index + 1).toString());
                    },
                    color: AppColors.mainColor,
                    sizee: 15,
                    text1: (index + 1).toString(),

                    text2:controller.cardWeek[index],
                    size2: 15,
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
