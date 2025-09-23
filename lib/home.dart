import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/card_custom.dart';
import 'package:testt/core/constant/app_colors.dart';
import 'package:testt/shared/appbar.dart';
import 'package:testt/week_1.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final List<String> cardWeek = [
    "week-1-",
    "week-2-",
    "week-3-",
    "week-4-",
    "week-5-",
  ];
  void selectCard(int index, String label) {
    switch (index) {
      case 1:
        Get.to(Week1(label: label));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(title: "weeks", color: AppColors.mainColor),
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
                    color: AppColors.blackColor,
                    sizee: 30,

                    text1: cardWeek[index],
                    ontap: () {
                      selectCard(index + 1, cardWeek[index]);
                    },
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
