import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:taskify/presentation/controllers/task_detail_controllers.dart';
import 'package:taskify/presentation/widget/subtask_list.dart';

class Subtasks extends StatelessWidget {
  Subtasks({super.key});

  final TaskDetailControllers controllers = Get.find();

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 400,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  Icon(Icons.checklist_sharp, color: Theme.of(context).colorScheme.inversePrimary, size: 35,),
                  const SizedBox(width: 10,),
                  Text(
                    'Subtasks',
                    style: Theme.of(context).textTheme.headlineLarge,
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 20,),
          Expanded(
            child: Obx(() {
              final task = controllers.tasks.value;
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
          const SizedBox(height: 30,),
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
              onPressed: controllers.showAddSubtaskDialog,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: Theme.of(context).colorScheme.onPrimary, size: 25,),
                  const SizedBox(width: 10,),
                  Text(
                    'Add Subtask',
                    style: Theme.of(context).textTheme.displayMedium,
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