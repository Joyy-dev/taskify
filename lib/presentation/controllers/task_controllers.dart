import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
      'title': e.title,
      'category': e.category,
      'description': e.description,
      'dueDate': e.dueDate,
      'priority': e.priority
    }).toList());
  }

  void loadTasks() {
    final data = box.read('tasks');
    if (data != null) {
      tasks.value = List<Map<String, dynamic>>.from(data).map((e) => TaskModel(
        id: e['id'], 
        title: e['title'], 
        category: e['category'], 
        description: e['description'], 
        dueDate: e['duedate'], 
        priority: e['priority']
      )).toList();
    }
  }

  void saveAndClose() {
    Get.back();
  }
}