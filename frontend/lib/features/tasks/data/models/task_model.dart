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
}