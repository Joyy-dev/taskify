import 'package:taskify/core/enums/priority_levels.dart';
import 'package:taskify/data/subtask_model.dart';

class TaskModel {
  final String id;
  final String taskTitle;
  final String category;
  final String description;
  final String dueDate;
  final PriorityLevels priority;
  final  List <SubtaskModel> subTask;

  TaskModel({
    required this.id,
    required this.taskTitle,
    required this.category,
    required this.description,
    required this.dueDate,
    required this.priority,
    this.subTask = const []
  });
}