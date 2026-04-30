import 'package:flutter/material.dart';
import 'package:taskify/features/task_form.dart';
import 'package:taskify/presentation/widget/custom_screen.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      title: 'Taskify', 
      icon: Icons.arrow_back,
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
              color: Theme.of(context).colorScheme.inverseSurface,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0xFF68788f))
            ),
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.lightbulb, color: Color(0xFF7c87f3),),
              ),
              title: Text(
                'Pro Tip',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              subtitle: Text(
                'Break down large tasks into smaller sub-tasks to maintainmomentum and reach your flow state faster',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          )
        ],
      )
    );
  }
}