import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify/presentation/controllers/task_controllers.dart';
import 'package:taskify/presentation/controllers/task_detail_controllers.dart';
import 'package:taskify/presentation/widget/custom_container.dart';
import 'package:taskify/presentation/widget/special_container.dart';

class TaskMenu extends StatelessWidget {
  const TaskMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TaskControllers>();
    final controllers = Get.find<TaskDetailControllers>();
    final task = controllers.selectedTask.value!;
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
                controller.deleteTask(task.id);
              },
            ),
          )
        ],
      )
    );
  }
}