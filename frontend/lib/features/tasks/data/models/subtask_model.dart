class SubtaskModel {
  final String title;
  bool isDone;


  SubtaskModel({
    required this.title, 
    this.isDone = false
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isDone': isDone
    };
  }

  factory SubtaskModel.fromJson(Map<String, dynamic> json) {
    return SubtaskModel(
      title: json['title'],
      isDone: json['isDone'] ?? false
    );
  } 
}