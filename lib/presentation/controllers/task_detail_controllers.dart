import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify/data/subtask_model.dart';
import 'package:taskify/data/task_model.dart';
import 'package:taskify/presentation/controllers/task_controllers.dart';

class TaskDetailControllers extends GetxController{
  final selectedTask = Rxn<TaskModel>();
  final TaskControllers controllers = Get.find();

  void setTask(TaskModel taskData) {
    selectedTask.value = taskData;
  }

  void toggleSubtask(int index) {
    final currentTask = selectedTask.value;

    if (currentTask == null) return;
    final subTask = currentTask.subTask[index];
    subTask.isDone = !subTask.isDone;
    selectedTask.refresh();
    controllers.saveTask();
  }

  void addSubtask(String title) {
    final currentTask = selectedTask.value;

    if (currentTask == null) return;
    if (title.trim().isEmpty) return;
    currentTask.subTask.add(SubtaskModel(title: title));
    selectedTask.refresh();
    controllers.saveTask();
  }

  int get completedCount {
    final currentTask = selectedTask.value;

    if (currentTask == null) return 0;
    return currentTask.subTask.where((s) => s.isDone).length;
  }

  Future<void> selectReminderTime(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context, 
      initialTime: selectedTask.value!.reminderTime
    );

    if (pickedTime != null) {
      selectedTask.value!.reminderTime = pickedTime;
      selectedTask.refresh();
      controllers.saveTask();
    }
  }

  void showAddSubtaskDialog(BuildContext context) {
    final textController = TextEditingController();

    Get.defaultDialog(
      radius: 10,
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      title: 'Add New Subtask',
      titlePadding: EdgeInsets.symmetric(vertical: 10),
      titleStyle: Theme.of(context).textTheme.displayMedium,
      content: Card(
        child: TextField(
          controller: textController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            hintText: 'Enter subtask title',
            hintStyle: Theme.of(context).textTheme.bodyMedium,
            border: InputBorder.none
          ),
        ),
      ),
      textConfirm: 'Add',
      cancelTextColor: Theme.of(context).colorScheme.surfaceContainer,
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