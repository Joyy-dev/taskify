import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify/features/tasks/data/models/task_model.dart';
import 'package:taskify/features/tasks/presentation/widgets/task_form.dart';
import 'package:taskify/features/tasks/presentation/controllers/task_form_controllers.dart';
import 'package:taskify/shared/widgets/custom_screen.dart';

class NewTaskScreen extends StatelessWidget {
  final TaskModel? task;
  NewTaskScreen({super.key, this.task});

  final TaskFormControllers controllers = Get.put(TaskFormControllers());

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TaskFormControllers>();
    controller.initializeTask(task, context);
    final isEditing = task != null;
    return CustomScreen(
      title: 'Taskify', 
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              isEditing ? 'Update Your Task' :'Create New Task',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              isEditing ? 'Edit your milestone and stay in flow' : 'Define Your Next milestone and stay in flow',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 30,),
            TaskForm(),
            const SizedBox(height: 50,),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xFF68788f))
              ),
              child:isEditing ? null : ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.onTertiary,
                  child: Icon(
                    Icons.lightbulb, 
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                title: Text(
                  'Pro Tip',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                subtitle: Text(
                  'Break down large tasks into smaller sub-tasks to maintainmomentum and reach your flow state faster',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}