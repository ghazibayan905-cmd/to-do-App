import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/shared/widget/card_custom.dart';
import 'package:testt/core/constant/app_colors.dart';
import 'package:testt/shared/appbar.dart';
import 'package:testt/ui/view/home/home_controller.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
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
                children: List.generate(controller.cardWeek.length, (index) {
                  return CardWeek(
                    color: AppColors.blackColor,
                    sizee: 30,
                    size2: 20,

                    text1: controller.cardWeek[index],
                    ontap: () {
                      controller.selectCard(
                        index + 1,
                        controller.cardWeek[index],
                      );
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
