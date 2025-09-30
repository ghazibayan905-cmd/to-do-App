import 'package:flutter/material.dart';
import 'package:testt/core/constant/app_colors.dart';

class CustomListTile extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;

  const CustomListTile({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //TODO Shadow
      // decoration: BoxDecoration(boxShadow: [
      //   BoxShadow(

      //   )
      // ]),
      child: ListTile(
        onTap: onTap,
        leading: Image.asset(image, width: 100, height: 100, fit: BoxFit.cover),
        trailing: InkWell(
          onTap: onEdit,
          child: Icon(Icons.edit, color: AppColors.mainColor),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: AppColors.mainColor,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        tileColor: Colors.white,
      ),
    );
  }
}
