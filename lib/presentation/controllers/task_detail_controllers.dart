import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify/data/subtask_model.dart';
import 'package:taskify/data/task_model.dart';

class TaskDetailControllers extends GetxController{
  var tasks = Rxn<TaskModel>();
  RxList<TaskModel> task = <TaskModel>[].obs;

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
    tasks.refresh();
  }

  int get completedCount {
    final currentTask = tasks.value;

    if (currentTask == null) return 0;
    return currentTask.subTask.where((s) => s.isDone).length;
  }

  void showAddSubtaskDialog(BuildContext context) {
    final textController = TextEditingController();

    Get.defaultDialog(
      radius: 10,
      backgroundColor: Theme.of(context).colorScheme.onTertiary,
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
      cancelTextColor: Theme.of(context).colorScheme.primary,
      onConfirm: () {
        addSubtask(textController.text);
        Get.back();
      },
      onCancel: () {
        Get.close(0);
      },
    );
  }

  Future<void> selectReminderTime(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context, 
      initialTime: tasks.value!.reminderTime
    );

    if (pickedTime != null) {
      tasks.value!.reminderTime = pickedTime;
      tasks.refresh();
    }
  }

  void confirmDeleteTask(String tasks) {
    Get.defaultDialog(
      title: 'Delete Task',
      middleText: 'Are you sure you want to delete this task?',
      textConfirm: 'Delete',
      textCancel: 'Cancel',
      onConfirm: () {
        task.removeWhere((task) => task.id == tasks);
        Get.back();
        Get.back();
      } 
    );
  }
}