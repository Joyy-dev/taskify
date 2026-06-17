class Task{
  final int id;
  final String name;
  final bool completed;
  final List<String> tags;

  const Task({
    required this.id,
    required this.name,
    required this.completed,
    required this.tags
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] ?? 0, 
      name: json['name'] ?? '', 
      completed: json['completed'] ?? false, 
      tags: json['tags'] ?? []
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "completed": completed,
      "tags": tags
    };
  }
}