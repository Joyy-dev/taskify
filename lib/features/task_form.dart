import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:taskify/features/custom_form.dart';
import 'package:taskify/features/priority_level.dart';
import 'package:taskify/presentation/controllers/task_form_controllers.dart';

class TaskForm extends StatelessWidget {
  TaskForm({super.key}); 

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TaskFormControllers>();
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          CustomForm(
            hint: 'e.g. Design System Audit', 
            tag: 'Task Name',
            controller: controller.taskNameController,
          ),
          const SizedBox(height: 25,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Category'.toUpperCase(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 5,),
              Card(
                child: DropdownButtonFormField<String>(
                  initialValue: controller.selectedCategory.value,
                  dropdownColor: Theme.of(context).colorScheme.inverseSurface,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(12),
                  ),
                  items: ['Work', 'Personal'].map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(
                        category,
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    );
                  }).toList(), 
                  onChanged: (value) {
                    controller.setCategory(value!);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 25,),
          CustomForm(
            tag: 'Due Date',
            hint: 'mm/dd/yy',
            controller: controller.dueDateController,
            icon: IconButton(
              onPressed: () => controller.datePicker(context), 
              icon: Icon(Icons.calendar_today_outlined)
            ),
          ),
          const SizedBox(height: 25,),
          PriorityLevel(
            onSelected: (level) {
              controller.setPriority(level);
            },
          ),
          const SizedBox(height: 25,),
          CustomForm(
            tag: 'Description',
            hint: 'Details about this task...', 
            line: 5,
            controller: controller.descriptionController
          ),
          const SizedBox(height: 50,),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.onSecondary
            ),
            child: ElevatedButton(
              onPressed: controller.saveTask, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent
              ),
              child: Text(
                'Save Task',
                style: Theme.of(context).textTheme.displaySmall,
              )
            ),
          ),
          const SizedBox(height: 15,),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Color(0xFF68788f)
              )
            ),
            child: ElevatedButton(
              onPressed: controller.onCancel, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent
              ),
              child: Text(
                'Cancel',
                style: Theme.of(context).textTheme.displayMedium,
              )
            ),
          )
        ],
      )
    );
  }
}