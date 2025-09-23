import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/card_custom.dart';
import 'package:testt/core/constant/app_colors.dart';
import 'package:testt/home.dart';
import 'package:testt/shared/appbar.dart';
import 'package:testt/weeks/task-2.dart';
import 'package:testt/weeks/task_1.dart';

class Week1 extends StatelessWidget {
  final String label;

  Week1({super.key, required this.label});
  final List<String> cardWeek = ["simple counter App", "Basic contact Form"];
  void selectCard(int index, String label) {
    switch (index) {
      case 1:
        Get.to(Task1(label2: label));
      case 2:
        Get.to(Task2(label2: label));
    }
  }

  @override
  Widget build(BuildContext context) {
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
                children: List.generate(cardWeek.length, (index) {
                  return CardWeek(
                    ontap: () {
                      selectCard(index + 1, (index + 1).toString());
                    },
                    color: AppColors.mainColor,
                    sizee: 15,
                    text1: (index + 1).toString(),

                    text2: cardWeek[index],
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
