
import 'package:taskify/core/services/api_service.dart';
import 'package:taskify/features/tasks/data/models/task_model.dart';

class TaskRepository {
  final ApiService apiService;

  TaskRepository({required this.apiService});

  Future<List<TaskModel>> getTasks() async {
    final response = await apiService.get('/tasks');

    final data = response.data['data'];

    return data.map<TaskModel>((json) => TaskModel.fromJson(json)).toList();
  }
}