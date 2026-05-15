import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:taskify/presentation/controllers/task_detail_controllers.dart';
import 'package:taskify/presentation/widget/custom_container.dart';
import 'package:taskify/presentation/widget/subtask_list.dart';

class Subtasks extends StatelessWidget {
  Subtasks({super.key});

  final TaskDetailControllers controllers = Get.find();

  @override
  Widget build(BuildContext context) {
    final completed = controllers.completedCount;
    return CustomContainer(
      height: 350,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.checklist_sharp, 
                    color: Theme.of(context).colorScheme.secondary, 
                    size: 30
                  ),
                  const SizedBox(width: 10,),
                  Text(
                    'Subtasks',
                    style: Theme.of(context).textTheme.headlineMedium,
                  )
                ],
              ),
              Text(
                '$completed completed' 
              )
            ],
          ),
          const SizedBox(height: 10,),
          Divider(thickness: 0.5,),
          const SizedBox(height: 10,),
          Expanded(
            child: Obx(() {
              final task = controllers.selectedTask.value;
              if (task == null || task.subTask.isEmpty) {
                return Center(
                  child: Text(
                    'No Subtasks added for this task Yet'
                  ),
                );
              } else {
                return SubtaskList();
              }
            }),
          ),
          const SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline,
                width: 1,
              )
            ),
            child: TextButton(
              onPressed: () => controllers.showAddSubtaskDialog(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: Theme.of(context).colorScheme.secondary, size: 25,),
                  const SizedBox(width: 10,),
                  Text(
                    'Add Subtask',
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}