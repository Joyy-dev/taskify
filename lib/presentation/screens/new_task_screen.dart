import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify/features/task_form.dart';
import 'package:taskify/presentation/controllers/task_form_controllers.dart';
import 'package:taskify/presentation/widget/custom_screen.dart';

class NewTaskScreen extends StatelessWidget {
  NewTaskScreen({super.key});

  final TaskFormControllers controllers = Get.put(TaskFormControllers());

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      title: 'Taskify', 
      icons: IconButton(
        onPressed: () => Get.back(), 
        icon: Icon(Icons.arrow_back)
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Create New Task',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'Define Your Next milestone and stay in flow',
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
              child: ListTile(
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