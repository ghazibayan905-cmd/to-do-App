import 'package:flutter/material.dart';
import 'package:testt/core/constant/app_colors.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  final Color? color;
  final String title;

  const Appbar({super.key, this.color, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.whiteColor),
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 25,
          fontWeight: FontWeight.w700,
        ),
      ),
      backgroundColor: color ?? AppColors.mainColor,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
