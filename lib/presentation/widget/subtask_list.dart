import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify/presentation/controllers/task_detail_controllers.dart';

class SubtaskList extends StatelessWidget {
  const SubtaskList({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskDetailControllers controllers = Get.find();
      final task = controllers.selectedTask.value;
      return ListView.builder(
        itemCount: task!.subTask.length,
        itemBuilder: (context, index) {
          final task = controllers.selectedTask.value!;
          final subtask = task.subTask[index];
          return Container(
            decoration: BoxDecoration(
              color:  Colors.transparent
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => controllers.toggleSubtask(index), 
                  icon: Icon(subtask.isDone ? Icons.check_box_outlined : Icons.check_box_outline_blank)
                ),
                Expanded(
                  child: Text(
                    subtask.title,
                    style: TextStyle(
                      decoration: subtask.isDone ? TextDecoration.lineThrough : TextDecoration.none,
                      decorationThickness: 5,
                      //overflow: TextOverflow.ellipsis
                    ),
                  ),
                )
              ],
            ),
          );
        },
      );
    
  }
}