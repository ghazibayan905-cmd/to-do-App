import 'package:flutter/material.dart';
import 'package:testt/core/constant/app_colors.dart';

class CustomContainerAnsw extends StatelessWidget {
  final String? groupValue;
  final Function(String?)? onChanged;
  final String answer;
  const CustomContainerAnsw({
    super.key,
    this.groupValue,
    this.onChanged,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 100,
      decoration: BoxDecoration(border: Border.all(color: AppColors.mainColor)),
      child: RadioListTile<String>(
        title: Text(answer),
        value: answer,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
    );
  }
}
