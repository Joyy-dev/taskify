import 'package:flutter/material.dart';
import 'package:taskify/core/enums/category.dart';
import 'package:taskify/core/enums/priority_levels.dart';
import 'package:taskify/features/tasks/data/models/subtask_model.dart';

class TaskModel {
  final String id;
  final String taskTitle;
  final Category category;
  final String description;
  DateTime dueDate;
  bool isCompleted;
  TimeOfDay reminderTime;
  final PriorityLevels priority;
  final  List <SubtaskModel> subTask;

  TaskModel({
    required this.id,
    required this.taskTitle,
    required this.category,
    required this.description,
    required this.dueDate,
    this.isCompleted = false,
    required this.reminderTime,
    required this.priority,
    List<SubtaskModel>? subTask,
  }) : subTask = subTask ?? [];

  Map<String, dynamic> toJson() {
    return {
      'title': taskTitle,
      'description': description,
      'priority': priority.name,
      'dueDate': dueDate.toIso8601String()
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'].toString(),
      taskTitle: json['title'],
      category: Category.work,
      description: json['description'],
      dueDate: DateTime.parse(json['dueDate']),
      isCompleted: json['completed'] ?? false,
      reminderTime: const TimeOfDay(hour: 0, minute: 0),
      priority: PriorityLevels.values.firstWhere(
        (priority) => priority.name == json['priority']
      ) 
    );
 }
}

