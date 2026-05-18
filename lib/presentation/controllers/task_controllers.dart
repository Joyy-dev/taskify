import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taskify/core/enums/category.dart';
import 'package:taskify/core/enums/priority_levels.dart';
import 'package:taskify/data/subtask_model.dart';
import 'package:taskify/data/task_model.dart';

class TaskControllers extends GetxController{
  var tasks = <TaskModel>[].obs;
  final box = GetStorage();
  final searchQuery = ''.obs;

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
      'category': e.category.name,
      'description': e.description,
      'dueDate': e.dueDate.toIso8601String(),
      'completed': e.isCompleted,
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
        category: Category.values.firstWhere((c) => c.name == e['category']), 
        description: e['description'], 
        dueDate: DateTime.parse(e['dueDate']),
        isCompleted: e['completed'] ?? false, 
        subTask: List<Map<String, dynamic>>.from(e['subTask'] ?? []).map((s) => SubtaskModel.fromJson(s)).toList(),
        priority: PriorityLevels.values.firstWhere((p) => p.name == e['priority']),
        reminderTime: TimeOfDay(hour: e['reminderHour'], minute: e['reminderMinute'])
      )).toList();
    }
  }

  void updateTask(TaskModel updatedTask) {
    final index = tasks.indexWhere((task) => task.id == updatedTask.id);
    if (index != -1) {
      tasks[index] = updatedTask;
      tasks.refresh();
    }
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

  int getTaskCountbyCategory(Category category) {
    return tasks.where((task) => task.category == category).length;
  }

  List<TaskModel> get todayTask{
    final now = DateTime.now();

    return tasks.where((task) {
      return task.dueDate.year == now.year && task.dueDate.month == now.month && task.dueDate.day == now.day;
    }).toList();
  }

  List<TaskModel> get completedTodayTask {
    return todayTask.where((task) => task.isCompleted).toList();
  }

  int get dailyRemainingTask{
    if (todayTask.isEmpty) return 0;
    return todayTask.length - completedTodayTask.length;
  }

  double get dailyProgress {
    if (todayTask.isEmpty) return 0;

    return completedTodayTask.length / todayTask.length;
  }

  List<TaskModel> get upComingTask{
    final now = DateTime.now();
    final filteredTasks = tasks.where((task) {
      final taskDateTime = DateTime(
        task.dueDate.year,
        task.dueDate.month,
        task.dueDate.day,
        task.reminderTime.hour,
        task.reminderTime.minute
      );
      final difference = taskDateTime.difference(now).inHours;

      return !task.isCompleted && difference >= 0 && difference <= 48;
    }).toList();
    filteredTasks.sort((a, b) {
      final aDateTime = DateTime(
        a.dueDate.year,
        a.dueDate.month,
        a.dueDate.day,
        a.reminderTime.hour,
        a.reminderTime.minute
      );

      final bDatTime = DateTime(
        b.dueDate.year,
        b.dueDate.month,
        b.dueDate.day,
        b.reminderTime.hour,
        b.reminderTime.minute
      );

      return aDateTime.compareTo(bDatTime);      
    });
    return filteredTasks;
  }

  void updateSearch(String value) {
    searchQuery.value = value;
  }
}