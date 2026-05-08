import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify/presentation/controllers/task_controllers.dart';
import 'package:taskify/presentation/screens/new_task_screen.dart';
import 'package:taskify/presentation/widget/custom_screen.dart';
// import 'package:taskify/presentation/widget/progress_container.dart';
// import 'package:taskify/presentation/widget/search_and_filter.dart';
import 'package:taskify/presentation/widget/upcoming_tasks.dart';

class TaskListScreen extends StatelessWidget {
  TaskListScreen({super.key});

  final TaskControllers controllers = Get.find();

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      title: 'Taskify',
      icons: IconButton(
        onPressed: () {}, 
        icon: Icon(Icons.grid_view_sharp)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(
            () => NewTaskScreen()
          );
        },
        child: Icon(Icons.add, color: Theme.of(context).colorScheme.onSurfaceVariant,),
      ), 
      child: Obx(() {
        if (controllers.tasks.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.takeout_dining_sharp, size: 50,),
                const SizedBox(height: 5,),
                Text(
                  'oops!!!!! You don\'t have any upcoming task. Add new Task',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                TextButton(
                  onPressed: () {
                    Get.to(
                      () => NewTaskScreen()
                    );
                  }, 
                  child: Text(
                    'Create New Task',
                    style: Theme.of(context).textTheme.displayMedium,
                  )
                )
              ],
            ),
          );
        } else {
          return UpcomingTasks();
        }
      })
    );
  }
}