import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:taskify/core/services/category_color.dart';
import 'package:taskify/features/tasks/presentation/controllers/task_controllers.dart';
import 'package:taskify/features/tasks/presentation/controllers/task_detail_controllers.dart';
import 'package:taskify/features/tasks/presentation/screens/task_detail_screens.dart';
import 'package:taskify/features/tasks/presentation/widgets/total_task_filter.dart';
import 'package:taskify/features/search/presentation/widgets/search_and_filter.dart';
import 'package:taskify/features/tasks/presentation/widgets/task_container.dart';

class UpcomingTasks extends StatelessWidget {
  const UpcomingTasks({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskControllers controllers = Get.find();
    final TaskDetailControllers controller = Get.find();
    return Obx(() => SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Focus Mode',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 5,),
          Text(
            '${controllers.dailyRemainingTask} tasks remaining for today',
          ),
          const SizedBox(height: 20,),
          SearchAndFilter(),
          const SizedBox(height: 30,),
          TotalTaskFilter(),
          const SizedBox(height: 30,),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controllers.tasks.length,
            itemBuilder: (context, index) {
              final task = controllers.tasks[index];
              final priorityColor = getLevelColor(context, task.priority);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [                
                  TaskContainer(
                    priority: task.priority,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: priorityColor,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Text(
                            task.priority.title.toUpperCase(),
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            controller.setTask(task);
                            controller.showTaskMenu();
                          }, 
                          icon: Icon(Icons.more_vert, color: Color(0xFF565e74),)
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => TaskDetailScreens(
                          task: task
                        ));
                      },
                      child: Text(
                        task.taskTitle,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      task.description,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 20,),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'team'
                        ),
                        Text(
                          DateFormat('MMM dd').format(task.dueDate),
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    )
                  ],
                    )
                  ),
                ],
              );
            },
          ),
        ],
      ),
    ));
  }
}