import 'package:flutter/material.dart';
import 'package:testt/core/constant/app_colors.dart';
import 'package:testt/shared/appbar.dart';

class Task2 extends StatelessWidget {
  final String label2;

  const Task2({super.key, required this.label2});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(color: AppColors.mainColor, title: "task-$label2-"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  "Basic Contact Form",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.mainColor,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name", style: TextStyle(color: AppColors.mainColor)),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: " bayan ghazi",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),

                  Text("Email", style: TextStyle(color: AppColors.mainColor)),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: " bayanghazi@hmail.com",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Text("Message", style: TextStyle(color: AppColors.mainColor)),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: " Hiii",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 50),
                        backgroundColor: AppColors.mainColor,
                      ),
                      child: Text(
                        "Submit",
                        style: TextStyle(color: AppColors.whiteColor),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
