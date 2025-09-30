import 'package:flutter/material.dart';
import 'package:testt/core/constant/app_colors.dart';

class CardWeek extends StatelessWidget {
  final String text1;
  final String? text2;
  final VoidCallback? ontap;
  final double sizee;
  final Color? color;
  final double size2;

  const CardWeek({
    super.key,
    required this.text1,
    this.text2,
    this.ontap,
    required this.sizee,
    required this.color,
    required this.size2,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Card(
        color: AppColors.whiteColor,

        shadowColor: AppColors.mainColor,

        elevation: 4,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text1,
                style: TextStyle(fontSize: sizee, color: color),
              ),
              if (text2 != null)
                Text(
                  text2 ?? '0',
                  style: TextStyle(
                    fontSize: size2,
                    color: AppColors.blackColor,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
