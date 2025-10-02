import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskWeek4Controller extends GetxController {
  TextEditingController title = TextEditingController();
  StateTask currentStateTask = StateTask.all;
  // List<TaskItemModel> alltasks = <TaskItemModel>[];
  // List<TaskItemModel> filtertasks = <TaskItemModel>[];
  addTask() {}
  editTask() {}
  deleteTask() {}
  filterTaskState() {}
  Color checkColorState() {
    switch (currentStateTask) {
      case StateTask.all:
        return Colors.white;

      case StateTask.toDo:
        return Colors.blue;
      case StateTask.processing:
        return Colors.red;
      case StateTask.finished:
        return Colors.yellow;
    }

  }
  @override
  void onInit() {
    super.onInit();
  // //  alltasks= storage.getTasks();
  // filtertasks=alltasks;

  }
}

enum StateTask { all, toDo, processing, finished }
