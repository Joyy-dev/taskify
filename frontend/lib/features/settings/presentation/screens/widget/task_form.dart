import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:taskify/core/enums/category.dart';
import 'package:taskify/features/tasks/data/models/task_model.dart';
import 'package:taskify/shared/widgets/custom_form.dart';
import 'package:taskify/features/tasks/presentation/widgets/priority_level.dart';
import 'package:taskify/features/tasks/presentation/controllers/task_form_controllers.dart';

class TaskForm extends StatelessWidget {
  final TaskModel? task;
  const TaskForm({super.key, this.task}); 

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TaskFormControllers>();
    controller.initializeTask(task, context);
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomForm(
            hint: 'e.g. Design System Audit', 
            tag: 'Task Name',
            controller: controller.taskNameController,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Task name is required';
              }
              return null;
            },
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
                child: Obx(() => DropdownButtonFormField<Category>(
                  initialValue: controller.selectedCategory.value,
                  dropdownColor: Theme.of(context).colorScheme.secondary,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(12),
                  ),
                  items: Category.values.map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(
                        category.label,
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    );
                  }).toList(), 
                  onChanged: (value) {
                    if (value != null) {
                      controller.setCategory(value);
                    }
                  },
                )
                )
              ),
            ],
          ),
          const SizedBox(height: 25,),
          Row(
            children: [
              Expanded(
                child: CustomForm(
                  tag: 'Due Date',
                  hint: 'mm/dd/yy',
                  controller: controller.dueDateController,
                  icon: IconButton(
                    onPressed: () => controller.datePicker(context), 
                    icon: Icon(Icons.calendar_today_outlined)
                  ),
                ),
              ),
              Expanded(
                child: CustomForm(
                  tag: 'Due Time',
                  hint: 'Select time',
                  controller: controller.dueTimeController,
                  icon: IconButton(
                    onPressed: () => controller.selectReminderTime(context), 
                    icon: Icon(Icons.alarm)
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 25,),
          Text(
            'Priority'.toUpperCase()
          ),
          const SizedBox(height: 5,),
          Obx(() => PriorityLevel(
            selectedPriority: controller.selectedPriority.value,
            onSelected: (level) {
              controller.setPriority(level);
            }
            )
          ),
          const SizedBox(height: 25,),
          CustomForm(
            tag: 'Description',
            hint: 'Details about this task...', 
            line: 5,
            controller: controller.descriptionController,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Enter a value for description';
              }
              return null;
            },
          ),
          const SizedBox(height: 50,),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.primary
            ),
            child: ElevatedButton(
              onPressed: controller.saveOrUpdateTask, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent
              ),
              child: Text(
                controller.editingTask == null ? 'Save Task' : 'Update Tasks',
              )
              // Obx(() => )               
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
            child: TextButton(
              onPressed: controller.onCancel, 
              child: Text(
                'Cancel',
              )
            ),
          )
        ],
      )
    );
  }
}