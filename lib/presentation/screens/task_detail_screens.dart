import 'package:flutter/material.dart';
import 'package:taskify/presentation/widget/custom_screen.dart';

class TaskDetailScreens extends StatelessWidget {
  const TaskDetailScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      title: 'Taskify', 
      child: Column(
        children: [
          Text(
            'In Progress'
          ),
          Text(
            'title'
          )
        ],
      )
    );
  }
}