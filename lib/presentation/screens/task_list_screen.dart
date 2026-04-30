import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify/presentation/screens/new_task_screen.dart';
import 'package:taskify/presentation/widget/custom_screen.dart';
import 'package:taskify/presentation/widget/progress_container.dart';
import 'package:taskify/presentation/widget/search_and_filter.dart';
import 'package:taskify/presentation/widget/upcoming_tasks.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      title: 'Taskify',
      icon: Icons.grid_view_sharp,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(
            () => NewTaskScreen()
          );
        },
        child: Icon(Icons.add, color: Theme.of(context).colorScheme.onSurfaceVariant,),
      ), 
      child: Column(
        children: [
          SearchAndFilter(),
          const SizedBox(height: 30,),
          ProgressContainer(),
          const SizedBox(height: 30,),
          UpcomingTasks()
        ],
      )
    );
  }
}