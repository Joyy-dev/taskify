import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify/core/enums/task_filter.dart';
import 'package:taskify/data/task_model.dart';
import 'package:taskify/presentation/controllers/task_controllers.dart';
import 'package:taskify/presentation/screens/search_results_screen.dart';

class SearchControllers extends GetxController{
  final searchQuery = ''.obs;
  final selectedFilter = TaskFilter.all.obs;
  final TaskControllers taskControllers = Get.find();
  final searchController = TextEditingController(); 

  void updateSearch(String value) {
    searchQuery.value = value.trim();    
  }

  void onSearch(String value) {
    searchQuery.value = value.trim();

    if (searchQuery.value.isEmpty) return;
    Get.to(() => SearchResultsScreen());
  }

  int get searchedQueryCount {
    if (searchQuery.value.isEmpty) return 0;
    return taskControllers.tasks.where((task) {
      return task.taskTitle.toLowerCase().contains(searchQuery.value.toLowerCase());
    }).length;
  }

  void setFilter(TaskFilter filter) {
    selectedFilter.value = filter;
  }

  List<TaskModel> get searchedTasks {
    List<TaskModel> result = taskControllers.tasks.toList();

    if(searchQuery.value.isNotEmpty) {
      result = result.where((task) {
        return task.taskTitle.toLowerCase().contains(searchQuery.value);
      }).toList();
    }
    return result;
  }

  List<TaskModel> get filteredTasks {
    List<TaskModel> result = taskControllers.tasks.toList();

    if (searchQuery.value.isNotEmpty) {
      result = result.where((task) {
        return task.taskTitle.toLowerCase().contains(searchQuery.value.toLowerCase());
      }).toList();
    }
    switch (selectedFilter.value) {
      case TaskFilter.completed:
      result = result.where((task) => task.isCompleted).toList();
      break;
      case TaskFilter.progress:
      result = result.where((task) => !task.isCompleted).toList();
      break;
      case TaskFilter.due:
      final now = DateTime.now();
      result = result.where((task) {
        return task.dueDate.day == now.day && task.dueDate.month == now.month && task.dueDate.year == now.year;
      }).toList();
      break;
      case TaskFilter.upcoming:
      final now = DateTime.now();
      result = result.where((task){
        final taskDateTime = DateTime(
          task.dueDate.year,
          task.dueDate.month,
          task.dueDate.day,
          task.dueDate.hour,
          task.dueDate.minute
        );
        final difference = taskDateTime.difference(now).inHours;
        return !task.isCompleted && difference >= 0 && difference <= 48;
      }).toList();
      break;

      case TaskFilter.all: break;
    }
    return result;
  }

  int gettaskFilterCount(TaskFilter filter) {
    switch (filter) {
      case TaskFilter.all:
      return taskControllers.tasks.length;
      case TaskFilter.completed:
      return taskControllers.tasks.where((task) => task.isCompleted).length;
      case TaskFilter.progress:
      return taskControllers.tasks.where((task) => !task.isCompleted).length;
      case TaskFilter.due:
      final now = DateTime.now();
      return taskControllers.tasks.where((task) {
        return task.dueDate.day == now.day && task.dueDate.month == now.month && task.dueDate.year == now.year;
      }).length;
      case TaskFilter.upcoming: return taskControllers.upComingTask.length;
    }
  }
}