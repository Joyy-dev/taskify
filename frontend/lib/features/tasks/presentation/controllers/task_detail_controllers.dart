import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify/features/tasks/data/models/subtask_model.dart';
import 'package:taskify/features/tasks/data/models/task_model.dart';
import 'package:taskify/features/tasks/presentation/controllers/task_controllers.dart';
import 'package:taskify/features/tasks/presentation/widgets/task_menu.dart';

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

  double get progress {
    final currentTask = selectedTask.value;
    if (currentTask == null || currentTask.subTask.isEmpty) {
      return 0;
    }
    return completedCount / currentTask.subTask.length;
  }

  int get completedCount {
    final currentTask = selectedTask.value;

    if (currentTask == null) return 0;
    return currentTask.subTask.where((s) => s.isDone).length;
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
        child: TextFormField(
          controller: textController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            hintText: 'Enter subtask title',
            hintStyle: Theme.of(context).textTheme.bodyMedium,
            border: InputBorder.none
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Enter subtask title';
            }
            return null;
          },
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

  void showTaskMenu() {
    if (selectedTask.value == null) return;

    Get.bottomSheet(
      TaskMenu(task: selectedTask.value!,),
      isScrollControlled: true
    );
  }
}