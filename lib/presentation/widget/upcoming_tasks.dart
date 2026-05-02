import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:taskify/core/services/category_color.dart';
import 'package:taskify/presentation/controllers/task_controllers.dart';
import 'package:taskify/presentation/widget/progress_container.dart';
import 'package:taskify/presentation/widget/search_and_filter.dart';
import 'package:taskify/presentation/widget/task_container.dart';

class UpcomingTasks extends StatelessWidget {
  const UpcomingTasks({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskControllers controllers = Get.find();
    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchAndFilter(),
        const SizedBox(height: 30,),
        ProgressContainer(),
        const SizedBox(height: 30,),
        Text(
         'Upcoming Tasks',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 10,),
        SizedBox(
          height: 700,
          child: ListView.builder(
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
                            task.priority.name.toUpperCase(),
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        IconButton(
                          onPressed: () {}, 
                          icon: Icon(Icons.more_vert, color: Color(0xFF565e74),)
                        )
                      ],
                    ),
                    Text(
                      task.title,
                      style: Theme.of(context).textTheme.headlineMedium,
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
                          task.dueDate,
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    )
                    //const SizedBox(height: 10,)
                  ],
                    )
                  ),
                ],
              );
            },
          ),
        ),
      ],
    ));
  }
}