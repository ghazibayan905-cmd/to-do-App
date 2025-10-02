import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/shared/widget/card_custom.dart';
import 'package:testt/core/constant/app_colors.dart';
import 'package:testt/shared/appbar.dart';
import 'package:testt/ui/view/weeks/week3/week_3_controller.dart';

class Week3View extends StatelessWidget {
  final String label;

  const Week3View({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final Week3Controller controller = Get.put(Week3Controller());
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
                children: List.generate(controller.cardWeek3.length, (index) {
                  return CardWeek(
                    ontap: () {
                      controller.selectCard3(index, (index + 1).toString());
                    },
                    color: AppColors.mainColor,
                    sizee: 15,
                    text1: (index + 1).toString(),

                    text2: controller.cardWeek3[index],
                    size2: 18,
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
