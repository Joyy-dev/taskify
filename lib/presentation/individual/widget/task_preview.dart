import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify/core/services/category_color.dart';
import 'package:taskify/presentation/individual/controllers/task_controllers.dart';
import 'package:taskify/presentation/individual/widget/task_container.dart';

class TaskPreview extends StatelessWidget {
  const TaskPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TaskControllers>();
    return Obx(() {
      return SizedBox(
        height: 300,
        child: ListView.builder(
          itemCount: controller.tasks.length,
          itemBuilder: (context, index) {
            final task = controller.tasks[index];
            final conColor = getLevelColor(context, task.priority);
            return Row(
              children: [
                Column(
                  children: [
                    Text(
                      task.reminderTime.format(context),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Container(
                      width: 5,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceTint
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: TaskContainer(
                    priority: task.priority, 
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              task.taskTitle,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: conColor,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Text(
                                task.priority.name,
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20,),
                        LinearProgressIndicator(
                          value: 0.6,
                        ),
                        const SizedBox(height: 10,),
                        Text(
                          'Team'
                        ),
                        // Container(
                        //   child: Text(
                        //     task.priority.name
                        //   ),
                        // )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      );
    });
  }
}