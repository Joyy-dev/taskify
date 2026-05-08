import 'package:flutter/material.dart';
import 'package:taskify/features/subtasks.dart';
import 'package:taskify/presentation/widget/custom_screen.dart';

class TaskDetailScreens extends StatelessWidget {
  final String title;
  final String description;

  const TaskDetailScreens({required this.title, required this.description, super.key});

  @override
  Widget build(BuildContext context) {
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
              title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20,),
            Text(
              description,
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