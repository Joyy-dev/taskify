import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify/features/tasks/data/models/task_model.dart';
import 'package:taskify/features/tasks/presentation/controllers/task_controllers.dart';
// import 'package:taskify/features/task_form.dart';
// import 'package:taskify/presentation/controllers/task_controllers.dart';
// import 'package:taskify/presentation/controllers/task_detail_controllers.dart';
import 'package:taskify/features/tasks/presentation/screens/new_task_screen.dart';
import 'package:taskify/shared/widgets/custom_container.dart';
import 'package:taskify/shared/widgets/special_container.dart';

class TaskMenu extends StatelessWidget {
  final TaskModel task;
  const TaskMenu({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TaskControllers>();
    
    return CustomContainer(
      height: 300,
      child: Column(
        children: [
          Text(
            'Task Menu',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20,),
          SpecialContainer(
            child: ListTile(
              leading: Icon(Icons.edit),
              title: Text(
                'Update Task'
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Get.back();
                Get.to(() => NewTaskScreen(
                  task: task,
                )
                );
              },
            ),
          ),
          const SizedBox(height: 20,),
          SpecialContainer(
            child: ListTile(
              leading: Icon(Icons.edit),
              title: Text(
                'Delete Task'
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                controller.confirmDeleteTask(context, task.id);
              },
            ),
          )
        ],
      )
    );
  }
}