class TaskModel {
  final String id;
  final String title;
  final String category;
  final String description;
  final String dueDate;
  final String priority;

  const TaskModel({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.dueDate,
    required this.priority
  });
}