import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:taskify/data/task_model.dart';
import 'package:taskify/features/subtasks.dart';
import 'package:taskify/presentation/controllers/task_detail_controllers.dart';
import 'package:taskify/presentation/widget/custom_screen.dart';

class TaskDetailScreens extends StatelessWidget {
  final TaskModel task;

  TaskDetailScreens({required this.task, super.key});

  final TaskDetailControllers controllers = Get.find();

  @override
  Widget build(BuildContext context) {
    controllers.setTask(task);
    return CustomScreen(
      title: 'Taskify', 
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 13, vertical: 2),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Text(
                'In Progress',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const SizedBox(height: 15,),
            Text(
              task.taskTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20,),
            Text(
              task.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 30,),
            Subtasks(),
          ],
        ),
      )
    );
  }
}