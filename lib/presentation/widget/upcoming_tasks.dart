import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:taskify/presentation/controllers/task_controllers.dart';
import 'package:taskify/presentation/widget/task_container.dart';

class UpcomingTasks extends StatelessWidget {
  const UpcomingTasks({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskControllers controllers = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Upcoming Tasks',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 10,),
        Obx(() => SizedBox(
          height: 750,
          child: ListView.builder(
            itemCount: controllers.tasks.length,
            itemBuilder: (context, index) {
              final task = controllers.tasks[index];
              return TaskContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.error,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Text(
                        task.priority.toUpperCase(),
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
                const SizedBox(height: 10,)
              ],
                )
              );
            },
          ),
        )),
      ],
    );
  }
}