import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:taskify/core/enums/priority_levels.dart';
import 'package:taskify/core/services/date_picker.dart';
import 'package:taskify/data/task_model.dart';
import 'package:taskify/features/custom_form.dart';
import 'package:taskify/features/priority_level.dart';
import 'package:taskify/presentation/controllers/task_controllers.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({super.key});

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  final TaskControllers taskControllers = Get.find();
  final _taskNameController = TextEditingController();
  final _dueDateController = TextEditingController();
  final _descriptionController = TextEditingController();
  String selectedCategory = 'Work';
  PriorityLevels? selectedPriority;

  @override
  void dispose() {
    _taskNameController.dispose();
    _dueDateController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _selectDate() async {
    final pickedDate = await datePicker(context);

    if (pickedDate != null) {
      setState(() {
        _dueDateController.text = 
        '${pickedDate.day.toString().padLeft(2, '0')}/'
        '${pickedDate.month.toString().padLeft(2, '0')}/'
        '${pickedDate.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomForm(
            hint: 'e.g. Design System Audit', 
            tag: 'Task Name',
            controller: _taskNameController,
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
                  initialValue: selectedCategory,
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
                    setState(() {
                      selectedCategory = value!;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 25,),
          CustomForm(
            tag: 'Due Date',
            hint: 'mm/dd/yy',
            controller: _dueDateController,
            icon: IconButton(
              onPressed: _selectDate, 
              icon: Icon(Icons.calendar_today_outlined)
            ),
          ),
          const SizedBox(height: 25,),
          PriorityLevel(
            onSelected: (level) {
              selectedPriority = level;
            },
          ),
          const SizedBox(height: 25,),
          CustomForm(
            tag: 'Description',
            hint: 'Details about this task...', 
            line: 5,
            controller: _descriptionController
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
              onPressed: () {
                final task = TaskModel(
                  id: 'T1', 
                  title: _taskNameController.text, 
                  category: selectedCategory, 
                  description: _descriptionController.text, 
                  dueDate: _dueDateController.text, 
                  priority: selectedPriority?.name ?? 'low',
                );
                taskControllers.addTask(task);
                taskControllers.saveAndClose();
                Get.snackbar(
                  'Success', 
                  'Task Added successfully',
                  snackPosition: SnackPosition.TOP
                );
                _taskNameController.clear();
                _descriptionController.clear();
                _dueDateController.clear();
                selectedPriority = null;
                selectedCategory = 'Work';
                setState(() {});
                
              }, 
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
              onPressed: () {}, 
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