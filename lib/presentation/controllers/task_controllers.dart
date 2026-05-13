import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taskify/core/enums/priority_levels.dart';
import 'package:taskify/data/subtask_model.dart';
import 'package:taskify/data/task_model.dart';

class TaskControllers extends GetxController{
  var tasks = <TaskModel>[].obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  void addTask(TaskModel task) {
    tasks.add(task);
    saveTask();
  }

  void saveTask() {
    box.write('tasks', tasks.map((e) => {
      'id': e.id,
      'title': e.taskTitle,
      'category': e.category,
      'description': e.description,
      'dueDate': e.dueDate.toIso8601String(),
      'priority': e.priority.name,
      'subTask': e.subTask.map((s) => s.toJson()).toList(),
      'reminderHour': e.reminderTime.hour,
      'reminderMinute': e.reminderTime.minute
    }).toList());
  }

  void loadTasks() {
    final data = box.read('tasks');
    if (data != null) {
      tasks.value = List<Map<String, dynamic>>.from(data).map((e) => TaskModel(
        id: e['id'], 
        taskTitle: e['title'], 
        category: e['category'], 
        description: e['description'], 
        dueDate: DateTime.parse(e['dueDate']), 
        subTask: List<Map<String, dynamic>>.from(e['subTask'] ?? []).map((s) => SubtaskModel.fromJson(e)).toList(),
        priority: PriorityLevels.values.firstWhere((p) => p.name == e['priority']),
        reminderTime: TimeOfDay(hour: e['reminderHour'], minute: e['reminderMinute'])
      )).toList();
    }
  }

  void updateTask() {
    saveTask();
    tasks.refresh();
  }

  void deleteTask(String taskId) {
    tasks.removeWhere((task) => task.id == taskId);
    saveTask();
  }

  void confirmDeleteTask(BuildContext context, String taskId) {
    Get.defaultDialog(
      backgroundColor: Theme.of(context).colorScheme.onTertiary,
      titleStyle: Theme.of(context).textTheme.displayMedium,
      title: 'Delete Task',
      middleText: 'Are you sure you want to delete this task?',
      textConfirm: 'Delete',
      textCancel: 'Cancel',
      onConfirm: () {
        deleteTask(taskId);
        Get.back();
        Get.back();
      } 
    );
  }
}