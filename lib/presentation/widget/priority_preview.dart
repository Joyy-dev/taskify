import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:taskify/features/priority_level.dart';
import 'package:taskify/presentation/controllers/task_detail_controllers.dart';
import 'package:taskify/presentation/controllers/task_form_controllers.dart';

class PriorityPreview extends StatelessWidget {
  const PriorityPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TaskFormControllers>();
    final controllers = Get.find<TaskDetailControllers>();
    final task = controllers.tasks.value;

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inverseSurface,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF283044)
          )
        ]
      ),
      child: Column(
        children: [
          PriorityLevel(
            onSelected: (value) {
              controller.selectedPriority.value = value;
            },
          ),
          const SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(10)
            ),
            child: ListTile(
              leading: Icon(Icons.calendar_month, color: Colors.white,),
              title: Text(
                'DUE DATE',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              subtitle: Text(
                DateFormat('MMM dd, yyyy').format(task!.dueDate),
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 17
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  controller.datePicker(context);
                }, 
                icon: Icon(Icons.edit, color: Colors.white60,)
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(10)
            ),
            child: ListTile(
              leading: Icon(Icons.notifications_active_outlined, color: Colors.white,),
              title: Text(
                'Reminder'.toUpperCase(),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              subtitle: Text(
                task.reminderTime.format(context),
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 17
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  controllers.selectReminderTime(context);
                }, 
                icon: Icon(Icons.edit, color: Colors.white60,)
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Divider(),
          const SizedBox(height: 10,),
          ElevatedButton(
            onPressed: () {
              controllers.confirmDeleteTask(task.id);
            }, 
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.delete, size: 30, color: Colors.white,),
                const SizedBox(width: 5,),
                Text(
                  'Delete Task',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            )
          )
        ],
      ),
    );
  }
}