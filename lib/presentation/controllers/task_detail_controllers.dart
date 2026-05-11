import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify/data/subtask_model.dart';
import 'package:taskify/data/task_model.dart';

class TaskDetailControllers extends GetxController{
  var tasks = Rxn<TaskModel>();

  void setTask(TaskModel taskData) {
    tasks.value = taskData;
  }

  void toggleSubtask(int index) {
    final currentTask = tasks.value;

    if (currentTask == null) return;
    final subTask = currentTask.subTask[index];
    subTask.isDone = !subTask.isDone;
    //tasks.value = currentTask;
    tasks.refresh();
  }

  void addSubtask(String title) {
    final currentTask = tasks.value;

    if (currentTask == null) return;
    if (title.trim().isEmpty) return;
    currentTask.subTask.add(SubtaskModel(title: title));
    //tasks.value = currentTask;
    tasks.refresh();
  }

  int get completedCount {
    final currentTask = tasks.value;

    if (currentTask == null) return 0;
    return currentTask.subTask.where((s) => s.isDone).length;
  }

  void showAddSubtaskDialog() {
    final textController = TextEditingController();

    Get.defaultDialog(
      title: 'Add New Subtask',
      content: TextField(
        controller: textController,
        decoration: InputDecoration(
          hintText: 'Enter subtask title'
        ),
      ),
      textConfirm: 'Add',
      onConfirm: () {
        addSubtask(textController.text);
        Get.back();
      },
      onCancel: () {
        Get.back();
      },
    );
  }
}