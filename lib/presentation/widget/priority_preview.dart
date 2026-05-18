import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:taskify/presentation/widget/priority_level.dart';
import 'package:taskify/presentation/controllers/task_controllers.dart';
import 'package:taskify/presentation/controllers/task_detail_controllers.dart';
import 'package:taskify/presentation/controllers/task_form_controllers.dart';
import 'package:taskify/presentation/widget/custom_container.dart';

class PriorityPreview extends StatelessWidget {
  const PriorityPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TaskFormControllers>();
    final controllers = Get.find<TaskDetailControllers>();
    final cont = Get.find<TaskControllers>();

    final task = controllers.selectedTask.value;

    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Priority'.toUpperCase(),
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 10,),
          Obx(() => PriorityLevel(
            selectedPriority: controller.selectedPriority.value,
            onSelected: (value) {
              controller.setPriority(value);
            })
          ),
          const SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(10)
            ),
            child: ListTile(
              leading: Icon(Icons.calendar_month, color: Theme.of(context).colorScheme.onSurface),
              title: Text(
                'DUE DATE',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              subtitle: Text(
                DateFormat('MMM dd, yyyy').format(task!.dueDate),
                style: Theme.of(context).textTheme.bodySmall 
              ),
              trailing: IconButton(
                onPressed: () {
                  controller.datePicker(context);
                }, 
                icon: Icon(
                  Icons.edit, 
                  color: Theme.of(context).colorScheme.onSurface
                )
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(10)
            ),
            child: ListTile(
              leading: Icon(Icons.notifications_active_outlined, color: Theme.of(context).colorScheme.onSurface),
              title: Text(
                'Reminder'.toUpperCase(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              subtitle: Text(
                task.reminderTime.format(context),
                style: Theme.of(context).textTheme.bodySmall 
              ),
              trailing: IconButton(
                onPressed: () {
                  controller.selectReminderTime(context);
                }, 
                icon: Icon(Icons.edit, color: Theme.of(context).colorScheme.onSurface)
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Divider(),
          const SizedBox(height: 10,),
          ElevatedButton(
            onPressed: () {
              cont.confirmDeleteTask(context, task.id);
            }, 
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.onError,
              padding: EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.delete, size: 25, color: Theme.of(context).colorScheme.onSurface,),
                const SizedBox(width: 5,),
                Text(
                  'Delete Task',
                  style: Theme.of(context).textTheme.titleMedium
                )
              ],
            )
          )
        ],
      ),
    );
  }
}