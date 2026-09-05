import 'package:get/instance_manager.dart';
import 'package:taskify/core/services/api_service.dart';
import 'package:taskify/features/tasks/data/repositories/task_repository.dart';
import 'package:taskify/features/tasks/presentation/controllers/task_controllers.dart';

class TaskBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ApiService>(() => ApiService());

    Get.lazyPut<TaskRepository>(() => TaskRepository(
      apiService: Get.find<ApiService>()
    ));

    Get.lazyPut<TaskControllers>(() => TaskControllers(
      taskRepository: Get.find<TaskRepository>()
    ));

  }
}