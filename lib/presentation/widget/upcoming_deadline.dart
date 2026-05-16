import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify/core/utility/format_due_date.dart';
import 'package:taskify/presentation/controllers/task_controllers.dart';
import 'package:taskify/presentation/screens/task_detail_screens.dart';

class UpcomingDeadline extends StatelessWidget {
  const UpcomingDeadline({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TaskControllers>();
    return Obx(() {
      final tasks = controller.upComingTask;
      if (tasks.isEmpty) {
        return Center(
          child: Text(
            'No upcoming Deadlines'
          ),
        );
      }
      return  Column(
      children: tasks.map((task) {
        return ListTile(
          leading: Container(
            height: 50,
            width: 10,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              borderRadius: BorderRadius.circular(15)
            ),
          ),
          title: Text(
            task.taskTitle,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          subtitle: Text(
            '${task.category.label} . ${formatDueDate(task.dueDate)}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          trailing: IconButton(
            onPressed: () {
              Get.to(() => TaskDetailScreens(task: task));
            }, 
            icon: Icon(Icons.chevron_right, color: Color(0xFF777681), size: 40,)
          )
          ,
        );
      }).toList()
    );
    });      
  }
}