import 'package:taskify/core/enums/priority_levels.dart';

class TaskModel {
  final String id;
  final String title;
  final String category;
  final String description;
  final String dueDate;
  final PriorityLevels priority;

  const TaskModel({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.dueDate,
    required this.priority
  });
}